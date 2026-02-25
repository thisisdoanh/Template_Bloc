import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_bloc/presentation/base/base_page.dart';
import 'package:template_bloc/presentation/resources/colors.dart';
import 'package:template_bloc/presentation/resources/styles.dart';
import 'package:template_bloc/presentation/view/pages/splash/splash_bloc.dart';
import 'package:template_bloc/presentation/widgets/app_container.dart';
import 'package:template_bloc/shared/constant/app_constant.dart';

@RoutePage()
class SplashPage extends BasePage<SplashBloc, SplashEvent, SplashState> {
  const SplashPage({super.key}) : super(screenName: 'SplashPage');

  @override
  Widget builder(BuildContext context) {
    return AppContainer(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadiusGeometry.circular(16.r),
              //   child: Assets.images.appIcon.image(width: 139.w, height: 139.w),
              // ),
              24.verticalSpace,
              Text(
                AppConstant.appName.toUpperCase(),
                style: AppStyles.titleXXLBold20(AppColors.dark100),
              ),
            ],
          ),
          Positioned(
            bottom: 36.h,
            left: 16.w,
            right: 16.w,
            child: Column(
              children: [
                SizedBox(
                  width: 30.r,
                  height: 30.r,
                  child: CircularProgressIndicator(
                    color: AppColors.dark100,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 4.r,
                  ),
                ),
                15.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onInitState(BuildContext context) {
    context.read<SplashBloc>().add(const SplashEvent.loadData());
    super.onInitState(context);
  }
}
