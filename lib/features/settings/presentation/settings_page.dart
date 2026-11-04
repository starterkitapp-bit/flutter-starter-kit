import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import 'package:starter_kit/app/app_settings_controller.dart';
import 'package:starter_kit/app/localization/generated/app_localizations.dart';
import 'package:starter_kit/design_system/tokens/app_spacing.dart';

/// Allows users to choose their appearance and language preferences.
class SettingsPage extends ConsumerWidget {
  /// Creates the application settings screen.
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);
    final controller = ref.read(appSettingsProvider.notifier);
    final localizations = AppLocalizations.of(context);

    return FScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: FButton(
                    onPress: () => context.pop(),
                    child: Text(localizations.backAction),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  localizations.settingsTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  localizations.themeSectionTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                FTile(
                  title: Text(localizations.systemOption),
                  selected: settings.themeMode == ThemeMode.system,
                  onPress: () => _save(
                    () => controller.setThemeMode(ThemeMode.system),
                  ),
                ),
                FTile(
                  title: Text(localizations.lightOption),
                  selected: settings.themeMode == ThemeMode.light,
                  onPress: () => _save(
                    () => controller.setThemeMode(ThemeMode.light),
                  ),
                ),
                FTile(
                  title: Text(localizations.darkOption),
                  selected: settings.themeMode == ThemeMode.dark,
                  onPress: () => _save(
                    () => controller.setThemeMode(ThemeMode.dark),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  localizations.languageSectionTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                FTile(
                  title: Text(localizations.systemOption),
                  selected: settings.locale == null,
                  onPress: () => _save(() => controller.setLocale(null)),
                ),
                FTile(
                  title: Text(localizations.englishOption),
                  selected: settings.locale?.languageCode == 'en',
                  onPress: () => _save(
                    () => controller.setLocale(const Locale('en')),
                  ),
                ),
                FTile(
                  title: Text(localizations.arabicOption),
                  selected: settings.locale?.languageCode == 'ar',
                  onPress: () => _save(
                    () => controller.setLocale(const Locale('ar')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _save(Future<void> Function() update) async {
    try {
      await update();
    } catch (error, stackTrace) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
          library: 'application settings',
          context: ErrorDescription('while saving a user preference'),
        ),
      );
    }
  }
}
