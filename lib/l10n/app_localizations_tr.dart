// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get error => 'Hata';

  @override
  String get timeoutErrorOccurred => 'Zaman aşımı hatası oluştu';

  @override
  String get errorSomething => 'Bir hata oluştu...';
}
