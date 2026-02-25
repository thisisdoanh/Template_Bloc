// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get error => 'Ошибка';

  @override
  String get timeoutErrorOccurred => 'Произошла ошибка тайм-аута';

  @override
  String get errorSomething => 'Произошла ошибка...';
}
