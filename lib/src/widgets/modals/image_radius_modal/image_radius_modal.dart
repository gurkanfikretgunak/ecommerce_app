import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ImageRadiusModal extends StatelessWidget {
  final String imagePath;
  final String? text;
  final double? width;
  final double? height;
  final Color? textColor;
  final VoidCallback? onTap;

  const ImageRadiusModal({
    super.key,
    required this.imagePath,
    this.text,
    this.width,
    this.height,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: _buildImage(),
          ),
          context.emptySizedHeightBoxLow,
          if (text != null)
            ContentText(
              text: text ?? "",
              color: textColor ?? ColorConstant.instance.neutral1,
            ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        width: width ?? 60,
        height: height ?? 60,
        fit: BoxFit.cover,
      );
    } else if (File(imagePath).existsSync()) {
      return Image.file(
        File(imagePath),
        width: width ?? 60,
        height: height ?? 60,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        imagePath,
        width: width ?? 60,
        height: height ?? 60,
        fit: BoxFit.cover,
      );
    }
  }
}
