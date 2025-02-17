import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final double? borderBottomLeftRadius;
  final double? borderBottomRightRadius;
  final String imagePath;

  const HeaderImage(
      {super.key,
      required this.imagePath,
      this.borderBottomLeftRadius,
      this.borderBottomRightRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderBottomLeftRadius ?? 60),
          bottomRight: Radius.circular(borderBottomRightRadius ?? 60)),
      child: Image.asset(imagePath),
    );
  }
}
