import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SignUpForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.confirmPasswordController,
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
                  ),
                ),
                context.emptySizedWidthBoxNormal,
                Expanded(
                  child: TextFieldInput(
                    controller: widget.lastNameController,
                    hintText: 'Last Name',
                  ),
                ),
              ],
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.emailController,
              hintText: 'Email',
              inputType: InputType.email,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.phoneController,
              hintText: 'Phone Number',
              inputType: InputType.phone,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.passwordController,
              hintText: 'Password',
              inputType: InputType.password,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: widget.confirmPasswordController,
              hintText: 'Confirm Password',
              inputType: InputType.password,
            ),
            context.emptySizedHeightBoxNormal,
          ],
        ),
      ),
    );
  }
}
