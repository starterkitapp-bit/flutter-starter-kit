import 'package:flutter/services.dart';

/// Centralized, optional haptic feedback for meaningful user interactions.
abstract final class AppHaptics {
  /// Signals a discrete selection change.
  ///
  /// Unsupported platforms and test environments gracefully fall back to no
  /// haptic feedback; they do not interrupt the interaction.
  static Future<void> selection() async {
    try {
      await HapticFeedback.selectionClick();
    } on PlatformException {
      // Haptics are an enhancement, never a requirement for interaction.
    } on MissingPluginException {
      // Native haptic support may be unavailable in an embedding or test.
    }
  }
}
