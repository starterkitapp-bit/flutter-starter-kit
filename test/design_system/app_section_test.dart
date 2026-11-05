import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:starter_kit/design_system/components/app_section.dart';

void main() {
  testWidgets('exposes its title as a semantic heading', (tester) async {
    final semantics = tester.ensureSemantics();
    addTearDown(semantics.dispose);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: AppSection(
          title: Text('Section title'),
          child: Text('Section content'),
        ),
      ),
    );

    expect(
      tester.getSemantics(find.text('Section title')).hasFlag(
        SemanticsFlag.isHeader,
      ),
      isTrue,
    );
  });

  testWidgets('keeps the section content available to semantics', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    addTearDown(semantics.dispose);

    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.rtl,
        child: AppSection(
          title: Text('عنوان القسم'),
          child: Text('محتوى القسم'),
        ),
      ),
    );

    expect(find.text('عنوان القسم'), findsOneWidget);
    expect(find.text('محتوى القسم'), findsOneWidget);
    expect(
      tester.getSemantics(find.text('عنوان القسم')).hasFlag(
        SemanticsFlag.isHeader,
      ),
      isTrue,
    );
  });
}
