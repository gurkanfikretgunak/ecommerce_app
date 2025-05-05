import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/l10n/app_l10n_en.dart';
import 'package:example/views/auth/signin/signin_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/annotations.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  void _goToNextPage(int page) {
    if (page < 2) {
      _pageController.animateToPage(page + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      AutoRouter.of(context).push(const SignInViewRoute());
      /* Navigator.pushReplacement(
          context,
           MaterialPageRoute(builder: (context) => const SignInView()));*/
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
            firstText: L10n.of(context)!.onboardingTextOne1,
            secondText: L10n.of(context)!.onboardingTextOne2,
            thirdText: L10n.of(context)!.onboardingTextOne3,
            pageController: _pageController,
            onNext: () => _goToNextPage(0),
          ),
          OnboardingSlider(
            imagePath: Assets.images.onboardingimageSecond.path,
            firstText: L10n.of(context)!.onboardingTextTwo1,
            secondText: L10n.of(context)!.onboardingTextTwo2,
            thirdText: L10n.of(context)!.onboardingTextTwo3,
            pageController: _pageController,
            onNext: () => _goToNextPage(1),
          ),
          OnboardingSlider(
            imagePath: Assets.images.onboardingimageThird.path,
            firstText: L10n.of(context)!.onboardingTextThree1,
            secondText: L10n.of(context)!.onboardingTextThree2,
            thirdText: L10n.of(context)!.onboardingTextThree3,
            pageController: _pageController,
            onNext: () => _goToNextPage(2),
          )
        ],
      ),
    );
  }
}
