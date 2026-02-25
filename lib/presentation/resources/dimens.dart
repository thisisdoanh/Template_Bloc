import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  Dimens._();

  static double paddingTop = 0;
  static double paddingBottom = 0;

  static bool isCanSetPadding = true;

  static void updatePaddingDevice(BuildContext context) {
    if (!isCanSetPadding) {
      return;
    }

    isCanSetPadding = false;
    final padding = MediaQuery.of(context).padding;
    paddingTop = padding.top > 10.h ? 0 : 16.h;
    paddingBottom = padding.bottom;
  }
}
