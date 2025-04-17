import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SignInFormLabel extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedPassword;
  final String? emailErrorMessage;
  final String? passwordErrorMessage;
  final bool? isEmailValid;
  final bool? isPasswordValid;
  final bool rememberMe;
  final Function(bool)? checkBoxOnChanged;

  const SignInFormLabel({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.onChangedEmail,
    this.onChangedPassword,
    this.emailErrorMessage,
    this.passwordErrorMessage,
    this.isEmailValid,
    this.isPasswordValid,
    required this.rememberMe,
    this.checkBoxOnChanged,
  });

  @override
  State<SignInFormLabel> createState() => _SignInFormLabelState();
}

class _SignInFormLabelState extends State<SignInFormLabel> {
  bool isPasswordVisible = false;

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
              const Text(
                "Email",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxLow,
              TextFieldInput(
                errorMessage: widget.emailErrorMessage,
                controller: widget.emailController,
                hintText: "Enter Email",
                inputType: InputType.email,
                onChanged: widget.onChangedEmail,
                isValid: widget.isEmailValid ?? true,
              ),
              context.emptySizedHeightBoxNormal,
              const Text(
                "Password",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxNormal,
              TextFieldInput(
                errorMessage: widget.passwordErrorMessage,
                controller: widget.passwordController,
                hintText: "Enter Password",
                inputType: InputType.password,
                onChanged: widget.onChangedPassword,
                isValid: widget.isPasswordValid ?? true,
              ),
              context.emptySizedHeightBoxNormal,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: ColorConstant.instance.primary_main,
                        value: widget.rememberMe,
                        onChanged: (value) {
                          if (value != null &&
                              widget.checkBoxOnChanged != null) {
                            widget.checkBoxOnChanged!(value);
                          }
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
