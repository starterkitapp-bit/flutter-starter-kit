import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import 'package:starter_kit/app/localization/generated/app_localizations.dart';
import 'package:starter_kit/design_system/tokens/app_spacing.dart';

/// Minimal entry screen for validating the shared application foundation.
class HomePage extends StatelessWidget {
  /// Creates the starter kit entry screen.
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return FScaffold(
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  localizations.appTitle,
                  style: context.theme.typography.display.lg,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  localizations.homeDescription,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                FButton(
                  onPress: () => context.go('/settings'),
                  child: Text(localizations.settingsAction),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
