import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template_bloc/presentation/resources/colors.dart';

class AppTouchable extends StatefulWidget {
  const AppTouchable({
    super.key,
    required this.onPressed,
    this.onLongPressed,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.rippleColor,
    this.padding,
    this.margin,
    this.outlinedBorder,
    this.decoration,
    this.transform,
    this.alignment,
    this.isShowDialogInternet = true,
    this.timeDebounce = 200,
  });
  final Function()? onPressed;
  final Function()? onLongPressed;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? rippleColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final OutlinedBorder? outlinedBorder;
  final BoxDecoration? decoration;
  final Matrix4? transform;
  final Alignment? alignment;
  final bool isShowDialogInternet;
  final int timeDebounce;

  @override
  State<AppTouchable> createState() => _AppTouchableState();
}

class _AppTouchableState extends State<AppTouchable> {
  Debouncer? _debouncer;

  @override
  void initState() {
    _debouncer = Debouncer(delay: Duration(milliseconds: widget.timeDebounce));
    super.initState();
  }

  @override
  void dispose() {
    _debouncer?.dispose();
    super.dispose();
  }

  BorderRadiusGeometry get borderRadius {
    if (widget.decoration?.shape == BoxShape.circle) {
      return BorderRadius.circular(120);
    }

    if (widget.decoration?.borderRadius == null) {
      return BorderRadius.circular(8.sp);
    }

    if (widget.decoration?.border == null) {
      return widget.decoration?.borderRadius ?? BorderRadius.circular(8.sp);
    }

    final radius = widget.decoration?.borderRadius?.subtract(
      BorderRadius.circular(widget.decoration?.border?.top.width ?? 0),
    );
    return radius ?? BorderRadius.circular(8.sp);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin ?? EdgeInsets.zero,
      decoration: widget.decoration,
      transform: widget.transform,
      alignment: widget.alignment,
      child: TextButton(
        onPressed: () {
          _debouncer?.run(() {
            widget.onPressed?.call();
          });
        },
        onLongPress: widget.onLongPressed ?? () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            widget.backgroundColor ?? Colors.transparent,
          ),
          overlayColor: WidgetStateProperty.all(
            widget.rippleColor ?? Colors.grey.withAlpha(100),
          ),
          foregroundColor: WidgetStateProperty.all(
            widget.foregroundColor ?? AppColors.primaryDefault,
          ),
          shape: WidgetStateProperty.all(
            widget.outlinedBorder ??
                RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          padding: WidgetStateProperty.all(widget.padding ?? EdgeInsets.zero),
          minimumSize: WidgetStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
        ),
        child: widget.child ?? const SizedBox.shrink(),
      ),
    );
  }
}

class Debouncer {
  Debouncer({required this.delay});
  final Duration delay;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
