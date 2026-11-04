import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/app/app.dart';

void main() {
  testWidgets('application opens the starter kit home route', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: StarterKitApp()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Flutter Starter Kit'), findsOneWidget);
    expect(
      find.text('The reusable application foundation starts here.'),
      findsOneWidget,
    );
  });
}
