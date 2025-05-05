// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HorizontalProductCard extends StatelessWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final String? title;
  final Color? textColor;
  final EdgeInsets? padding;
  final FontWeight? fontWeight;
  const HorizontalProductCard({
    super.key,
    this.backgroundColor,
    this.width,
    this.height,
    this.title,
    this.textColor = Colors.black,
    this.fontWeight,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10.0),
      width: width ?? 200,
      height: height ?? 300,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
      ),
      child: Center(
        child: Text(
          title ?? ' ',
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
