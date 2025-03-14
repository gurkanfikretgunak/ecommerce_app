import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SignInForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.87,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxLow,
              TextFieldInput(
                controller:
                    widget.emailController, // Dışarıdan alınan controller
                hintText: "Enter Email",
                inputType: InputType.email,
              ),
              context.emptySizedHeightBoxNormal,
              const Text(
                "Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxNormal,
              TextFieldInput(
                controller:
                    widget.passwordController, // Dışarıdan alınan controller
                hintText: "Enter Password",
                inputType: InputType.password,
              ),
              context.emptySizedHeightBoxNormal,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        "Remember Me",
                        style:
                            TextStyle(color: ColorConstant.instance.neutral4),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style:
                          TextStyle(color: ColorConstant.instance.primary_main),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
