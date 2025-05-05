import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ResetPasswordFormLabel extends StatefulWidget {
  final TextEditingController emailController;
  final String? emailErrorMessage;
  final Function(String)? onChangedEmail;
  final String emailHintText;
  final bool? isEmailValid;
  final String emailLabelText;

  const ResetPasswordFormLabel(
      {super.key,
      required this.emailController,
      this.onChangedEmail,
      this.isEmailValid,
      required this.emailLabelText,
      this.emailErrorMessage,
      required this.emailHintText});

  @override
  State<ResetPasswordFormLabel> createState() => _ResetPasswordFormLabelState();
}

class _ResetPasswordFormLabelState extends State<ResetPasswordFormLabel> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.87,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentText(
            text: widget.emailLabelText,
            fontWeight: FontWeight.w500,
            color: ColorConstant.instance.neutral1,
            fontSize: 14,
          ),
          context.emptySizedHeightBoxLow,
          TextFieldInput(
            errorMessage: widget.emailErrorMessage,
            controller: widget.emailController,
            hintText: widget.emailHintText,
            inputType: InputType.email,
            onChanged: widget.onChangedEmail,
            isValid: widget.isEmailValid ?? true,
          ),
        ],
      )),
    ));
  }
}
