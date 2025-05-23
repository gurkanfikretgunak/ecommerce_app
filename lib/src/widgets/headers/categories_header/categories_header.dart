import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoriesHeader extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onPressed;
  const CategoriesHeader({
    super.key,
    required this.imagePath,
    required this.text,
    this.textColor,
    this.fontSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildImage(imagePath),
        Positioned(
            child: CustomAppbar(
          onPressed: onPressed,
        )),
        Positioned(
            left: 10,
            top: 115,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: HeadText(
                text: text,
                fontSize: (text.length * 25).clamp(16, 40).toDouble(),
                color: textColor ??
                    ColorConstant.instance.neutral9.withValues(alpha: 0.7),
              ),
            )),
      ],
    );
  }

  Widget _buildImage(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return CachedNetworkImage(imageUrl: (path));
    } else {
      return Image.asset(path);
    }
  }
}
