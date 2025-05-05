import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategorieBannerText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final double? fontSize;

  const CategorieBannerText(
      {super.key,
      required this.text,
      this.color,
      this.width,
      this.height,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadText(
            text: text,
            fontSize: fontSize ?? 40,
            color: color ?? ColorConstant.instance.neutral9),
        Container(
          width: width ?? text.length * 16,
          height: height ?? 2,
          color: color ?? ColorConstant.instance.neutral9,
        )
      ],
    );
  }
}
