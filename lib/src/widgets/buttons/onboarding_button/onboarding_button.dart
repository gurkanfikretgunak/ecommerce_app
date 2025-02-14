import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OnboardingButton extends StatelessWidget {
  final VoidCallback onNext;
  const OnboardingButton({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: ColorConstant.instance.neutral9,
        ),
        child: IconButton(
          onPressed: onNext,
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: ColorConstant.instance.neutral1,
            weight: 12,
          ),
        ));
  }
}
