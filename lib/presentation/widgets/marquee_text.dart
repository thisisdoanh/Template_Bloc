import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

class MarqueeText extends StatelessWidget {
  const MarqueeText(
    this.text, {
    super.key,
    this.style,
    this.blankSpace = 20,
    this.padding = 10,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final double blankSpace;
  final double padding;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        );
        painter.layout();
        final overflow = painter.size.width > (constraints.maxWidth - padding);
        if (overflow) {
          return SizedBox(
            height: height,
            child: Marquee(
              text: text,
              style: style,
              blankSpace: blankSpace,
              pauseAfterRound: const Duration(milliseconds: 500),
              velocity: 60,
              accelerationDuration: const Duration(milliseconds: 500),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          );
        }
        return Text(text, style: style, textAlign: textAlign);
      },
    );
  }

  double get height {
    if (style?.height != null) {
      return style!.height! * (style?.fontSize ?? 14.sp);
    }
    return (style?.fontSize ?? 14.sp) + 2.h;
  }
}
