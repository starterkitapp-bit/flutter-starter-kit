import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:starter_kit/app/app_settings_controller.dart';
import 'package:starter_kit/app/app_settings_store.dart';

class MockAppSettingsStore extends Mock implements AppSettingsStore;

void main() {
  test('updates and persists theme preference', () async {
    final store = MockAppSettingsStore();
    when(
      () => store.saveThemeMode(ThemeMode.dark),
    ).thenAnswer((_) async {});

    final container = ProviderContainer(
      overrides: [appSettingsStoreProvider.overrideWithValue(store)],
    );
    addTearDown(container.dispose);

    await container
        .read(appSettingsProvider.notifier)
        .setThemeMode(ThemeMode.dark);

    expect(container.read(appSettingsProvider).themeMode, ThemeMode.dark);
    verify(() => store.saveThemeMode(ThemeMode.dark)).called(1);
  });

  test('updates and persists language preference', () async {
    final store = MockAppSettingsStore();
    when(
      () => store.saveLocale(const Locale('ar')),
    ).thenAnswer((_) async {});

    final container = ProviderContainer(
      overrides: [
        appSettingsStoreProvider.overrideWithValue(store),
        appSettingsProvider.overrideWith(
          () => AppSettingsController(),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container
        .read(appSettingsProvider.notifier)
        .setLocale(const Locale('ar'));

    expect(container.read(appSettingsProvider).locale, const Locale('ar'));
    verify(() => store.saveLocale(const Locale('ar'))).called(1);
  });
}
