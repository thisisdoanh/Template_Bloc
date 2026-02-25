part of '../light_theme.dart';

class MyIconButtonTheme extends IconButtonThemeData {
  @override
  ButtonStyle? get style => IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        iconSize: 24.r,
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.standard,
      );
}
