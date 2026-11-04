import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

/// Central source of truth for the Forui theme selected by app brightness.
abstract final class AppTheme {
  /// Returns the matching mobile touch theme for the resolved brightness.
  static FThemeData forBrightness(Brightness brightness) =>
      brightness == Brightness.light
      ? FTheme.neutral.light.touch
      : FTheme.neutral.dark.touch;
}
