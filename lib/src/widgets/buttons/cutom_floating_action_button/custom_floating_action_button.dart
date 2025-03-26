import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final ShapeBorder? shape;

  const CustomFloatingActionButton(
      {super.key,
      this.onPressed,
      required this.icon,
      this.foregroundColor,
      this.backgroundColor,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: shape ?? const CircleBorder(),
      foregroundColor: foregroundColor ?? ColorConstant.instance.neutral9,
      backgroundColor: backgroundColor ?? ColorConstant.instance.primary_main,
      child: Icon(icon),
    );
  }
}
