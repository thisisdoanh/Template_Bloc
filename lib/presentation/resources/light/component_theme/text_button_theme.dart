part of '../light_theme.dart';

class MyTextButtonTheme extends TextButtonThemeData {
  @override
  ButtonStyle? get style => TextButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 14.sp,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
}
