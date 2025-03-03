import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CustomButton extends StatelessWidget {
  final dynamic icon;
  final Color? color;
  final String? text;
  final double? width;
  final double? height;
  final double? radius;
  final VoidCallback? onPressed;
  final double? fontSize;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;

  const CustomButton(
      {super.key,
      this.icon,
      this.color,
      this.text,
      this.width,
      this.height,
      this.fontSize,
      this.textColor,
      this.iconColor,
      this.radius,
      this.borderColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 325,
      height: height ?? 35,
      child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
              side: BorderSide(
                  color: borderColor ?? ColorConstant.instance.neutral5),
              backgroundColor: color ?? ColorConstant.instance.primary_main,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 25)),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon ?? null, // icon gelmiyorsa default icon atanacak.
                color: iconColor ?? ColorConstant.instance.neutral9,
                size: 15,
              ),
              if (icon != null) const SizedBox(width: 10),
              Text(
                text ?? "",
                style: GoogleFonts.poppins(
                  fontSize: fontSize ?? 15,
                  color: textColor ?? ColorConstant.instance.neutral9,
                ),
              ),
            ],
          )),
    );
  }
}
