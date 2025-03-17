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
                    isValid: widget.isFirstNameValid ?? false,
                  ),
                ),
                context.emptySizedWidthBoxNormal,
                Expanded(
                  child: TextFieldInput(
                    controller: widget.lastNameController,
                    hintText: 'Last Name',
                    onChanged: widget.onChangedLastName,
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
              isValid: widget.isEmailValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.phoneController,
              hintText: 'Phone Number',
              inputType: InputType.phone,
              onChanged: widget.onChangedPhone,
              isValid: widget.isPhoneValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.passwordController,
              hintText: 'Password',
              inputType: InputType.password,
              onChanged: widget.onChangedPassword,
              isValid: widget.isPasswordValid ?? false,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.confirmPasswordController,
              hintText: 'Confirm Password',
              inputType: InputType.password,
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
