import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/labels/account_picture_label/account_picture_label.dart';

class AccountBoxLabel extends StatelessWidget {
  final String imagePath;
  final IconData? icon;
  final String name;
  final String username;

  const AccountBoxLabel({
    super.key,
    required this.imagePath,
    required this.name,
    required this.username,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AccountPictureLabel(
          imagePath: imagePath,
          icon: icon ?? Icons.photo_camera,
        ),
        context.emptySizedWidthBoxLow,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentText(
              text: name,
              fontSize: 18,
              color: ColorConstant.instance.neutral1,
            ),
            ContentText(
              text: username,
              fontSize: 12,
              color: ColorConstant.instance.neutral4,
            ),
          ],
        )
      ],
    );
  }
}
