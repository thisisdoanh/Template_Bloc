part of '../light_theme.dart';

class MyCheckboxTheme extends CheckboxThemeData {
  MyCheckboxTheme()
    : super(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        checkColor: WidgetStateProperty.all(AppColors.white4C1),
        splashRadius: 5.r,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.mint400;
          }
          return AppColors.white4C1;
        }),
        visualDensity: VisualDensity.comfortable,
      );
}
