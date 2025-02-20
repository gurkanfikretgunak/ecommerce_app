import 'package:example/animation/loadinganimation.dart';
import 'package:example/animation/rippleanimation.dart';
import 'package:example/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Splash extends StatefulWidget {
  final String? logoPath;
  final String? splashText;

  const Splash({super.key, this.logoPath, this.splashText});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding()),
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
              "assets/images/splashtexture.png",
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
                    logoPath: widget.logoPath ?? "assets/icons/logo.png",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    LoadingAnimation(),
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
