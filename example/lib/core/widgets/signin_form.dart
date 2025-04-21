import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

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
              ContentText(
                text: L10n.of(context)!.email,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              context.emptySizedHeightBoxLow,
              TextFieldInput(
                controller: emailController,
                hintText: L10n.of(context)!.enterEmail,
                inputType: InputType.email,
                onChanged: widget.onChangedEmail,
              ),
              context.emptySizedHeightBoxNormal,
              ContentText(
                text: L10n.of(context)!.password,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              context.emptySizedHeightBoxNormal,
              TextFieldInput(
                hintText: L10n.of(context)!.enterPassword,
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
                        L10n.of(context)!.rememberMe,
                        style:
                            TextStyle(color: ColorConstant.instance.neutral4),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      L10n.of(context)!.forgotPassword,
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
