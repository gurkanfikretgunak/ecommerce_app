import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CircularProgressAnimation extends StatelessWidget {
  final Color? color;
  final double? strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  final Animation<Color?>? valueColor;
  final double? value;
  final Color? backgroundColor;

  const CircularProgressAnimation({
    super.key,
    this.color,
    this.strokeWidth = 4.0,
    this.semanticsLabel,
    this.semanticsValue,
    this.valueColor,
    this.value,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? ColorConstant.instance.primary_main,
      strokeWidth: strokeWidth ?? 4.0,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      valueColor: valueColor,
      value: value,
      backgroundColor: backgroundColor,
    );
  }
}
