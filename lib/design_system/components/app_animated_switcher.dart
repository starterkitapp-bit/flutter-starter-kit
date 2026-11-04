import 'package:flutter/widgets.dart';

import 'package:starter_kit/design_system/tokens/app_motion.dart';

/// A shared fade transition for replacing local UI content.
class AppAnimatedSwitcher extends StatelessWidget {
  /// Creates an animated content switcher.
  const new({
    required this.child,
    super.key,
    this.duration = AppMotion.base,
  });

  /// The currently displayed child. Give changing children distinct keys.
  final Widget child;

  /// The transition duration before reduced-motion preferences are applied.
  final Duration duration;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: AppMotion.durationFor(context, duration),
    switchInCurve: Curves.easeOutCubic,
    switchOutCurve: Curves.easeInCubic,
    transitionBuilder: (child, animation) =>
        FadeTransition(opacity: animation, child: child),
    child: child,
  );
}
