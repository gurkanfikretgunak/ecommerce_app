import 'package:example/pages/verification.dart';
import 'package:example/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20, top: screenHeigth * 0.03),
              child: CustomAppbar(iconColor: ColorConstant.instance.neutral1)),
          Text("CREATE YOUR ACCOUNT",
              style: GoogleFonts.bebasNeue(fontSize: 30)),
          SignUpForm(),
          CustomButton(
            text: "SIGN UP",
            onPressed: () {},
          ),
          SizedBox(height: 5),
          CustomButton(
            icon: FontAwesomeIcons.google,
            text: "SIGN UP WITH GOOGLE",
            color: ColorConstant.instance.neutral9,
            textColor: ColorConstant.instance.neutral1,
            iconColor: ColorConstant.instance.neutral1,
            onPressed: () {},
          ),
          SizedBox(height: 5),
          CustomButton(
            icon: FontAwesomeIcons.facebook,
            text: "SIGN UP WITH FACEBOOK",
            color: ColorConstant.instance.neutral9,
            textColor: ColorConstant.instance.neutral1,
            iconColor: ColorConstant.instance.neutral1,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
