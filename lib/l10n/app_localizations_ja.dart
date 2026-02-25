// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get error => 'エラー';

  @override
  String get timeoutErrorOccurred => 'タイムアウトエラーが発生しました';

  @override
  String get errorSomething => '何か問題が発生しました...';
}
