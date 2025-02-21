import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class HeadText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool? softWrap;

  const HeadText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: GoogleFonts.bebasNeue(
        color: color ?? ColorConstant.instance.neutral9,
        fontSize: fontSize ?? 30,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      softWrap: softWrap,
    );
  }
}
