import 'package:example/animation/loadinganimation.dart';
import 'package:example/animation/rippleanimation.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashView extends StatefulWidget {
  final String? logoPath;
  final String? splashText;

  const SplashView({super.key, this.logoPath, this.splashText});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.primary_main,
      body: Stack(
        children: [
          Align(
            child: Image.asset(
              Assets.images.splashtexture.path,
              alignment: Alignment.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: RippleAnim(
                    logoPath: widget.logoPath ?? Assets.icons.logo.path,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    const LoadingAnimation(),
                    Text(
                      widget.splashText ??
                          "Copyright By NILAH – Designed By La-Studio",
                      style: TextStyle(
                        color: ColorConstant.instance.neutral9,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
