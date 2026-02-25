import 'package:cooler_alerts/cooler_alerts.dart';
import 'package:flutter/material.dart';

import 'package:template_bloc/di/di.dart';
import 'package:template_bloc/presentation/resources/colors.dart';
import 'package:template_bloc/presentation/router/router.dart';
import 'package:template_bloc/shared/extension/context.dart';

enum AppAlertType { success, error, warning, confirm, info, loading }

class AppAlertDialog {
  static int countShow = 0;

  static Future show({
    BuildContext? context,
    String? title,
    String? message,
    AppAlertType type = AppAlertType.info,
    bool barrierDismissible = true,
    bool closeOnConfirmBtnTap = true,
    bool showCancelBtn = true,
    VoidCallback? onConfirmBtnTap,
    VoidCallback? onCancelBtnTap,
  }) async {
    context ??= getIt<AppRouter>().navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    increaseDialogCount();
    FocusScope.of(context).unfocus();
    CoolAlertType coolAlertType;
    switch (type) {
      case AppAlertType.success:
        coolAlertType = CoolAlertType.success;
        break;
      case AppAlertType.error:
        coolAlertType = CoolAlertType.error;
        break;
      case AppAlertType.warning:
        coolAlertType = CoolAlertType.warning;
        break;
      case AppAlertType.confirm:
        coolAlertType = CoolAlertType.confirm;
        break;
      case AppAlertType.info:
        coolAlertType = CoolAlertType.info;
        break;
      case AppAlertType.loading:
        showDialog<void>(
          context: context,
          barrierDismissible: barrierDismissible,
          barrierColor: const Color(0x6D000000),
          builder: (BuildContext dialogContext) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: const CircularProgressIndicator(),
              ),
            );
          },
        );
        return;
    }

    if (!context.mounted) {
      return;
    }

    final dialog = await CoolerAlerts.show(
      context: context,
      type: coolAlertType,
      title: title,
      text: message,
      titleTextStyle: context.textTheme.titleMedium,
      barrierDismissible: barrierDismissible,
      showCancelBtn: showCancelBtn,
      onConfirmBtnTap: (context) {
        onConfirmBtnTap?.call();
      },
      onCancelBtnTap: (context) {
        onCancelBtnTap?.call();
      },
      confirmBtnColor: AppColors.primaryDefault,
      closeOnConfirmBtnTap: closeOnConfirmBtnTap,
    );
    decreaseDialogCount();
    return dialog;
  }

  static Future increaseDialogCount() async {
    countShow++;
  }

  static Future decreaseDialogCount() async {
    countShow--;
  }

  static void hide() {
    if (countShow > 0) {
      decreaseDialogCount();
      getIt<AppRouter>().pop();
    }
  }

  static Future hideAll() async {
    while (countShow > 0) {
      decreaseDialogCount();
      getIt<AppRouter>().pop();
    }
  }
}
