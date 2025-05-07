import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ChangePasswordFormLabel extends StatefulWidget {
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController newConfirmPasswordController;

  final String? currentPasswordErrorMessage;
  final String? newPasswordErrorMessage;
  final String? newConfirmPasswordErrorMessage;

  final Function(String)? onChangedcurrentPassword;
  final Function(String)? onChangedNewPassword;
  final Function(String)? onChangedNewConfirmPassword;

  final String currentPasswordHintText;
  final String newPasswordHintText;
  final String newConfirmPasswordHintText;

  final bool? iscurrentPasswordValid;
  final bool? isNewPasswordValid;
  final bool? isNewConfirmPasswordValid;

  const ChangePasswordFormLabel({
    super.key,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.newConfirmPasswordController,
    this.onChangedcurrentPassword,
    this.onChangedNewPassword,
    this.onChangedNewConfirmPassword,
    this.iscurrentPasswordValid,
    this.isNewPasswordValid,
    this.isNewConfirmPasswordValid,
    this.currentPasswordErrorMessage,
    this.newPasswordErrorMessage,
    this.newConfirmPasswordErrorMessage,
    this.currentPasswordHintText = 'current Password',
    this.newPasswordHintText = 'New Password',
    this.newConfirmPasswordHintText = 'Confirm New Password',
  });

  @override
  State<ChangePasswordFormLabel> createState() =>
      _ChangePasswordFormLabelState();
}

class _ChangePasswordFormLabelState extends State<ChangePasswordFormLabel> {
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
              TextFieldInput(
                errorMessage: widget.currentPasswordErrorMessage,
                controller: widget.currentPasswordController,
                hintText: widget.currentPasswordHintText,
                inputType: InputType.password,
                onChanged: widget.onChangedcurrentPassword,
                isValid: widget.iscurrentPasswordValid ?? true,
              ),
              context.emptySizedHeightBoxLow,
              TextFieldInput(
                errorMessage: widget.newPasswordErrorMessage,
                controller: widget.newPasswordController,
                hintText: widget.newPasswordHintText,
                inputType: InputType.password,
                onChanged: widget.onChangedNewPassword,
                isValid: widget.isNewPasswordValid ?? true,
              ),
              context.emptySizedHeightBoxLow,
              TextFieldInput(
                errorMessage: widget.newConfirmPasswordErrorMessage,
                controller: widget.newConfirmPasswordController,
                hintText: widget.newConfirmPasswordHintText,
                inputType: InputType.password,
                onChanged: widget.onChangedNewConfirmPassword,
                isValid: widget.isNewConfirmPasswordValid ?? true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
