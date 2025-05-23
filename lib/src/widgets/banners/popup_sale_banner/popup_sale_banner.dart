import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class PopupSaleBanner extends StatefulWidget {
  final String imagePath;
  final String saleTitle;
  final String subTitle;
  final String discount;
  final BannerButton? button;
  final Function(bool)? checkBoxPressed;

  const PopupSaleBanner({
    super.key,
    required this.imagePath,
    required this.saleTitle,
    required this.subTitle,
    required this.discount,
    this.button,
    this.checkBoxPressed,
  });

  @override
  State<PopupSaleBanner> createState() => _PopupSaleBannerState();
}

class _PopupSaleBannerState extends State<PopupSaleBanner> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double dialogWidth;
    double dialogHeight;

    if (kIsWeb) {
      dialogWidth = screenWidth * 0.25;
      dialogHeight = screenHeight * 0.8;
    } else {
      dialogWidth = screenWidth * 0.8;
      dialogHeight = screenHeight * 0.7;
    }

    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: dialogWidth,
        height: dialogHeight,
        child: Stack(
          children: [
            Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              width: dialogWidth,
              height: dialogHeight,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    context.emptySizedHeightBoxNormal,
                    ContentText(
                      text: widget.subTitle,
                      fontSize: kIsWeb ? 18 : 22, // Web'de daha küçük font
                      color: ColorConstant.instance.neutral9,
                    ),
                    context.emptySizedHeightBoxLow,
                    HeadText(
                      text: "${widget.discount}%",
                      fontSize: kIsWeb ? 60 : 80, // Web'de daha küçük font
                      color: ColorConstant.instance.neutral9,
                    ),
                    BannerButton(
                      icon: Icons.arrow_forward,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    context.emptySizedHeightBoxLow,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: ColorConstant.instance.neutral4,
                          shape: const CircleBorder(),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                              if (widget.checkBoxPressed != null) {
                                widget.checkBoxPressed!(!isChecked);
                              }
                            });
                          },
                        ),
                        ContentText(
                          text: "Do not show popup anymore",
                          fontSize: 10,
                          color: ColorConstant.instance.neutral4,
                        ),
                      ],
                    ),
                    context.emptySizedHeightBoxNormal,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 10,
              child: SizedBox(
                width: 67,
                child: HeadText(
                  textAlign: TextAlign.start,
                  softWrap: true,
                  text: widget.saleTitle,
                  fontSize: kIsWeb ? 20 : 23, // Web'de daha küçük font
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
                    color: ColorConstant.instance.neutral9,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
