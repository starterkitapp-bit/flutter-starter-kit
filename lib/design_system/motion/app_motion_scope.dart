import 'package:flutter/widgets.dart';

/// Tracks platform motion accessibility settings for the app subtree.
class AppMotionScope extends StatefulWidget {
  /// Creates a scope that exposes the current reduced-motion preference.
  const new({required this.child, super.key});

  /// The subtree that consumes motion preferences.
  final Widget child;

  /// Returns the reduced-motion preference exposed by the nearest scope.
  static bool? maybeReduceMotionOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_AppMotionPreferences>()
      ?.reduceMotion;

  @override
  State<AppMotionScope> createState() => _AppMotionScopeState();
}

class _AppMotionScopeState extends State<AppMotionScope>
    with WidgetsBindingObserver {
  bool _reduceMotion = false;

  bool get _platformRequestsReducedMotion {
    final features = WidgetsBinding.instance.platformDispatcher
        .accessibilityFeatures;
    return (MediaQuery.maybeDisableAnimationsOf(context) ?? false) || features.reduceMotion;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = _platformRequestsReducedMotion;
  }

  @override
  void didChangeAccessibilityFeatures() {
    final nextValue = _platformRequestsReducedMotion;
    if (nextValue != _reduceMotion) {
      setState(() => _reduceMotion = nextValue);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _AppMotionPreferences(
    reduceMotion: _reduceMotion,
    child: widget.child,
  );
}

class _AppMotionPreferences extends InheritedWidget {
  const new({required this.reduceMotion, required super.child});

  final bool reduceMotion;

  @override
  bool updateShouldNotify(_AppMotionPreferences oldWidget) =>
      reduceMotion != oldWidget.reduceMotion;
}
