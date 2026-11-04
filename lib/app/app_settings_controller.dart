import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:starter_kit/app/app_settings.dart';
import 'package:starter_kit/app/app_settings_store.dart';

/// Provides the platform-backed application settings store.
final appSettingsStoreProvider = Provider<AppSettingsStore>(
  (ref) => AppSettingsStore(SharedPreferencesAsync()),
);

/// Exposes the current theme and language preferences.
final appSettingsProvider =
    NotifierProvider<AppSettingsController, AppSettings>(
      AppSettingsController.new,
    );

/// Updates preferences immediately and serializes their persistence writes.
class AppSettingsController extends Notifier<AppSettings> {
  /// Creates a controller with optional settings loaded during bootstrap.
  new({this.initialSettings = const AppSettings()});

  /// Settings loaded before the widget tree starts.
  final AppSettings initialSettings;

  late final AppSettingsStore _store;
  Future<void> _writeQueue = Future<void>.value();

  @override
  AppSettings build() {
    _store = ref.watch(appSettingsStoreProvider);
    return initialSettings;
  }

  /// Changes the active theme and persists the preference.
  Future<void> setThemeMode(ThemeMode themeMode) {
    state = state.withThemeMode(themeMode);
    return _enqueue(() => _store.saveThemeMode(themeMode));
  }

  /// Changes the active language; null means follow the device.
  Future<void> setLocale(Locale? locale) {
    if (locale != null &&
        locale.languageCode != 'en' &&
        locale.languageCode != 'ar') {
      throw ArgumentError.value(locale, 'locale', 'Unsupported app locale.');
    }

    state = state.withLocale(locale);
    return _enqueue(() => _store.saveLocale(locale));
  }

  Future<void> _enqueue(Future<void> Function() write) {
    final operation = _writeQueue.then((_) => write());
    _writeQueue = operation.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return operation;
  }
}
