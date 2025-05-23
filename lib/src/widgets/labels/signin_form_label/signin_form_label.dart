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

  final String emailLabelText;
  final String passwordLabelText;
  final String emailHintText;
  final String passwordHintText;
  final String rememberMeText;
  final String forgotPasswordText;
  final VoidCallback? onForgotPasswordPressed;

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
    this.emailLabelText = "Email",
    this.passwordLabelText = "Password",
    this.emailHintText = "Enter Email",
    this.passwordHintText = "Enter Password",
    this.rememberMeText = "Remember Me",
    this.forgotPasswordText = "Forgot Password?",
    this.onForgotPasswordPressed,
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
              Text(
                widget.emailLabelText,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxLow,
              TextFieldInput(
                errorMessage: widget.emailErrorMessage,
                controller: widget.emailController,
                hintText: widget.emailHintText,
                inputType: InputType.email,
                onChanged: widget.onChangedEmail,
                isValid: widget.isEmailValid ?? true,
              ),
              context.emptySizedHeightBoxNormal,
              Text(
                widget.passwordLabelText,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              context.emptySizedHeightBoxNormal,
              TextFieldInput(
                errorMessage: widget.passwordErrorMessage,
                controller: widget.passwordController,
                hintText: widget.passwordHintText,
                inputType: InputType.password,
                onChanged: widget.onChangedPassword,
                isValid: widget.isPasswordValid ?? true,
              ),
              context.emptySizedHeightBoxNormal,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          activeColor: ColorConstant.instance.primary_main,
                          value: widget.rememberMe,
                          onChanged: (value) {
                            if (value != null &&
                                widget.checkBoxOnChanged != null) {
                              widget.checkBoxOnChanged!(value);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.rememberMeText,
                        style:
                            TextStyle(color: ColorConstant.instance.neutral4),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: widget.onForgotPasswordPressed ?? () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      widget.forgotPasswordText,
                      style: TextStyle(
                        color: ColorConstant.instance.primary_main,
                      ),
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
