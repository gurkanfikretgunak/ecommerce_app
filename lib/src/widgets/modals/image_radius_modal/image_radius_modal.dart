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
      return Image.network(
        imagePath,
        width: width ?? 60,
        height: height ?? 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            imagePath,
            width: width ?? 60,
            height: height ?? 60,
            fit: BoxFit.cover,
          );
        },
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
