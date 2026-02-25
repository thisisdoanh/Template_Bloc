import 'package:flutter/material.dart';
import 'package:template_bloc/gen/assets.gen.dart';
import 'package:template_bloc/presentation/resources/colors.dart';
import 'package:template_bloc/shared/extension/context.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.appBar,
    this.onPopInvoked,
    this.bottomNavigationBar,
    this.child,
    this.backgroundColor,
    this.coverScreenWidget,
    this.resizeToAvoidBottomInset = false,
    this.canPop = false,
    this.floatingActionButton,
    this.backgroundImage,
    this.backgroundGradientColor,
    this.backgroundImageFit,
  });

  final PreferredSizeWidget? appBar;
  final bool canPop;
  final Function(bool, dynamic)? onPopInvoked;
  final Widget? bottomNavigationBar;
  final Widget? child;
  final Color? backgroundColor;
  final Gradient? backgroundGradientColor;
  final Widget? coverScreenWidget;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final AssetGenImage? backgroundImage;
  final BoxFit? backgroundImageFit;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvoked,
      child: Stack(
        children: [
          if (backgroundGradientColor != null)
            Positioned.fill(
              child: Container(decoration: BoxDecoration(gradient: backgroundGradientColor)),
            ),
          if (backgroundImage != null)
            backgroundImage!.image(
              width: double.infinity,
              height: double.infinity,
              fit: backgroundImageFit ?? BoxFit.cover,
            ),
          Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            backgroundColor: backgroundImage != null || backgroundGradientColor != null
                ? AppColors.transparent
                : (backgroundColor ?? context.theme.scaffoldBackgroundColor),
            appBar: appBar,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: child ?? const SizedBox.shrink(),
            ),
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavigationBar,
          ),
          coverScreenWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
