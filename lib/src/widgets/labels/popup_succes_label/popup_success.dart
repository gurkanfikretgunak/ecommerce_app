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
                    SuccessLabelRadius(
                      iconPath: iconPath,
                    ),
                    const SizedBox(height: 10),
                    HeadText(
                      fontSize: titleFontSize ?? 30,
                      color: ColorConstant.instance.neutral1,
                      text: title,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: ProductText(
                        fontSize: 14,
                        softWrap: true,
                        color: ColorConstant.instance.neutral4,
                        text: description,
                      ),
                    ),
                    const SizedBox(height: 30),
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
