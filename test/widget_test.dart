import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:starter_kit/app/app.dart';
import 'package:starter_kit/app/app_settings_controller.dart';
import 'package:starter_kit/app/app_settings_store.dart';

class MockAppSettingsStore extends Mock implements AppSettingsStore;

Future<void> pumpApp(WidgetTester tester, Locale locale) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appSettingsStoreProvider.overrideWithValue(MockAppSettingsStore()),
      ],
      child: StarterKitApp(locale: locale),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('application renders the English home screen', (tester) async {
    await pumpApp(tester, const Locale('en'));

    expect(find.text('Flutter Starter Kit'), findsOneWidget);
    expect(
      find.text('The reusable application foundation starts here.'),
      findsOneWidget,
    );
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Arabic locale renders translated RTL content', (tester) async {
    await pumpApp(tester, const Locale('ar'));

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
    await pumpApp(tester, const Locale('fr'));

    expect(find.text('Flutter Starter Kit'), findsOneWidget);
    expect(find.text('حزمة Flutter الأساسية'), findsNothing);
  });

  testWidgets('settings route exposes theme and language choices', (
    tester,
  ) async {
    await pumpApp(tester, const Locale('en'));

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    expect(find.text('Appearance'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('System'), findsNWidgets(2));
    expect(find.text('Light'), findsOneWidget);
    expect(find.text('Dark'), findsOneWidget);
  });
}
