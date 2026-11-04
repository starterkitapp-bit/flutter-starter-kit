import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/app_settings.dart';
import 'app/app_settings_controller.dart';
import 'core/storage/app_settings_store.dart';

/// Loads essential preferences before presenting the Flutter application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final store = AppSettingsStore(SharedPreferencesAsync());
  AppSettings initialSettings;

  try {
    initialSettings = await store.load();
  } catch (error, stackTrace) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'application bootstrap',
        context: ErrorDescription('while loading saved application settings'),
      ),
    );
    initialSettings = const AppSettings();
  }

  runApp(
    ProviderScope(
      overrides: <Override>[
        appSettingsStoreProvider.overrideWithValue(store),
        appSettingsProvider.overrideWith(
          () => AppSettingsController(initialSettings: initialSettings),
        ),
      ],
      child: const StarterKitApp(),
    ),
  );
}
