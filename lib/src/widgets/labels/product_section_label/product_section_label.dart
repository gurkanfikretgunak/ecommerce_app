import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductSectionLabel extends StatelessWidget {
  final String title;
  final Widget element;
  final double? fontSize;
  final Color? color;

  const ProductSectionLabel({
    super.key,
    required this.title,
    required this.element,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductText(
          fontSize: fontSize ?? 12,
          color: color ?? ColorConstant.instance.neutral1,
          text: title,
        ),
        context.emptySizedHeightBoxNormal,
        element,
      ],
    );
  }
}
