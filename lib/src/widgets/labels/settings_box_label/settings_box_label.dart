import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SettingsBoxLabel extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final double? iconSize;
  final IconData? suffixIcon;
  final VoidCallback? onTap;

  const SettingsBoxLabel({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.iconSize,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor ?? ColorConstant.instance.neutral1,
                size: iconSize ?? 24,
              ),
              context.emptySizedWidthBoxNormal,
              ContentText(
                text: text,
                color: textColor ?? ColorConstant.instance.neutral1,
                fontSize: fontSize ?? 15,
              ),
            ],
          ),
          if (suffixIcon != null)
            Icon(
              size: 10,
              suffixIcon,
              color: iconColor ?? ColorConstant.instance.neutral1,
            )
        ],
      ),
    );
  }
}
