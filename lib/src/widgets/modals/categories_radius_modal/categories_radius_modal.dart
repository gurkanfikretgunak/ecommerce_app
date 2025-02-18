import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategoriesRadiusModal extends StatelessWidget {
  final String imagePath;
  final String text;
  final double? width;
  final double? height;
  final Color? textColor;

  const CategoriesRadiusModal(
      {super.key,
      required this.imagePath,
      required this.text,
      this.width,
      this.height,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: width ?? 60,
            height: height ?? 60,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ProductText(
          text: text,
          color: textColor ?? ColorConstant.instance.neutral1,
        ),
      ],
    );
  }
}
