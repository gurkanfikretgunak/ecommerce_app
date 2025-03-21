import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SignInForm extends StatefulWidget {
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPassword;

  const SignInForm({
    super.key,
    this.onChangedEmail,
    this.onChangedPassword,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                controller: emailController,
                hintText: "Enter Email",
                inputType: InputType.email,
                onChanged: widget.onChangedEmail,
              ),
              context.emptySizedHeightBoxNormal,
              const Text(
                "Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxNormal,
              TextFieldInput(
                hintText: "Enter Password",
                controller: passwordController,
                inputType: InputType.password,
                onChanged: widget.onChangedPassword,
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
