import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class RippleAnim extends StatelessWidget {
  final String logoPath;
  final Color? color;
  final int? delay;
  final bool? repeat;
  final double? minRadius;
  final double? maxRadius;
  final int? ripplesCount;
  final int? duration;

  const RippleAnim(
      {super.key,
      required this.logoPath,
      this.color,
      this.delay,
      this.repeat,
      this.minRadius,
      this.maxRadius,
      this.ripplesCount,
      this.duration});

  @override
  Widget build(BuildContext context) {
    return RippleAnimation(
      child: Image.asset(logoPath),
      color: color ?? ColorConstant.instance.neutral9,
      delay: Duration(milliseconds: delay ?? 500),
      repeat: repeat ?? true,
      minRadius: minRadius ?? 75,
      maxRadius: maxRadius ?? 140,
      ripplesCount: ripplesCount ?? 6,
      duration: Duration(milliseconds: duration ?? 6 * 300),
    );
  }
}
