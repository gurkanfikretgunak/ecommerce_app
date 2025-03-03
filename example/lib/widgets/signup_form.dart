import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                    controller: firstNameController,
                    hintText: 'First Name',
                  ),
                ),
                context.emptySizedWidthBoxNormal,
                Expanded(
                  child: TextFieldInput(
                    controller: lastNameController,
                    hintText: 'Last Name',
                  ),
                ),
              ],
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: emailController,
              hintText: 'Email',
              inputType: InputType.email,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: phoneController,
              hintText: 'Phone Number',
              inputType: InputType.phone,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: passwordController,
              hintText: 'Password',
              inputType: InputType.password,
            ),
            context.emptySizedHeightBoxNormal,
            TextFieldInput(
              controller: confirmPasswordController,
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
