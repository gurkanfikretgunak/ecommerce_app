import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductDescriptionImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final double? blurHeight;
  final List<Color>? gradientColors;

  const ProductDescriptionImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.blurHeight,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: _getImageWidget(imagePath),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: blurHeight ?? 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors ??
                    [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(1.0),
                    ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getImageWidget(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return Image.network(
        path,
        width: width ?? 370,
        height: height ?? 170,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        path,
        width: width ?? 370,
        height: height ?? 170,
        fit: BoxFit.cover,
      );
    }
  }
}
