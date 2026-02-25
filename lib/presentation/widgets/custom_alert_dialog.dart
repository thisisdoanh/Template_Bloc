import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template_bloc/presentation/resources/colors.dart';
import 'package:template_bloc/presentation/resources/styles.dart';
import 'package:template_bloc/shared/extension/widget.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.insetPadding,
    this.backgroundColor,
    this.borderRadius,
    this.title,
    this.content,
    this.actions,
    this.padding,
    this.titlePadding,
    this.contentPadding,
    this.bottomPadding,
    this.topPadding,
    this.bottom,
    this.top,
    this.titleTextStyle,
    this.contentTextStyle,
    this.actionTextStyle,
    this.actionSpacing,
    this.actionItemPadding,
    this.actionPadding,
  });

  final EdgeInsets? insetPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? actionPadding;
  final EdgeInsetsGeometry? bottomPadding;
  final EdgeInsetsGeometry? topPadding;
  final Color? backgroundColor;
  final double? borderRadius;
  final Widget? title;
  final Widget? content;
  final Widget? bottom;
  final Widget? top;
  final List<Widget>? actions;
  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;
  final TextStyle? actionTextStyle;
  final double? actionSpacing;
  final double? actionItemPadding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: insetPadding ?? EdgeInsets.symmetric(horizontal: 32.w),
      backgroundColor: backgroundColor ?? AppColors.light100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 16),
      ),
      child: Container(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (top != null) top!.withPadding(topPadding ?? EdgeInsets.zero),
            if (title != null)
              DefaultTextStyle.merge(
                style:
                    titleTextStyle ??
                    AppStyles.titleXLSemi18(AppColors.dark100),
                child: title!,
              ).withPadding(titlePadding ?? EdgeInsets.zero),
            if (content != null)
              DefaultTextStyle.merge(
                style:
                    contentTextStyle ??
                    AppStyles.bodyXLRegular16(AppColors.dark200),
                child: content!,
              ).withPadding(contentPadding ?? EdgeInsets.zero),
            if (bottom != null)
              bottom!.withPadding(bottomPadding ?? EdgeInsets.zero),
            if (actions != null && actions!.isNotEmpty)
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: DefaultTextStyle.merge(
                  style:
                      contentTextStyle ??
                      AppStyles.bodyXLRegular16(AppColors.mint400),
                  child: TextButtonTheme(
                    data: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor:
                            actionTextStyle?.color ?? AppColors.mint400,
                        textStyle:
                            actionTextStyle ??
                            AppStyles.titleXLSemi16(AppColors.mint400),
                      ),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      alignment: WrapAlignment.end,
                      spacing: actionItemPadding ?? 8.w,
                      children: actions!,
                    ),
                  ),
                ),
              ).withPadding(actionPadding ?? EdgeInsets.zero),
          ],
        ),
      ),
    );
  }
}
