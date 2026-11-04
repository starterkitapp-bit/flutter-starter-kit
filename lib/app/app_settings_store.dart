import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:starter_kit/app/app_settings.dart';

/// Persists small, non-sensitive application preferences.
class AppSettingsStore {
  /// Creates a store backed by asynchronous platform preferences.
  new(this._preferences);

  static const String _themeModeKey = 'starter_kit.theme_mode';
  static const String _localeKey = 'starter_kit.locale';

  final SharedPreferencesAsync _preferences;

  /// Loads settings, using safe defaults for missing or unknown values.
  Future<AppSettings> load() async {
    final themeValue = await _preferences.getString(_themeModeKey);
    final localeValue = await _preferences.getString(_localeKey);

    final themeMode = switch (themeValue) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };

    final locale = switch (localeValue) {
      'en' => const Locale('en'),
      'ar' => const Locale('ar'),
      _ => null,
    };

    return AppSettings(themeMode: themeMode, locale: locale);
  }

  /// Persists the selected theme mode.
  Future<void> saveThemeMode(ThemeMode themeMode) =>
      _preferences.setString(_themeModeKey, themeMode.name);

  /// Persists a language override, or removes it to follow the device.
  Future<void> saveLocale(Locale? locale) async {
    if (locale == null) {
      await _preferences.remove(_localeKey);
      return;
    }

    if (locale.languageCode != 'en' && locale.languageCode != 'ar') {
      throw ArgumentError.value(locale, 'locale', 'Unsupported app locale.');
    }

    await _preferences.setString(_localeKey, locale.languageCode);
  }
}
