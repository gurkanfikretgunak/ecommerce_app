import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final Color? color;
  final IconData? iconData;
  final double? size;
  final VoidCallback? onPressed;

  const BackArrowButton(
      {super.key, this.color, this.iconData, this.size, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size ?? 30,
      onPressed: onPressed ?? () {},
      icon: Icon(iconData ?? Icons.arrow_back_ios_new_rounded),
      color: color ?? Colors.white,
    );
  }
}
