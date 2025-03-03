import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/signup.dart';
import 'package:example/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            SizedBox(
              height: 20,
            ),
            SignInForm(),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CustomButton(
                  text: "SIGN IN",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
                SizedBox(height: 5),
                CustomButton(
                  icon: FontAwesomeIcons.google,
                  text: "SIGN IN WITH GOOGLE",
                  color: ColorConstant.instance.neutral9,
                  textColor: ColorConstant.instance.neutral1,
                  iconColor: ColorConstant.instance.neutral1,
                  onPressed: () {},
                ),
                SizedBox(height: 5),
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
                    Text("Don’t have an account?"),
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
