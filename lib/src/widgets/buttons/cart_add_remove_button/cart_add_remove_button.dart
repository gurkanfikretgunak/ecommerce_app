import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CartAddRemoveButton extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final Color? iconColor;
  final Function(int)? onPressed;
  const CartAddRemoveButton(
      {super.key,
      this.color,
      required this.icon,
      this.iconColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed != null ? () => onPressed!(0) : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorConstant.instance.neutral1,
        shape: CircleBorder(),
      ),
      child: Icon(
        icon,
        color: iconColor ?? ColorConstant.instance.neutral9,
      ),
    );
  }
}
