import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class StepperLabelRadius extends StatelessWidget {
  final String text;
  final bool isActive;
  final double? dotSize;
  final double? fontSize;
  final Color? activeDotColor;
  final Color? inactiveDotColor;
  final Color? borderColor;
  final Color? textColor;
  final double? spacing;
  final double? borderWidth;

  const StepperLabelRadius({
    super.key,
    required this.text,
    required this.isActive,
    this.dotSize,
    this.fontSize,
    this.activeDotColor,
    this.inactiveDotColor,
    this.borderColor,
    this.textColor,
    this.spacing,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: dotSize ?? 20,
          height: dotSize ?? 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? activeDotColor ?? ColorConstant.instance.neutral1
                : inactiveDotColor ?? ColorConstant.instance.neutral9,
            border: Border.all(
              color: borderColor ?? ColorConstant.instance.neutral5,
              width: borderWidth ?? 1,
            ),
          ),
        ),
        SizedBox(height: spacing ?? 4),
        ProductText(
          text: text,
          fontSize: fontSize ?? 12,
          color: textColor ?? ColorConstant.instance.neutral1,
        ),
      ],
    );
  }
}
