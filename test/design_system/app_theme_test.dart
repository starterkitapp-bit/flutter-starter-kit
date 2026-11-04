import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter_kit/design_system/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    for (final brightness in Brightness.values) {
      test('keeps Material colors and typography aligned for $brightness', () {
        final foruiTheme = AppTheme.forBrightness(brightness);
        final materialTheme = AppTheme.materialForBrightness(brightness);
        final colors = foruiTheme.colors;

        expect(materialTheme.brightness, brightness);
        expect(materialTheme.colorScheme.primary, colors.primary);
        expect(materialTheme.colorScheme.onPrimary, colors.primaryForeground);
        expect(materialTheme.colorScheme.secondary, colors.secondary);
        expect(
          materialTheme.colorScheme.onSecondary,
          colors.secondaryForeground,
        );
        expect(materialTheme.colorScheme.surface, colors.background);
        expect(materialTheme.colorScheme.onSurface, colors.foreground);
        expect(materialTheme.scaffoldBackgroundColor, colors.background);
        expect(materialTheme.cardColor, colors.card);
        expect(materialTheme.dividerColor, colors.border);
        expect(
          materialTheme.textTheme.bodyMedium?.fontSize,
          foruiTheme.typography.body.sm.fontSize,
        );
        expect(
          materialTheme.textTheme.displayLarge?.fontSize,
          foruiTheme.typography.display.xl5.fontSize,
        );
      });
    }
  });
}
