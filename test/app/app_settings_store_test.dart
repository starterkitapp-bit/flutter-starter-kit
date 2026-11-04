import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:starter_kit/app/app_settings_store.dart';

class MockSharedPreferencesAsync extends Mock implements SharedPreferencesAsync;

void main() {
  late MockSharedPreferencesAsync preferences;
  late AppSettingsStore store;

  setUp(() {
    preferences = MockSharedPreferencesAsync();
    store = AppSettingsStore(preferences);
  });

  test('loads persisted theme and language preferences', () async {
    when(() => preferences.getString('starter_kit.theme_mode'))
        .thenAnswer((_) async => 'dark');
    when(() => preferences.getString('starter_kit.locale'))
        .thenAnswer((_) async => 'ar');

    final settings = await store.load();

    expect(settings.themeMode, ThemeMode.dark);
    expect(settings.locale, const Locale('ar'));
  });

  test('unknown stored values fall back to system preferences', () async {
    when(() => preferences.getString('starter_kit.theme_mode'))
        .thenAnswer((_) async => 'unknown');
    when(() => preferences.getString('starter_kit.locale'))
        .thenAnswer((_) async => 'fr');

    final settings = await store.load();

    expect(settings.themeMode, ThemeMode.system);
    expect(settings.locale, isNull);
  });

  test('system language preference removes the saved override', () async {
    when(() => preferences.remove('starter_kit.locale'))
        .thenAnswer((_) async {});

    await store.saveLocale(null);

    verify(() => preferences.remove('starter_kit.locale')).called(1);
  });
}
