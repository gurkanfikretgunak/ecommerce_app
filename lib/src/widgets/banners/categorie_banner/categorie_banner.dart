import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategorieBanner extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;

  const CategorieBanner(
      {super.key, required this.imagePath, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Stack(
        children: [
          Image.network(imagePath),
          Positioned(
            bottom: 45,
            left: 10,
            child: CategorieBannerText(text: text),
          )
        ],
      ),
    );
  }
}
