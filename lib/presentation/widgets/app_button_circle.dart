import 'package:flutter/material.dart';

import 'package:template_bloc/presentation/widgets/app_touchable.dart';

class AppButtonCircle extends StatelessWidget {
  const AppButtonCircle({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.child,
    this.onPressed,
    this.backgroundColor,
    this.boxShadow,
    this.isIgnoreButton = false,
  });

  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final bool isIgnoreButton;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isIgnoreButton,
      child: AppTouchable(
        onPressed: onPressed,
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: boxShadow,
        ),
        child: child,
      ),
    );
  }
}
