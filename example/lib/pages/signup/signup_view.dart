import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/pages/mainpage/mainpage_view.dart';
import 'package:example/pages/verifiticion/verification_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  Future<User?>? _signUpFuture;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            text: "CREATE YOUR ACCOUNT",
            onPressed: () {
              Navigator.pop(context);
            },
            iconColor: ColorConstant.instance.neutral1,
          )),
      backgroundColor: ColorConstant.instance.neutral9,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 20, top: screenHeigth * 0.03)),
          const SignUpForm(),
          CustomButton(
            text: "SIGN UP",
            onPressed: () {
              AutoRouter.of(context).push(const VerificationViewRoute());
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerificationView())))*/
            },
          ),
          context.emptySizedHeightBoxLow,
          CustomButton(
            icon: FontAwesomeIcons.google,
            text: "SIGN UP WITH GOOGLE",
            color: ColorConstant.instance.neutral9,
            textColor: ColorConstant.instance.neutral1,
            iconColor: ColorConstant.instance.neutral1,
            onPressed: () {
              setState(() {
                _signUpFuture = AuthService().signUpWithGoogle();
              });
            },
          ),
          context.emptySizedHeightBoxLow,
          CustomButton(
            icon: FontAwesomeIcons.facebook,
            text: "SIGN UP WITH FACEBOOK",
            color: ColorConstant.instance.neutral9,
            textColor: ColorConstant.instance.neutral1,
            iconColor: ColorConstant.instance.neutral1,
            onPressed: () {},
          ),
          if (_signUpFuture != null)
            FutureBuilder<User?>(
                future: _signUpFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        AutoRouter.of(context)
                            .replaceAll([MainpageViewRoute()]);
                      });
                    }
                  }
                  return Container();
                })
        ],
      ),
    );
  }
}
