import 'package:flutter/widgets.dart';

import 'package:starter_kit/design_system/tokens/app_spacing.dart';

/// A consistently spaced content section with a caller-styled heading.
class AppSection extends StatelessWidget {
  /// Creates a section with a heading and content.
  const new({
    required this.title,
    required this.child,
    super.key,
    this.description,
  });

  /// The heading widget, styled by the active design system.
  final Widget title;

  /// The section content.
  final Widget child;

  /// Optional supporting text shown below the heading.
  final Widget? description;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      title,
      if (description case final description?) ...<Widget>[
        const SizedBox(height: AppSpacing.xs),
        description,
      ],
      const SizedBox(height: AppSpacing.sm),
      child,
    ],
  );
}
