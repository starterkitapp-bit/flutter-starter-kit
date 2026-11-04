import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/design_system/components/app_animated_switcher.dart';
import 'package:starter_kit/design_system/motion/app_motion_scope.dart';

void main() {
  testWidgets('renders its child with a fade transition', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: AppMotionScope(
          child: AppAnimatedSwitcher(
            child: Text('First', key: ValueKey<String>('first')),
          ),
        ),
      ),
    );

    expect(find.text('First'), findsOneWidget);
    expect(find.byType(FadeTransition), findsOneWidget);
  });

  testWidgets('respects reduced-motion preferences', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: MediaQueryData(disableAnimations: true),
          child: AppMotionScope(
            child: AppAnimatedSwitcher(
              child: Text('Content', key: ValueKey<String>('content')),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Content'), findsOneWidget);
    expect(tester.binding.transientCallbackCount, 0);
  });
}
