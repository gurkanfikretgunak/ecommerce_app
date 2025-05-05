import 'package:flutter/material.dart';

class ColorRadiusInput extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final double? innerWidth;
  final double? innerHeight;
  final Color? innerColor;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorRadiusInput({
    super.key,
    this.width,
    this.height,
    required this.color,
    this.innerWidth,
    this.innerHeight,
    this.innerColor,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 28,
        height: height ?? 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color,
        ),
        child: Center(
          child: isSelected
              ? Container(
                  width: innerWidth ?? 14,
                  height: innerHeight ?? 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: innerColor ?? Colors.white,
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
