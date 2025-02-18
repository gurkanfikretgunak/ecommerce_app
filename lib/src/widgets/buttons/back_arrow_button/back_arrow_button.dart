import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final Color? color;
  final IconData? iconData;
  final double? size;

  const BackArrowButton({super.key, this.color, this.iconData, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size ?? 30,
      onPressed: () {},
      icon: Icon(iconData ?? Icons.arrow_back_ios_rounded),
      color: color ?? Colors.white,
    );
  }
}
