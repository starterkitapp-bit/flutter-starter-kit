import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/design_system/feedback/app_haptics.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('selection feedback sends the platform selection event', () async {
    MethodCall? receivedCall;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (call) async {
          receivedCall = call;
          return null;
        });
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null),
    );

    await AppHaptics.selection();

    expect(receivedCall?.method, 'HapticFeedback.vibrate');
    expect(receivedCall?.arguments, 'HapticFeedbackType.selectionClick');
  });

  test('unsupported haptic channel does not interrupt interaction', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (call) async {
          throw PlatformException(code: 'unavailable');
        });
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null),
    );

    await expectLater(AppHaptics.selection(), completes);
  });
}
