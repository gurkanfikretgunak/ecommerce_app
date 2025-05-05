import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function(String)? onChangedFirstName;
  final Function(String)? onChangedLastName;
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPhone;
  final Function(String)? onChangedPassword;
  final Function(String)? onChangedConfirmPassword;
  final bool? isFirstNameValid;
  final bool? isLastNameValid;
  final bool? isEmailValid;
  final bool? isPhoneValid;
  final bool? isPasswordValid;
  final bool? isConfirmPasswordValid;
  final String? firstNameErrorMessage;
  final String? lastNameErrorMessage;
  final String? emailErrorMessage;
  final String? phoneErrorMessage;
  final String? passwordErrorMessage;
  final String? confirmPasswordErrorMessage;

  final String firstNameHintText;
  final String lastNameHintText;
  final String emailHintText;
  final String phoneHintText;
  final String passwordHintText;
  final String confirmPasswordHintText;

  const SignUpForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.onChangedFirstName,
    this.onChangedLastName,
    this.onChangedEmail,
    this.onChangedPhone,
    this.onChangedPassword,
    this.onChangedConfirmPassword,
    this.isFirstNameValid,
    this.isLastNameValid,
    this.isEmailValid,
    this.isPhoneValid,
    this.isPasswordValid,
    this.isConfirmPasswordValid,
    this.firstNameErrorMessage,
    this.lastNameErrorMessage,
    this.emailErrorMessage,
    this.phoneErrorMessage,
    this.passwordErrorMessage,
    this.confirmPasswordErrorMessage,
    this.firstNameHintText = 'First Name',
    this.lastNameHintText = 'Last Name',
    this.emailHintText = 'Email',
    this.phoneHintText = 'Phone Number',
    this.passwordHintText = 'Password',
    this.confirmPasswordHintText = 'Confirm Password',
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.87,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFieldInput(
                    controller: widget.firstNameController,
                    hintText: widget.firstNameHintText,
                    onChanged: widget.onChangedFirstName,
                    errorMessage: widget.firstNameErrorMessage,
                    isValid: widget.isFirstNameValid ?? false,
                  ),
                ),
                context.emptySizedWidthBoxNormal,
                Expanded(
                  child: TextFieldInput(
                    controller: widget.lastNameController,
                    hintText: widget.lastNameHintText,
                    onChanged: widget.onChangedLastName,
                    errorMessage: widget.lastNameErrorMessage,
                    isValid: widget.isLastNameValid ?? false,
                  ),
                ),
              ],
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.emailController,
              hintText: widget.emailHintText,
              inputType: InputType.email,
              onChanged: widget.onChangedEmail,
              errorMessage: widget.emailErrorMessage,
              isValid: widget.isEmailValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.phoneController,
              hintText: widget.phoneHintText,
              inputType: InputType.phone,
              onChanged: widget.onChangedPhone,
              errorMessage: widget.phoneErrorMessage,
              isValid: widget.isPhoneValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.passwordController,
              hintText: widget.passwordHintText,
              inputType: InputType.password,
              errorMessage: widget.passwordErrorMessage,
              onChanged: widget.onChangedPassword,
              isValid: widget.isPasswordValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.confirmPasswordController,
              hintText: widget.confirmPasswordHintText,
              inputType: InputType.password,
              errorMessage: widget.confirmPasswordErrorMessage,
              onChanged: widget.onChangedConfirmPassword,
              isValid: widget.isConfirmPasswordValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
          ],
        ),
      ),
    );
  }
}
