// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'حزمة Flutter الأساسية';

  @override
  String get homeDescription =>
      'هنا تبدأ البنية الأساسية القابلة لإعادة الاستخدام للتطبيق.';

  @override
  String get settingsAction => 'الإعدادات';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get themeSectionTitle => 'المظهر';

  @override
  String get languageSectionTitle => 'اللغة';

  @override
  String get systemOption => 'حسب النظام';

  @override
  String get lightOption => 'فاتح';

  @override
  String get darkOption => 'داكن';

  @override
  String get englishOption => 'الإنجليزية';

  @override
  String get arabicOption => 'العربية';

  @override
  String get backAction => 'رجوع';
}
