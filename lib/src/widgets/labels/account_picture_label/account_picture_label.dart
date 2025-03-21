import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class AccountPictureLabel extends StatelessWidget {
  final String imagePath;
  final double? borderWidth;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? iconSize;
  final IconData? icon;
  final double? imageWidth;
  final double? imageHeight;

  const AccountPictureLabel({
    super.key,
    required this.imagePath,
    this.borderWidth,
    this.borderColor,
    this.backgroundColor,
    this.iconSize,
    this.icon,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageRadiusModal(
          imagePath: imagePath,
          width: imageWidth ?? 80,
          height: imageHeight ?? 80,
        ),
        if (icon != null)
          Positioned(
            top: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: ColorConstant.instance.neutral7,
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor ?? ColorConstant.instance.neutral5,
                  width: borderWidth ?? 1,
                ),
              ),
              child: CircleAvatar(
                backgroundColor:
                    backgroundColor ?? ColorConstant.instance.neutral9,
                radius: 12,
                child: Icon(size: iconSize ?? 15, icon),
              ),
            ),
          ),
      ],
    );
  }
}
