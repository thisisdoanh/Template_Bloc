import 'package:flutter/material.dart';

class GetSizeWidget extends StatelessWidget {
  const GetSizeWidget({super.key, required this.child, required this.onSizeChanged});

  final Widget child;
  final Function(Size size) onSizeChanged;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PainterSize(
        onSizeChanged: (size) {
          onSizeChanged.call(size);
        },
      ),
      child: child,
    );
  }
}

class PainterSize extends CustomPainter {
  PainterSize({super.repaint, required this.onSizeChanged});

  final Function(Size size) onSizeChanged;
  @override
  void paint(Canvas canvas, Size size) {
    onSizeChanged(size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
