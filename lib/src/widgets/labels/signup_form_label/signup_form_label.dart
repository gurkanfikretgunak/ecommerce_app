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
                    hintText: 'First Name',
                    onChanged: widget.onChangedFirstName,
                    errorMessage: widget.firstNameErrorMessage,
                    isValid: widget.isFirstNameValid ?? false,
                  ),
                ),
                context.emptySizedWidthBoxNormal,
                Expanded(
                  child: TextFieldInput(
                    controller: widget.lastNameController,
                    hintText: 'Last Name',
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
              hintText: 'Email',
              inputType: InputType.email,
              onChanged: widget.onChangedEmail,
              errorMessage: widget.emailErrorMessage,
              isValid: widget.isEmailValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.phoneController,
              hintText: 'Phone Number',
              inputType: InputType.phone,
              onChanged: widget.onChangedPhone,
              errorMessage: widget.phoneErrorMessage,
              isValid: widget.isPhoneValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.passwordController,
              hintText: 'Password',
              inputType: InputType.password,
              errorMessage: widget.passwordErrorMessage,
              onChanged: widget.onChangedPassword,
              isValid: widget.isPasswordValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.confirmPasswordController,
              hintText: 'Confirm Password',
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
