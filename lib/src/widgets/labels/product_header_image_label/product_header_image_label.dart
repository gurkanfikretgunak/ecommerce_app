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
          child: Image.asset(imagePath, fit: BoxFit.cover),
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
}
