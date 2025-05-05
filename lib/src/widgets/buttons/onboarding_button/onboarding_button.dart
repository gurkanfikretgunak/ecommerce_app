import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OnboardingButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final double? iconWeight;
  final VoidCallback onNext;

  const OnboardingButton({
    super.key,
    required this.onNext,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.icon,
    this.iconColor,
    this.iconWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 40,
        height: height ?? 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 5)),
          color: color ?? ColorConstant.instance.neutral9,
        ),
        child: IconButton(
          onPressed: onNext,
          icon: Icon(
            icon ?? Icons.arrow_forward_ios_rounded,
            color: iconColor ?? ColorConstant.instance.neutral1,
            weight: iconWeight ?? 12,
          ),
        ));
  }
}
