import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RadiusIconLabel extends StatelessWidget {
  final String iconPath;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final double? topRightRadius;
  final Color? topRightIconColor;
  final String? topRightIconPath;
  final Color? radiusColor;

  const RadiusIconLabel({
    super.key,
    required this.iconPath,
    this.width,
    this.height,
    this.radius,
    this.color,
    this.topRightRadius,
    this.topRightIconColor,
    this.topRightIconPath,
    this.radiusColor,
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
            backgroundColor: radiusColor ?? Colors.transparent,
            radius: topRightRadius ?? 15,
            child: topRightIconPath != null && topRightIconPath!.isNotEmpty
                ? SvgPicture.asset(
                    topRightIconPath!,
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: topRightIconColor ??
                          ColorConstant.instance.primary_main,
                      borderRadius: BorderRadius.all(
                          Radius.circular(topRightRadius ?? 15)),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
