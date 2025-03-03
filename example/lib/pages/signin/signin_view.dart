import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/signup/signup_view.dart';
import 'package:example/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SignInHeader(
                imagePath: Assets.images.signinheader.path,
                onPressed: () {
                  Navigator.pop(context);
                }),
            context.emptySizedHeightBoxNormal,
            const SignInForm(),
            context.emptySizedHeightBoxNormal,
            Column(
              children: [
                CustomButton(
                  text: "SIGN IN",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()));
                  },
                ),
                context.emptySizedHeightBoxLow,
                CustomButton(
                  icon: FontAwesomeIcons.google,
                  text: "SIGN IN WITH GOOGLE",
                  color: ColorConstant.instance.neutral9,
                  textColor: ColorConstant.instance.neutral1,
                  iconColor: ColorConstant.instance.neutral1,
                  onPressed: () {},
                ),
                context.emptySizedHeightBoxLow,
                CustomButton(
                  icon: FontAwesomeIcons.facebook,
                  text: "SIGN IN WITH FACEBOOK",
                  color: ColorConstant.instance.neutral9,
                  textColor: ColorConstant.instance.neutral1,
                  iconColor: ColorConstant.instance.neutral1,
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: ColorConstant.instance.primary_main,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
