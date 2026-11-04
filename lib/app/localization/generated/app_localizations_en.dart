// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Starter Kit';

  @override
  String get homeDescription =>
      'The reusable application foundation starts here.';

  @override
  String get settingsAction => 'Settings';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get themeSectionTitle => 'Appearance';

  @override
  String get languageSectionTitle => 'Language';

  @override
  String get systemOption => 'System';

  @override
  String get lightOption => 'Light';

  @override
  String get darkOption => 'Dark';

  @override
  String get englishOption => 'English';

  @override
  String get arabicOption => 'Arabic';

  @override
  String get backAction => 'Back';
}
