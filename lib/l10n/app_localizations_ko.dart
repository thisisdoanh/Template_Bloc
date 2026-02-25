// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get error => '오류';

  @override
  String get timeoutErrorOccurred => '시간 초과 오류가 발생했습니다';

  @override
  String get errorSomething => '문제가 발생했습니다...';
}
