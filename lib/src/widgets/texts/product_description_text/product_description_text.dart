import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductDescriptionText extends StatelessWidget {
  final String text;
  final double? width;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final bool? softWrap;

  const ProductDescriptionText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.softWrap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.9,
      child: ProductText(
        text: text,
        fontSize: fontSize ?? 12, // Varsayılan font size
        color: color ?? ColorConstant.instance.neutral4, // Varsayılan renk
        textAlign: textAlign ?? TextAlign.start, // Varsayılan hizalama
        softWrap: softWrap ?? true, // Varsayılan soft wrap
      ),
    );
  }
}
