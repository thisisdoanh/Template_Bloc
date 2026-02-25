import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template_bloc/presentation/resources/colors.dart';

part 'component_theme/dialog_theme.dart';
part 'component_theme/filled_button_theme.dart';
part 'component_theme/icon_button_theme.dart';
part 'component_theme/outlined_button_theme.dart';
part 'component_theme/switch_theme.dart';
part 'component_theme/text_button_theme.dart';
part 'component_theme/text_theme.dart';
part 'component_theme/checkbox_theme.dart';
part 'component_theme/slider_theme.dart';

ThemeData lightThemeData = ThemeData(
  colorScheme: ColorScheme.light(primary: AppColors.primaryDefault),
  useMaterial3: true,
  textTheme: MyTextTheme(),
  dialogTheme: MyDialogTheme(),
  filledButtonTheme: MyFilledButtonTheme(),
  iconButtonTheme: MyIconButtonTheme(),
  outlinedButtonTheme: MyOutlinedButtonTheme(),
  textButtonTheme: MyTextButtonTheme(),
  switchTheme: MySwitchTheme(),
  checkboxTheme: MyCheckboxTheme(),
  sliderTheme: MySliderTheme(),
);
