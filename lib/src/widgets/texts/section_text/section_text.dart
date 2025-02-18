import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SectionText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final double? lineHeight;
  final Color? lineColor;

  const SectionText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.lineHeight,
    this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 2,
          height: lineHeight ?? 25,
          color: lineColor ?? ColorConstant.instance.primary_main,
        ),
        SizedBox(width: 10),
        HeadText(
          text: text,
          color: color ?? ColorConstant.instance.neutral1,
          fontSize: fontSize ?? 30,
        ),
      ],
    );
  }
}
