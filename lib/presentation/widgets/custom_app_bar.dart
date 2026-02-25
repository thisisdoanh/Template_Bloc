import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template_bloc/di/di.dart';
import 'package:template_bloc/gen/assets.gen.dart';
import 'package:template_bloc/presentation/resources/colors.dart';
import 'package:template_bloc/presentation/resources/dimens.dart';
import 'package:template_bloc/presentation/resources/styles.dart';
import 'package:template_bloc/presentation/router/router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.titleText,
    this.titleWidget,
    this.style,
    this.actions,
    this.showBackButton,
    this.centerTitle = true,
    this.leadingWidth,
    this.onBackButtonPressed,
    this.backgroundColor,
    this.leading,
    this.padding,
    this.bottomWidget,
    this.bottomText,
    this.bottomStyle,
    this.colorBack,
  });

  final Widget? titleWidget;
  final Widget? bottomWidget;
  final String? titleText;
  final String? bottomText;
  final TextStyle? style;
  final TextStyle? bottomStyle;
  final List<Widget>? actions;
  final bool? showBackButton;
  final bool? centerTitle;
  final double? leadingWidth;
  final VoidCallback? onBackButtonPressed;
  final Color? backgroundColor;
  final Widget? leading;
  final EdgeInsetsGeometry? padding;
  final Color? colorBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (padding ?? EdgeInsets.zero).add(EdgeInsetsGeometry.only(top: Dimens.paddingTop)),
      child: AppBar(
        centerTitle: centerTitle,
        backgroundColor: backgroundColor ?? Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: IgnorePointer(
          child:
              titleWidget ??
              Text(titleText ?? '', style: style ?? AppStyles.titleXLBold18(AppColors.light200)),
        ),
        bottom: bottomWidget != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(30.h),
                child: IgnorePointer(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        bottomWidget ??
                        Text(
                          bottomText ?? '',
                          style: bottomStyle ?? AppStyles.bodyLMedium14(AppColors.light200),
                        ),
                  ),
                ),
              )
            : null,
        titleSpacing: 16.w,
        toolbarHeight: kToolbarHeight.h,
        scrolledUnderElevation: 0,
        actions: actions ?? [],
        automaticallyImplyLeading: false,
        leadingWidth: 40.w,
        leading:
            leading ??
            (showBackButton ?? getIt<AppRouter>().canPop()
                ? IconButton(
                    onPressed: onBackButtonPressed ?? getIt<AppRouter>().pop,
                    icon: Assets.icons.arrowLeft.svg(
                      width: 24.w,
                      height: 24.h,
                      colorFilter: colorBack != null
                          ? ColorFilter.mode(colorBack!, BlendMode.srcIn)
                          : null,
                    ),
                    tooltip: 'Back',
                  )
                : null),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
