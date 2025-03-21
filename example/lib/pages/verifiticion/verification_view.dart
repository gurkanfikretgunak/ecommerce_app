import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/pages/mainpage/mainpage_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            text: "VERIFICATION CODE",
            onPressed: () {
              Navigator.pop(context);
            },
            iconColor: ColorConstant.instance.neutral1,
          )),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: screenHeigth * 0.03),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          context.emptySizedHeightBoxLow,
          OtpTextfieldInput(
            controller: otpController,
          ),
          context.emptySizedHeightBoxHigh,
          const Text("01:40"),
          CustomButton(
            text: "SUBMIT",
            onPressed: () {
              AutoRouter.of(context).push(MainpageViewRoute());
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainpageView()));*/
            },
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
