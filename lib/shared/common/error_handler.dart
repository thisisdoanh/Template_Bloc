import 'package:flutter/material.dart';
import 'package:template_bloc/global.dart';
import 'package:template_bloc/shared/common/error_entity/error_entity.dart';
import 'package:template_bloc/shared/extension/context.dart';
import 'package:template_bloc/shared/utils/alert.dart';

abstract class ErrorHandler {
  static final _errorList = <String>[];

  static void handle(Object error, {VoidCallback? onPressed}) {
    final message = error is ErrorEntity
        ? error.message
        : Global.instance.context.l10n.errorSomething;

    if (_errorList.contains(message)) {
      return;
    }

    _errorList.add(message);

    void onConfirm() {
      onPressed?.call();
      _errorList.remove(message);
    }

    _showErrorDialog(message, onPressed: onConfirm);
  }

  static void _showErrorDialog(String message, {VoidCallback? onPressed}) {
    AppAlertDialog.show(
      title: Global.instance.context.l10n.error,
      message: message,
      type: AppAlertType.error,
      onConfirmBtnTap: onPressed,
      barrierDismissible: false,
      showCancelBtn: false,
    );
  }
}
