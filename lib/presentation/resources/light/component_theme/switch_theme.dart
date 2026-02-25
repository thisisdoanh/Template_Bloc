part of '../light_theme.dart';

class MySwitchTheme extends SwitchThemeData {
  MySwitchTheme()
    : super(
        trackOutlineWidth: const WidgetStatePropertyAll(2),
        thumbColor: WidgetStateProperty.all<Color>(AppColors.light100),
        trackOutlineColor: WidgetStateProperty.all(AppColors.light100),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.mint400;
          }
          return AppColors.white4C1;
        }),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );
}
