import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

enum CartBrand { mastercard, visa }

class PaymentMethodBoxModal extends StatelessWidget {
  final CartBrand? brand;
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
      case CartBrand.mastercard:
        logoPath = 'assets/images/mastercard.png';
        break;
      case CartBrand.visa:
        logoPath = 'assets/images/visa.png';
        break;
      default:
        logoPath = 'assets/images/mastercard.png';
        break;
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
                ProductText(
                  text: "Payment Method",
                  fontSize: fontSize ?? 10,
                  color: titleColor ?? ColorConstant.instance.neutral4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(logoPath),
                        context.emptySizedWidthBoxLow,
                        ProductText(
                          text: text,
                          fontSize: fontSize ?? 14,
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
