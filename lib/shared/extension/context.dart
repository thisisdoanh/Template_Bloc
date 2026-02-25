import 'package:flutter/material.dart';

import 'package:template_bloc/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppLocalizations get l10n => AppLocalizations.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  bool get isLTR => Directionality.of(this) == TextDirection.ltr;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
