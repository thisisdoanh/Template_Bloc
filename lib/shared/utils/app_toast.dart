import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class AppToast {
  factory AppToast() => instance;
  AppToast._internal();

  static final AppToast instance = AppToast._internal();

  Future<void> show({
    BuildContext? context,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Widget? icon,
    Widget? title,
    Widget? description,
    Border? border,
    double? spacingIcon,
    double? spacingContent,
    EdgeInsets? padding,
    EdgeInsets? margin,
    List<BoxShadow>? shadows,
    ToastPosition? position,
  }) async {
    showToastWidget(
      Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: border,
          boxShadow: shadows,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacingIcon ?? 0,
          children: [
            ?icon,
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: spacingContent ?? 0,
              children: [?title, ?description],
            ),
          ],
        ),
      ),
      position: position ?? ToastPosition.top,
      context: context,
    );
  }
}
