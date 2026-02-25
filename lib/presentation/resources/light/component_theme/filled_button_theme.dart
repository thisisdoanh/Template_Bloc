part of '../light_theme.dart';

class MyFilledButtonTheme extends FilledButtonThemeData {
  @override
  ButtonStyle? get style => FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10).r,
      ),
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap);
}
