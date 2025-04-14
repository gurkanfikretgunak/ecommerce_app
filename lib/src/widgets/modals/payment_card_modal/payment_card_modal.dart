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
    this.doesSupportNfc = true,
    this.placeNfcIconAtTheEnd = true,
    this.autoHideBalance = true,
    this.enableFlipping = true,
    this.logoPath,
    this.cardType = CardType.credit,
    this.validThru,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String logoPath = "";
    CreditCardType? creditCardType;

    switch (brand) {
      case "Visa":
        logoPath = "assets/images/Visa.png";
        creditCardType = CreditCardType.visa;
        break;
      case "MasterCard":
        logoPath = "assets/images/mastercard.png";
        creditCardType = CreditCardType.mastercard;
        break;
      case "American Express":
        logoPath = "assets/images/amex.png";
        creditCardType = CreditCardType.amex;
        break;
      default:
        logoPath = "";
        creditCardType = CreditCardType.none;
    }

    return GestureDetector(
      onTap: onTap ?? () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: BorderDirectional(
            bottom: BorderSide(
              color: ColorConstant.instance.neutral7,
            ),
            start: isSelected == true
                ? BorderSide(
                    width: 3,
                    color: ColorConstant.instance.primary_main,
                  )
                : BorderSide.none,
          ),
        ),
        child: CreditCardUi(
          width: 320,
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
          enableFlipping: enableFlipping ?? true,
          creditCardType: creditCardType ?? CreditCardType.none,
          cardProviderLogo: brand != null && logoPath.isNotEmpty
              ? Image.asset(logoPath)
              : null,
          validThru: validThru ?? expirationDate,
        ),
      ),
    );
  }
}
