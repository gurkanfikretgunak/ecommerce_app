import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SectionActionText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final double? fontSize;
  final VoidCallback? onTap;

  const SectionActionText(
      {super.key,
      required this.text,
      this.color,
      this.width,
      this.height,
      this.fontSize,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ContentText(
            text: text,
            fontSize: fontSize ?? 10,
            color: color ?? ColorConstant.instance.neutral4,
          ),
          Container(
            width: width ?? text.length * 5,
            height: height ?? 1,
            color: color ?? ColorConstant.instance.neutral4,
          ),
        ],
      ),
    );
  }
}
