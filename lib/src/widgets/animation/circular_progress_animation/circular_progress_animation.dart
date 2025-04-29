import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CircularProgressAnimation extends StatefulWidget {
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
  State<CircularProgressAnimation> createState() =>
      _CircularProgressAnimationState();
}

class _CircularProgressAnimationState extends State<CircularProgressAnimation> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: widget.color ?? ColorConstant.instance.primary_main,
      strokeWidth: widget.strokeWidth ?? 4.0,
      semanticsLabel: widget.semanticsLabel,
      semanticsValue: widget.semanticsValue,
      valueColor: widget.valueColor,
      value: widget.value,
      backgroundColor: widget.backgroundColor,
    );
  }
}
