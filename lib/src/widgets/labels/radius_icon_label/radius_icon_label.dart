import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RadiusIconLabel extends StatelessWidget {
  final String iconPath;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final double? successIconRadius;
  final Color? successIconColor;
  final String successIconPath;

  const RadiusIconLabel({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.successIconRadius,
    this.successIconColor,
    this.successIconPath = "assets/icons/success.svg",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius ?? 60,
          backgroundColor: ColorConstant.instance.neutral7,
          child: Center(
            child: SvgPicture.asset(
              width: width ?? 50,
              height: height ?? 50,
              iconPath,
              color: color ?? ColorConstant.instance.primary_main,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
            radius: successIconRadius ?? 15,
            child: SvgPicture.asset(
              successIconPath,
              color: ColorConstant.instance.primary_main,
            ),
          ),
        ),
      ],
    );
  }
}
