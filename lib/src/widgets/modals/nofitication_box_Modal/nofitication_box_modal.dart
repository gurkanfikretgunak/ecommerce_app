import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class NofiticationBoxModal extends StatefulWidget {
  final String iconPath;
  final String text;
  final String timeText;
  final double? radius;
  final double? width;
  final double? height;
  final double? successIconRadius;
  final Color? successIconColor;
  final Color? color;
  final double? fontSize;
  final double? timeFontSize;
  final Color? textColor;
  final Color? timeTextColor;
  bool isSeen;
  bool isSelected;

  NofiticationBoxModal({
    super.key,
    required this.iconPath,
    required this.text,
    required this.timeText,
    this.radius,
    this.width,
    this.height,
    this.successIconRadius,
    this.successIconColor,
    this.color,
    this.fontSize,
    this.timeFontSize,
    this.textColor,
    this.timeTextColor,
    required this.isSeen,
    required this.isSelected,
  });

  @override
  State<NofiticationBoxModal> createState() => _NofiticationBoxModalState();
}

class _NofiticationBoxModalState extends State<NofiticationBoxModal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RadiusIconLabel(
          radius: widget.radius ?? 30,
          width: widget.width ?? 20,
          height: widget.height ?? 20,
          topRightRadius: widget.successIconRadius ?? 5,
          iconPath: widget.iconPath,
          topRightIconColor: widget.isSeen
              ? ColorConstant.instance.neutral5
              : widget.successIconColor ?? ColorConstant.instance.primary_main,
          color: widget.isSeen
              ? ColorConstant.instance.neutral5
              : widget.color ?? ColorConstant.instance.primary_main,
        ),
        context.emptySizedWidthBoxNormal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: ContentText(
                text: widget.text,
                softWrap: true,
                textAlign: TextAlign.start,
                color: widget.isSeen
                    ? ColorConstant.instance.neutral5
                    : widget.textColor ?? ColorConstant.instance.neutral1,
                fontSize: widget.fontSize ?? 12,
              ),
            ),
            ContentText(
              text: widget.timeText,
              color: widget.isSeen
                  ? ColorConstant.instance.neutral5
                  : widget.timeTextColor ?? ColorConstant.instance.neutral4,
              fontSize: widget.timeFontSize ?? 10,
            ),
          ],
        )
      ],
    );
  }
}
