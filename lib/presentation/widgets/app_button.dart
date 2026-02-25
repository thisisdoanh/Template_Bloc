import 'package:flutter/material.dart';

import 'package:template_bloc/presentation/resources/colors.dart';
import 'package:template_bloc/presentation/resources/styles.dart';
import 'package:template_bloc/presentation/widgets/app_touchable.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.radius,
    this.height,
    this.width,
    this.padding,
    this.text,
    this.textStyle,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.gradient,
    this.decoration,
    this.boxShadow,
    this.border,
  });

  final VoidCallback? onPressed;
  final double radius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final String? text;
  final TextStyle? textStyle;
  final Widget? child;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final BoxDecoration? decoration;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return AppTouchable(
      onPressed: onPressed,
      width: width,
      height: height,
      padding: padding,
      decoration:
          decoration ??
          BoxDecoration(
            color: backgroundColor,
            gradient: backgroundColor != null
                ? null
                : gradient ?? AppColors.primaryLN,
            border: border,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: boxShadow,
          ),
      child:
          child ??
          Text(
            text ?? '',
            textAlign: TextAlign.center,
            style: textStyle ?? AppStyles.titleXLSemi18(AppColors.dark100),
          ),
    );
  }
}
