import 'package:example/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController = PageController();

  void _goToNextPage(int page) {
    if (page < 2) {
      _pageController.animateToPage(page + 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingSlider(
            imagePath: "lib/assets/images/onboardingimage_first.png",
            text1: "CLASSY",
            text2: "FROM HEAD",
            text3: "TO TOE",
            pageController: _pageController,
            onNext: () => _goToNextPage(0),
          ),
          OnboardingSlider(
            imagePath: "lib/assets/images/onboardingimage_second.png",
            text1: "FLY AWAY",
            text2: "WITH YOUR",
            text3: "STYLE",
            pageController: _pageController,
            onNext: () => _goToNextPage(1),
          ),
          OnboardingSlider(
            imagePath: "lib/assets/images/onboardingimage_third.png",
            text1: "CLOTHES",
            text2: "FOR A BIG",
            text3: "PLANET",
            pageController: _pageController,
            onNext: () => _goToNextPage(2),
          )
        ],
      ),
    );
  }
}
