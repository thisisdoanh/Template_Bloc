import 'package:flutter/material.dart';

class AppIgnoreButton extends StatelessWidget {
  const AppIgnoreButton({
    super.key,
    required this.child,
    this.isIgnore = false,
    this.opacity = 1,
  });

  final Widget child;
  final bool isIgnore;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isIgnore ? opacity : 1.0,
      child: IgnorePointer(ignoring: isIgnore, child: child),
    );
  }
}
