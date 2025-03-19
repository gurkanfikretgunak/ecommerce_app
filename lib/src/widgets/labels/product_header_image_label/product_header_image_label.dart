import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductHeaderImageLabel extends StatelessWidget {
  final String imagePath;
  final int count;
  final PageController pageController;

  const ProductHeaderImageLabel({
    super.key,
    required this.imagePath,
    required this.pageController,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _buildImage(imagePath),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: SliderIndicator(
            pageController: pageController,
            count: count,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return Image.network(path, fit: BoxFit.cover);
    } else {
      return Image.asset(path, fit: BoxFit.cover);
    }
  }
}
