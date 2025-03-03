import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/signin.dart';
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
          context, MaterialPageRoute(builder: (context) => SignIn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingSlider(
            imagePath: Assets.images.onboardingimageFirst.path,
            firstText: "CLASSY",
            secondText: "FROM HEAD",
            thirdText: "TO TOE",
            pageController: _pageController,
            onNext: () => _goToNextPage(0),
          ),
          OnboardingSlider(
            imagePath: Assets.images.onboardingimageSecond.path,
            firstText: "FLY AWAY",
            secondText: "WITH YOUR",
            thirdText: "STYLE",
            pageController: _pageController,
            onNext: () => _goToNextPage(1),
          ),
          OnboardingSlider(
            imagePath: Assets.images.onboardingimageThird.path,
            firstText: "CLOTHES",
            secondText: "FOR A BIG",
            thirdText: "PLANET",
            pageController: _pageController,
            onNext: () => _goToNextPage(2),
          )
        ],
      ),
    );
  }
}
