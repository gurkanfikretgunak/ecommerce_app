import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

enum CartBrand { mastercard, visa }

class PaymentMethodBoxModal extends StatelessWidget {
  final String? brand;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? fontSize;
  final double? iconSize;

  final VoidCallback? onTap;

  const PaymentMethodBoxModal({
    super.key,
    this.brand,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.titleColor,
    this.fontSize,
    this.iconSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String logoPath;

    switch (brand) {
      case "Visa":
        logoPath = "assets/images/Visa.png";

        break;
      case "MasterCard":
        logoPath = "assets/images/mastercard.png";

        break;
      case "American Express":
        logoPath = "assets/images/amex.png";

        break;
      default:
        logoPath = "";
    }

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 60,
        color: backgroundColor ?? ColorConstant.instance.neutral7,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContentText(
                  text: "Payment Method",
                  fontSize: fontSize ?? 10,
                  color: titleColor ?? ColorConstant.instance.neutral4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (logoPath.isNotEmpty)
                          Image.asset(
                            logoPath,
                            width: 40,
                          ),
                        if (logoPath.isNotEmpty)
                          const SizedBox(
                            width: 5,
                          ),
                        context.emptySizedWidthBoxLow,
                        ContentText(
                          text: text,
                          fontSize: fontSize ?? 12,
                          color: textColor ?? ColorConstant.instance.neutral1,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: iconSize ?? 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
