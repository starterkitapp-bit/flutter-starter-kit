import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/design_system/tokens/app_motion.dart';
import 'package:starter_kit/design_system/motion/app_motion_scope.dart';

void main() {
  testWidgets('reduced motion removes custom transition duration', (
    tester,
  ) async {
    var reducedMotion = false;
    var duration = const Duration(milliseconds: 220);

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(disableAnimations: true),
        child: AppMotionScope(
          child: Builder(
            builder: (context) {
              reducedMotion = AppMotion.shouldReduceMotion(context);
              duration = AppMotion.durationFor(
                context,
                const Duration(milliseconds: 220),
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );

    expect(reducedMotion, isTrue);
    expect(duration, Duration.zero);
  });

  testWidgets('normal motion keeps the requested duration', (tester) async {
    var duration = Duration.zero;

    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: AppMotionScope(
          child: Builder(
            builder: (context) {
              duration = AppMotion.durationFor(
                context,
                const Duration(milliseconds: 220),
              );
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );

    expect(duration, const Duration(milliseconds: 220));
  });
}
