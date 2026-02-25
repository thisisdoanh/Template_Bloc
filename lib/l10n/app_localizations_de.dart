// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get error => 'Fehler';

  @override
  String get timeoutErrorOccurred => 'Zeitüberschreitungsfehler aufgetreten';

  @override
  String get errorSomething => 'Etwas ist schief gelaufen...';
}
