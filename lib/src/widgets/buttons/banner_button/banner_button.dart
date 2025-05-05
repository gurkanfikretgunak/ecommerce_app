import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class BannerButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final double? iconSize;
  final Color? iconColor;
  final double? paddingValue;
  final VoidCallback? onPressed;

  const BannerButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.iconSize,
    this.iconColor,
    this.paddingValue,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorConstant.instance.primary_main,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(paddingValue ?? 16.0),
      ),
      child: Icon(
        icon,
        color: iconColor ?? ColorConstant.instance.neutral9,
        size: iconSize ?? 15,
      ),
    );
  }
}
