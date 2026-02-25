part of '../light_theme.dart';

class MyOutlinedButtonTheme extends OutlinedButtonThemeData {
  @override
  ButtonStyle? get style => OutlinedButton.styleFrom(
    side: BorderSide(color: AppColors.primaryDefault),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
    textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
    foregroundColor: AppColors.primaryDefault,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
