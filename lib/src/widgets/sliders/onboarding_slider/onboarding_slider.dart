import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/buttons/buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingSlider extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final String text3;
  final VoidCallback onNext;
  final PageController pageController;

  const OnboardingSlider(
      {super.key,
      required this.imagePath,
      required this.text1,
      required this.text2,
      required this.text3,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(text1, style: _textStyle()),
                Text(text2, style: _textStyle()),
                Text(text3, style: _textStyle()),
                SizedBox(
                  height: 15,
                ),
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

  TextStyle _textStyle() {
    return GoogleFonts.bebasNeue(
      fontSize: 45,
      height: 1,
      color: ColorConstant.instance.neutral9,
      fontWeight: FontWeight.bold,
    );
  }
}
