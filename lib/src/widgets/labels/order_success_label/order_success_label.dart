import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OrderSuccessLabel extends StatelessWidget {
  final String title;
  final String description;
  final String primaryButtonText;
  final VoidCallback onPrimaryButtonPressed;
  final Color? primaryButtonColor;
  final String secondaryButtonText;
  final VoidCallback onSecondaryButtonPressed;
  final Color? secondaryButtonColor;
  final String succesiconPath;
  final Color? secondaryButtonTextColor;
  final double? buttonHeight;
  final double? titleFontSize;
  final String iconPath;

  const OrderSuccessLabel({
    super.key,
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.onPrimaryButtonPressed,
    this.primaryButtonColor,
    required this.secondaryButtonText,
    required this.onSecondaryButtonPressed,
    this.secondaryButtonColor,
    this.secondaryButtonTextColor,
    this.buttonHeight,
    this.titleFontSize,
    required this.iconPath,
    required this.succesiconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadiusIconLabel(
          iconPath: iconPath,
          successIconPath: succesiconPath,
          color: ColorConstant.instance.primary_main,
        ),
        context.emptySizedHeightBoxNormal,
        HeadText(
          fontSize: titleFontSize ?? 30,
          color: ColorConstant.instance.neutral1,
          text: title,
        ),
        context.emptySizedHeightBoxNormal,
        SizedBox(
          width: 300,
          child: ProductText(
            fontSize: 14,
            softWrap: true,
            color: ColorConstant.instance.neutral4,
            text: description,
          ),
        ),
        context.emptySizedHeightBoxNormal,
        CustomButton(
          onPressed: onPrimaryButtonPressed,
          color: primaryButtonColor ?? ColorConstant.instance.primary_main,
          height: buttonHeight ?? 40,
          text: primaryButtonText,
        ),
        context.emptySizedHeightBoxNormal,
        CustomButton(
          onPressed: onSecondaryButtonPressed,
          color: secondaryButtonColor ?? ColorConstant.instance.neutral9,
          borderColor: ColorConstant.instance.neutral5,
          textColor:
              secondaryButtonTextColor ?? ColorConstant.instance.neutral1,
          height: buttonHeight ?? 40,
          text: secondaryButtonText,
        ),
      ],
    );
  }
}
