/// Shared motion durations and defaults.
abstract final class AppMotion {
  /// Short feedback and micro-interaction duration.
  static const Duration fast = Duration(milliseconds: 120);

  /// Standard transition duration.
  static const Duration base = Duration(milliseconds: 220);

  /// Slower emphasis or larger transition duration.
  static const Duration slow = Duration(milliseconds: 320);

  /// Maximum recommended duration for routine interface motion.
  static const Duration maximum = Duration(milliseconds: 400);
}
