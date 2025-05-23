import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class PopupSuccesLabel extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color? buttonColor;
  final double? buttonHeight;
  final double? titleFontSize;
  final String iconPath;
  final VoidCallback buttonOnPressed;
  final String? succesIconPath;

  const PopupSuccesLabel({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.buttonColor,
    this.buttonHeight,
    this.titleFontSize,
    required this.iconPath,
    required this.buttonOnPressed,
    this.succesIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Container(
            color: ColorConstant.instance.neutral9,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RadiusIconLabel(
                      iconPath: iconPath,
                      topRightIconPath:
                          succesIconPath ?? "assets/icons/success.svg",
                      radiusColor: ColorConstant.instance.green2,
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
                      child: ContentText(
                        fontSize: 14,
                        softWrap: true,
                        color: ColorConstant.instance.neutral4,
                        text: description,
                      ),
                    ),
                    context.emptySizedHeightBoxNormal,
                    CustomButton(
                      onPressed: buttonOnPressed,
                      color: buttonColor ?? ColorConstant.instance.primary_main,
                      height: buttonHeight ?? 40,
                      text: buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: ColorConstant.instance.neutral1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
