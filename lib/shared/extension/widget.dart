import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  /// Padding all sides
  Widget paddingAll(double value) => withPadding(EdgeInsets.all(value));

  /// Padding symmetric horizontal & vertical
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      withPadding(
        EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      );

  /// Padding only (top, left, right, bottom)
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => withPadding(
    EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
  );
}
