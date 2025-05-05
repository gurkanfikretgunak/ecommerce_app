import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OnboardingSlider extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final String secondText;
  final String thirdText;
  final VoidCallback onNext;
  final PageController pageController;

  const OnboardingSlider(
      {super.key,
      required this.imagePath,
      required this.firstText,
      required this.secondText,
      required this.thirdText,
      required this.onNext,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset(
          imagePath!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 20,
            top: screenHeigth * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OnboardingText(text: firstText),
                OnboardingText(text: secondText),
                OnboardingText(text: thirdText),
                context.emptySizedHeightBoxLow,
                OnboardingButton(
                  onNext: onNext,
                ),
              ],
            )),
        Positioned(
            right: 20,
            bottom: 20,
            child: SliderIndicator(pageController: pageController, count: 3)),
      ],
    );
  }
}
