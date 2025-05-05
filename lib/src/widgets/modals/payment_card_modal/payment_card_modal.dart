import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentCardModal extends StatelessWidget {
  final String cartNumber;
  final String name;
  final String expirationDate;
  final Color? color;
  final String? brand;
  final String? cvvNumber;
  final bool? doesSupportNfc;
  final bool? placeNfcIconAtTheEnd;
  final bool? autoHideBalance;
  final bool? enableFlipping;
  final String? logoPath;
  final CardType? cardType;
  final String? validThru;
  final bool isSelected;

  final VoidCallback? onTap;

  const PaymentCardModal({
    super.key,
    required this.cartNumber,
    required this.name,
    required this.expirationDate,
    this.brand,
    this.color,
    this.cvvNumber,
    this.doesSupportNfc,
    this.placeNfcIconAtTheEnd,
    this.autoHideBalance,
    this.enableFlipping,
    this.logoPath,
    this.cardType = CardType.credit,
    this.validThru,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String logoPath = "";

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
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected == true
              ? ColorConstant.instance.primary_main.withOpacity(0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected == true
              ? [
                  BoxShadow(
                    color: ColorConstant.instance.primary_main.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
          border: Border.all(
            width: 1.5,
            color: isSelected == true
                ? ColorConstant.instance.primary_main.withOpacity(0.4)
                : Colors.transparent,
          ),
        ),
        child: CreditCardUi(
          width: 250,
          cardHolderFullName: name.isNotEmpty ? name : "",
          cardNumber:
              cartNumber.isNotEmpty ? cartNumber : "???? ????? ????? ???",
          doesSupportNfc: doesSupportNfc ?? true,
          placeNfcIconAtTheEnd: placeNfcIconAtTheEnd ?? true,
          cardType: cardType ?? CardType.credit,
          cvvNumber: cvvNumber ?? "",
          autoHideBalance: autoHideBalance ?? false,
          topLeftColor: color ?? ColorConstant.instance.primary_main,
          bottomRightColor: color ?? ColorConstant.instance.primary_darker,
          enableFlipping: enableFlipping ?? false,
          creditCardType: CreditCardType.none,
          cardProviderLogo: brand != null && logoPath.isNotEmpty
              ? Image.asset(logoPath)
              : null,
          validThru: validThru ?? expirationDate,
        ),
      ),
    );
  }
}
