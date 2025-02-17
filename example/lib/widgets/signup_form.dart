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
            // İlk ad ve soyad kısmı
            Row(
              children: [
                Expanded(
                  child: TextFieldInput(
                    controller: firstNameController,
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFieldInput(
                    controller: lastNameController,
                    hintText: 'Last Name',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            TextFieldInput(
              controller: emailController,
              hintText: 'Email',
              inputType: InputType.email,
            ),

            const SizedBox(height: 20),

            TextFieldInput(
              controller: phoneController,
              hintText: 'Phone Number',
              inputType: InputType.phone,
            ),
            const SizedBox(height: 20),

            TextFieldInput(
              controller: passwordController,
              hintText: 'Password',
              inputType: InputType.password,
            ),
            const SizedBox(height: 20),

            TextFieldInput(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              inputType: InputType.password,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
