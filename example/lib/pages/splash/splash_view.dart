import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

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
        body: SplashLabel(
            logoPath: widget.logoPath ?? Assets.icons.logo.path,
            background: Assets.images.splashtexture.path));
  }
}
