import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../design_system/theme/app_theme.dart';
import 'localization/generated/app_localizations.dart';
import 'navigation/app_router.dart';

/// Root application widget and shared framework configuration.
class StarterKitApp extends StatelessWidget {
  /// Creates the root application widget.
  const StarterKitApp({super.key, this.locale});

  /// Optional locale override; null follows the device locale.
  final Locale? locale;

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Flutter Starter Kit',
    debugShowCheckedModeBanner: false,
    routerConfig: appRouter,
    locale: locale,
    theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
    darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
    themeMode: ThemeMode.system,
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
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
