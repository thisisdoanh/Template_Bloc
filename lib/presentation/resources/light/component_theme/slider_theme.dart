part of '../light_theme.dart';

class MySliderTheme extends SliderThemeData {
  MySliderTheme()
    : super(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        activeTrackColor: AppColors.semanticBlue100,
        inactiveTrackColor: AppColors.white4C1,
        activeTickMarkColor: AppColors.white4C1,
        inactiveTickMarkColor: AppColors.semanticBlue100,
        allowedInteraction: SliderInteraction.tapAndSlide,
        overlayColor: AppColors.semanticBlue100.withValues(alpha: 0.2),
        trackHeight: 2.h,
        thumbColor: AppColors.semanticBlue100,
        thumbSize: WidgetStatePropertyAll(Size.fromRadius(4.r)),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
      );
}
