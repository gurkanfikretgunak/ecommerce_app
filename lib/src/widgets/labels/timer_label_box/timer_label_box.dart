import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class TimerLabelBox extends StatelessWidget {
  final String? value;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;

  const TimerLabelBox(
      {super.key,
      this.value,
      this.width,
      this.height,
      this.color,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 25,
      height: height ?? 25,
      decoration: BoxDecoration(
          color: color ?? ColorConstant.instance.primary_main,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 5))),
      child: Center(child: ProductText(text: value ?? "00", fontSize: 12)),
    );
  }
}
