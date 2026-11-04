import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import 'package:starter_kit/app/app_settings_controller.dart';
import 'package:starter_kit/app/localization/generated/app_localizations.dart';
import 'package:starter_kit/app/navigation/app_router.dart';
import 'package:starter_kit/design_system/theme/app_theme.dart';

/// Root application widget and shared framework configuration.
class StarterKitApp extends ConsumerWidget {
  /// Creates the root application widget.
  const new({super.key, this.locale});

  /// Optional locale override for controlled embedding and tests.
  final Locale? locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);

    return MaterialApp.router(
      title: 'Flutter Starter Kit',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      locale: locale ?? settings.locale,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
      darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      themeMode: settings.themeMode,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        ...AppLocalizations.localizationsDelegates,
        ...FLocalizations.localizationsDelegates,
      ],
      builder: (context, child) => FTheme(
        data: AppTheme.forBrightness(Theme.brightnessOf(context)),
        child: FToaster(
          child: FTooltipGroup(child: child ?? const SizedBox.shrink()),
        ),
      ),
    );
  }
}
