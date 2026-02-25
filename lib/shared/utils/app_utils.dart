import 'package:flutter/material.dart';

class AppUtils {
  factory AppUtils() {
    return instance;
  }

  AppUtils._internal();

  static final AppUtils instance = AppUtils._internal();

  Size getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.size;
  }
}
