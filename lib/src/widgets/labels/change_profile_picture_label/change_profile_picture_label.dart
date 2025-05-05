import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ChangeProfilePictureLabel extends StatefulWidget {
  final String? title;
  final String description;
  final String buttonText;
  final Color? buttonColor;
  final double? buttonHeight;
  final double? titleFontSize;
  final String imagePath;
  final VoidCallback? buttonOnPressed;

  const ChangeProfilePictureLabel(
      {super.key,
      this.title,
      required this.description,
      required this.buttonText,
      this.buttonColor,
      this.buttonHeight,
      this.titleFontSize,
      required this.imagePath,
      this.buttonOnPressed});

  @override
  State<ChangeProfilePictureLabel> createState() =>
      _ChangeProfilePictureLabelState();
}

class _ChangeProfilePictureLabelState extends State<ChangeProfilePictureLabel> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AccountPictureLabel(
                      imagePath: widget.imagePath,
                      imageHeight: 120,
                      imageWidth: 120,
                    ),
                    context.emptySizedHeightBoxNormal,
                    HeadText(
                      fontSize: widget.titleFontSize ?? 30,
                      color: ColorConstant.instance.neutral1,
                      text: widget.title ?? '',
                    ),
                    context.emptySizedHeightBoxNormal,
                    SizedBox(
                      width: 300,
                      child: ContentText(
                        fontSize: 14,
                        softWrap: true,
                        color: ColorConstant.instance.neutral4,
                        text: widget.description,
                      ),
                    ),
                    context.emptySizedHeightBoxNormal,
                    CustomButton(
                      onPressed: widget.buttonOnPressed,
                      color: widget.buttonColor ??
                          ColorConstant.instance.primary_main,
                      height: widget.buttonHeight ?? 40,
                      text: widget.buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
