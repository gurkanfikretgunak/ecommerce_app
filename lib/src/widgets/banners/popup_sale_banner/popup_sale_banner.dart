import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopupSaleBanner extends StatefulWidget {
  final String imagePath;
  final String saleTitle;
  final String subTitle;
  final String discount;
  final BannerButton? button;

  const PopupSaleBanner({
    super.key,
    required this.imagePath,
    required this.saleTitle,
    required this.subTitle,
    required this.discount,
    this.button,
  });

  @override
  State<PopupSaleBanner> createState() => _PopupSaleBannerState();
}

class _PopupSaleBannerState extends State<PopupSaleBanner> {
  bool isChecked = false;

  Future<void> _setNotShowAgain() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('hidePopup', true);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Stack(
          children: [
            Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.7,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    ProductText(
                      text: widget.subTitle,
                      fontSize: 22,
                      color: ColorConstant.instance.neutral9,
                    ),
                    const SizedBox(height: 2),
                    HeadText(
                      text: "${widget.discount}%",
                      fontSize: 80,
                      color: ColorConstant.instance.neutral9,
                    ),
                    if (widget.button != null) widget.button!,
                    const SizedBox(height: 2),
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
                            });
                            if (value!) _setNotShowAgain();
                          },
                        ),
                        ProductText(
                          text: "Do not show popup anymore",
                          fontSize: 10,
                          color: ColorConstant.instance.neutral4,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 10,
              child: Container(
                width: 67,
                child: HeadText(
                  textAlign: TextAlign.start,
                  softWrap: true,
                  text: widget.saleTitle,
                  fontSize: 28,
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
