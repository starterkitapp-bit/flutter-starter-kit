import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:starter_kit/features/home/presentation/home_page.dart';

void main() {
  testWidgets('home page renders the starter kit identity', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: FTheme(
          data: FTheme.neutral.light.touch,
          child: const HomePage(),
        ),
      ),
    );

    expect(find.text('Flutter Starter Kit'), findsOneWidget);
    expect(
      find.text('The reusable application foundation starts here.'),
      findsOneWidget,
    );
  });
}
