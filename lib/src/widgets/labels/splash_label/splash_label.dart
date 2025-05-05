import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SplashLabel extends StatefulWidget {
  final String logoPath;
  final String background;
  final String? splashText;
  const SplashLabel(
      {super.key,
      required this.logoPath,
      this.splashText,
      required this.background});

  @override
  State<SplashLabel> createState() => _SplashLabelState();
}

class _SplashLabelState extends State<SplashLabel> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Image.asset(
            widget.background,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                child: RippleAnim(
                  logoPath: widget.logoPath,
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
    );
  }
}
