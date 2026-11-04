import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

/// Central source of truth for the Forui and Material application themes.
abstract final class AppTheme {
  /// Returns the matching mobile touch theme for the resolved brightness.
  static FThemeData forBrightness(Brightness brightness) =>
      brightness == Brightness.light
      ? FTheme.neutral.light.touch
      : FTheme.neutral.dark.touch;

  /// Maps the active Forui palette and type scale to Material widgets.
  ///
  /// This keeps Material components aligned with the same neutral colors and
  /// typography used by Forui instead of relying on an unrelated default theme.
  static ThemeData materialForBrightness(Brightness brightness) {
    final foruiTheme = forBrightness(brightness);
    final colors = foruiTheme.colors;
    final typography = foruiTheme.typography;

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: colors.brightness,
        primary: colors.primary,
        onPrimary: colors.primaryForeground,
        secondary: colors.secondary,
        onSecondary: colors.secondaryForeground,
        error: colors.error,
        onError: colors.errorForeground,
        surface: colors.background,
        onSurface: colors.foreground,
        outline: colors.border,
      ),
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.card,
      dividerColor: colors.border,
      disabledColor: colors.disable(colors.foreground),
      textTheme: TextTheme(
        displayLarge: typography.display.xl5,
        displayMedium: typography.display.xl4,
        displaySmall: typography.display.xl3,
        headlineLarge: typography.display.xl2,
        headlineMedium: typography.display.xl,
        headlineSmall: typography.display.lg,
        titleLarge: typography.body.lg,
        titleMedium: typography.body.md,
        titleSmall: typography.body.sm,
        bodyLarge: typography.body.md,
        bodyMedium: typography.body.sm,
        bodySmall: typography.body.xs2,
        labelLarge: typography.body.sm,
        labelMedium: typography.body.xs,
        labelSmall: typography.body.xs2,
      ),
    );
  }
}
