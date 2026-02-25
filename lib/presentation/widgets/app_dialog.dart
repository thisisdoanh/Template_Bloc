import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_bloc/di/di.dart';
import 'package:template_bloc/presentation/resources/colors.dart';
import 'package:template_bloc/presentation/router/router.dart';
import 'package:template_bloc/presentation/widgets/app_button.dart';
import 'package:template_bloc/shared/extension/widget.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    this.title = '',
    this.message = '',
    this.titleWidget,
    this.messageWidget,
    this.fullContentWidget,
    this.widthDialog,
    this.topWidget,
    this.bottomWidget,
    this.isShowButton = true,
    this.isGroupButton = true,
    this.isButtonHorizontal = false,
    this.firstButtonText = '',
    this.secondButtonText = '',
    this.firstButtonCallback,
    this.secondButtonCallback,
    this.titleTextStyle,
    this.messageTextStyle,
    this.contentPadding,
    this.titlePadding,
    this.messagePadding,
    this.topPadding,
    this.bottomPadding,
    this.buttonPadding,
    this.radiusButton = 100,
  });

  final String title;
  final String message;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;
  final Widget? fullContentWidget;
  final Widget? titleWidget;
  final Widget? messageWidget;
  final Widget? topWidget;
  final Widget? bottomWidget;
  final double? widthDialog;
  final EdgeInsets? contentPadding;
  final EdgeInsets? titlePadding;
  final EdgeInsets? messagePadding;
  final EdgeInsets? topPadding;
  final EdgeInsets? bottomPadding;
  final EdgeInsets? buttonPadding;
  final bool isShowButton;
  final bool isGroupButton;
  final bool isButtonHorizontal;
  final String firstButtonText;
  final String secondButtonText;
  final VoidCallback? firstButtonCallback;
  final VoidCallback? secondButtonCallback;
  final double radiusButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthDialog ?? 320.w,
      padding: contentPadding ?? EdgeInsets.zero,
      child:
          fullContentWidget ??
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (topWidget ?? const SizedBox.shrink()).withPadding(
                topPadding ?? EdgeInsets.zero,
              ),
              (titleWidget ??
                      (title != ''
                          ? Text(
                              title,
                              style: titleTextStyle,
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox.shrink()))
                  .withPadding(titlePadding ?? EdgeInsets.zero),
              (messageWidget ??
                      (message != ''
                          ? Text(
                              message,
                              style: messageTextStyle,
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox.shrink()))
                  .withPadding(messagePadding ?? EdgeInsets.zero),
              (bottomWidget ?? const SizedBox.shrink()).withPadding(
                bottomPadding ?? EdgeInsets.zero,
              ),
              if (isShowButton)
                _buildGroupButton().withPadding(
                  buttonPadding ?? EdgeInsets.zero,
                )
              else
                const SizedBox.shrink(),
            ],
          ),
    );
  }

  Widget _buildGroupButton() {
    if (!isGroupButton) {
      return AppButton(
        onPressed: () {
          getIt<AppRouter>().pop();

          firstButtonCallback?.call();
        },
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: AppColors.primaryLN,
        ),
        text: firstButtonText,
        radius: radiusButton,
      );
    }

    if (isButtonHorizontal) {
      return Row(
        spacing: 16.w,
        children: [
          Expanded(
            child: AppButton(
              onPressed: () {
                getIt<AppRouter>().pop();

                firstButtonCallback?.call();
              },
              width: double.infinity,
              height: 46.h,
              radius: radiusButton,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.dark200, width: 1.5.w),
              ),
              text: firstButtonText,
            ),
          ),
          Expanded(
            child: AppButton(
              onPressed: () {
                getIt<AppRouter>().pop();

                secondButtonCallback?.call();
              },
              width: double.infinity,
              height: 46.h,
              radius: radiusButton,
              text: secondButtonText,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        AppButton(
          onPressed: () {
            getIt<AppRouter>().pop();

            firstButtonCallback?.call();
          },
          width: double.infinity,
          height: 56.h,
          radius: radiusButton,
          text: firstButtonText,
        ),
        2.verticalSpace,
        AppButton(
          onPressed: () {
            getIt<AppRouter>().pop();

            secondButtonCallback?.call();
          },
          width: double.infinity,
          height: 56.h,
          radius: radiusButton,
          text: secondButtonText,
        ),
      ],
    );
  }
}
