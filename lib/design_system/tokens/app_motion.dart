import 'package:flutter/widgets.dart';

import 'package:starter_kit/design_system/motion/app_motion_scope.dart';

/// Shared motion durations and accessibility-aware timing helpers.
abstract final class AppMotion {
  /// Short feedback and micro-interaction duration.
  static const Duration fast = Duration(milliseconds: 120);

  /// Standard transition duration.
  static const Duration base = Duration(milliseconds: 220);

  /// Slower emphasis or larger transition duration.
  static const Duration slow = Duration(milliseconds: 320);

  /// Maximum recommended duration for routine interface motion.
  static const Duration maximum = Duration(milliseconds: 400);

  /// Whether non-essential motion should be removed or simplified.
  static bool shouldReduceMotion(BuildContext context) =>
      AppMotionScope.maybeReduceMotionOf(context) ??
      ((MediaQuery.maybeDisableAnimationsOf(context) ?? false) ||
          WidgetsBinding
              .instance
              .platformDispatcher
              .accessibilityFeatures
              .reduceMotion);

  /// Returns zero duration when the platform requests reduced motion.
  static Duration durationFor(BuildContext context, Duration duration) =>
      shouldReduceMotion(context) ? Duration.zero : duration;
}
