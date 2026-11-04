import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/app/app.dart';

void main() {
  testWidgets('application renders the English home screen', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: StarterKitApp(locale: Locale('en'))),
    );
    await tester.pumpAndSettle();

    expect(find.text('Flutter Starter Kit'), findsOneWidget);
    expect(
      find.text('The reusable application foundation starts here.'),
      findsOneWidget,
    );
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Arabic locale renders translated RTL content', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: StarterKitApp(locale: Locale('ar'))),
    );
    await tester.pumpAndSettle();

    final title = find.text('حزمة Flutter الأساسية');
    expect(title, findsOneWidget);
    expect(Directionality.of(tester.element(title)), TextDirection.rtl);
    expect(
      find.text('هنا تبدأ البنية الأساسية القابلة لإعادة الاستخدام للتطبيق.'),
      findsOneWidget,
    );
    expect(find.text('الإعدادات'), findsOneWidget);
  });

  testWidgets('unsupported locale falls back to English', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: StarterKitApp(locale: Locale('fr'))),
    );
    await tester.pumpAndSettle();

    expect(find.text('Flutter Starter Kit'), findsOneWidget);
    expect(find.text('حزمة Flutter الأساسية'), findsNothing);
  });

  testWidgets('settings route exposes theme and language choices', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: StarterKitApp(locale: Locale('en'))),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    expect(find.text('Appearance'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('System'), findsNWidgets(2));
    expect(find.text('Light'), findsOneWidget);
    expect(find.text('Dark'), findsOneWidget);
  });
}
