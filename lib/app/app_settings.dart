import 'package:flutter/material.dart';

/// User-controlled application preferences.
@immutable
class AppSettings {
  /// Creates application settings with platform-following defaults.
  const new({
    this.themeMode = ThemeMode.system,
    this.locale,
  });

  /// Theme preference; [ThemeMode.system] follows platform appearance.
  final ThemeMode themeMode;

  /// Language preference; null follows the device language.
  final Locale? locale;

  /// Returns settings with an updated theme preference.
  AppSettings withThemeMode(ThemeMode value) => AppSettings(
    themeMode: value,
    locale: locale,
  );

  /// Returns settings with an updated language preference.
  AppSettings withLocale(Locale? value) => AppSettings(
    themeMode: themeMode,
    locale: value,
  );
}
