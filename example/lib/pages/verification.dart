import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController otpController = TextEditingController();

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
            child: CustomAppbar(iconColor: ColorConstant.instance.neutral1),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "VERIFICATION CODE",
                style: GoogleFonts.bebasNeue(fontSize: 30),
              ),
              Text.rich(
                TextSpan(
                  text: "We have sent the code verification your number\n",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 12,
                    color: ColorConstant.instance.neutral4,
                  ),
                  children: [
                    TextSpan(
                      text: "your number (480) 555-0103",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 12,
                        color: ColorConstant.instance.neutral4,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(height: 5),
          OtpTextfieldInput(
            controller: otpController,
          ),
          SizedBox(
            height: 80,
          ),
          Text("01:40"),
          CustomButton(
            text: "SUBMIT",
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the code?",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: ColorConstant.instance.neutral4,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "RESEND",
                    style: TextStyle(
                      color: ColorConstant.instance.neutral1,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
