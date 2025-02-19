import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class HomepageBanner extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String subTitleText;
  final String descriptionText;

  const HomepageBanner({
    super.key,
    required this.imagePath,
    required this.titleText,
    required this.subTitleText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imagePath),
        Positioned(
            top: 30,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomepageBannerHeadText(text: titleText),
                HeadText(text: subTitleText),
                ProductText(text: descriptionText),
              ],
            ))
      ],
    );
  }
}
