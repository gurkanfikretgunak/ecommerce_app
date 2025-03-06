import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class AccountInfoBoxLabel extends StatelessWidget {
  final String title;
  final String value;
  final Color? titleColor;
  final Color? valueColor;
  final double? fontSize;
  final Color? borderColor;
  final double? borderWidth;

  const AccountInfoBoxLabel({
    super.key,
    required this.title,
    required this.value,
    this.titleColor,
    this.valueColor,
    this.fontSize,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: borderColor ?? ColorConstant.instance.neutral5,
            width: borderWidth ?? 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContentText(
            text: title,
            fontSize: fontSize ?? 18,
            color: titleColor ?? ColorConstant.instance.neutral4,
          ),
          ContentText(
            text: value,
            fontSize: fontSize ?? 18,
            color: valueColor ?? ColorConstant.instance.neutral1,
          ),
        ],
      ),
    );
  }
}
