import 'package:auto_route/auto_route.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  Future<User?>? _signInFuture;

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
                  AutoRouter.of(context).push(const OnboardingViewRoute());
                }),
            context.emptySizedHeightBoxNormal,
            const SignInForm(),
            context.emptySizedHeightBoxNormal,
            Column(
              children: [
                CustomButton(
                  text: "SIGN IN",
                  onPressed: () {},
                ),
                context.emptySizedHeightBoxLow,
                CustomButton(
                  icon: FontAwesomeIcons.google,
                  text: "SIGN IN WITH GOOGLE",
                  color: ColorConstant.instance.neutral9,
                  textColor: ColorConstant.instance.neutral1,
                  iconColor: ColorConstant.instance.neutral1,
                  onPressed: () {
                    setState(() {
                      _signInFuture = AuthService().signUpWithGoogle();
                    });
                  },
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
                        onPressed: () {
                          AutoRouter.of(context).push(SignUpViewRoute());
                          /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));*/
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: ColorConstant.instance.primary_main,
                          ),
                        ))
                  ],
                ),
                if (_signInFuture != null)
                  FutureBuilder<User?>(
                    future: _signInFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            AutoRouter.of(context).replaceAll([
                              MainpageViewRoute()
                            ]); /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainpageView()));*/
                          });
                        } else {
                          return Text('Sign in failed');
                        }
                      }
                      return Container();
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
