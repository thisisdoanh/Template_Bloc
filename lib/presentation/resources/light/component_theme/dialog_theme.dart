part of '../light_theme.dart';

class MyDialogTheme extends DialogThemeData {
  @override
  Color? get surfaceTintColor => Colors.white;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10).r,
      );
}
