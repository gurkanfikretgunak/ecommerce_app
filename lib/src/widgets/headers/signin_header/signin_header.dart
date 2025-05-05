import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/appbar/custom_appbar/custom_appbar.dart';

class SignInHeader extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPressed;
  final double? borderBottomLeftRadius;
  final double? borderBottomRightRadius;

  const SignInHeader({
    super.key,
    required this.imagePath,
    this.onPressed,
    this.borderBottomLeftRadius,
    this.borderBottomRightRadius,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        HeaderImage(
          imagePath: imagePath,
          borderBottomLeftRadius: borderBottomLeftRadius ?? 60,
          borderBottomRightRadius: borderBottomRightRadius ?? 60,
        ),
        Positioned(
          top: screenHeigth * 0.03,
          child: CustomAppbar(
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
