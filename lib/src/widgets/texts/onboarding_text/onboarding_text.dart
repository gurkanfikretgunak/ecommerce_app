import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OnboardingText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? height;
  final Color? color;
  final FontWeight? fontWeight;

  const OnboardingText({
    super.key,
    required this.text,
    this.fontSize,
    this.height,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.bebasNeue(
        fontSize: fontSize ?? 50,
        height: height ?? 1,
        color: color ?? ColorConstant.instance.neutral9,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
