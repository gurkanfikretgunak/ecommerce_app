import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/appbar/custom_appbar/custom_appbar.dart';

class SignInHeader extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPressed;

  const SignInHeader({super.key, required this.imagePath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        HeaderImage(
            imagePath: imagePath,
            borderBottomLeftRadius: 60,
            borderBottomRightRadius: 60),
        Positioned(
          top: screenHeigth * 0.03,
          left: 20,
          child: CustomAppbar(
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
