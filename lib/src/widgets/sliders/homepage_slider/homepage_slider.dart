import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class HomePageSlider extends StatelessWidget {
  final String imagePath;
  final String headText;
  final String descText;
  final PageController pageController;
  final int? pageCount;

  const HomePageSlider({
    super.key,
    required this.imagePath,
    required this.headText,
    required this.descText,
    required this.pageController,
    this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(imagePath),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeadText(text: headText),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadText(
                    text: descText,
                    color: ColorConstant.instance.primary_main,
                    fontSize: 40,
                  ),
                  context.emptySizedHeightBoxNormal,
                  const BannerButton(icon: Icons.arrow_forward)
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: SliderIndicator(
                pageController: pageController, count: pageCount ?? 3),
          ),
        ),
      ],
    );
  }
}
