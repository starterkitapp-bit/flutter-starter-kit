import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:forui/forui.dart';

import '../design_system/theme/app_theme.dart';
import 'navigation/app_router.dart';

/// Root application widget and shared framework configuration.
class StarterKitApp extends StatelessWidget {
  /// Creates the root application widget.
  const StarterKitApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Flutter Starter Kit',
    debugShowCheckedModeBanner: false,
    routerConfig: appRouter,
    theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
    darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
    themeMode: ThemeMode.system,
    supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
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
