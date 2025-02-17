import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpTextfieldInput extends StatelessWidget {
  final TextEditingController controller;
  final int? numberOfFields;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final bool? showFieldAsBox;
  final Function(String)? onCodeChanged;
  final Function(String)? onSubmit;
  final double? fieldWidth; // Yeni parametre
  final double? fieldHeight; // Yeni parametre

  const OtpTextfieldInput({
    Key? key,
    required this.controller,
    this.numberOfFields,
    this.borderColor,
    this.borderRadius,
    this.showFieldAsBox,
    this.onCodeChanged,
    this.onSubmit,
    this.fieldWidth,
    this.fieldHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OtpTextField(
        numberOfFields: numberOfFields ?? 4,
        borderColor: borderColor ?? const Color(0xFF512DA8),
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(30)),
        showFieldAsBox: showFieldAsBox ?? true,
        onCodeChanged: onCodeChanged ?? (code) {},
        onSubmit: onSubmit ?? (verificationCode) {},
        fieldWidth: fieldWidth ?? 60.0,
        fieldHeight: fieldHeight ?? 60.0,
      ),
    );
  }
}
