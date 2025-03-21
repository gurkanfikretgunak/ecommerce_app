import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentCardModal extends StatelessWidget {
  final String cartNumber;
  final String name;
  final String expirationDate;
  final Color? color;
  final CartBrand? brand;
  final String? cvvNumber;
  final bool? doesSupportNfc;
  final bool? placeNfcIconAtTheEnd;
  final bool? autoHideBalance;
  final bool? enableFlipping;
  final String? logoPath;
  final CardType? cardType;
  final String? validThru;

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
    return CreditCardUi(
      width: 320,
      cardHolderFullName: name.isNotEmpty ? name : "",
      cardNumber: cartNumber.isNotEmpty ? cartNumber : "???? ????? ????? ???",
      doesSupportNfc: doesSupportNfc ?? true,
      placeNfcIconAtTheEnd: placeNfcIconAtTheEnd ?? true,
      cardType: cardType ?? CardType.credit,
      cvvNumber: cvvNumber ?? "",
      autoHideBalance: autoHideBalance ?? false,
      topLeftColor: color ?? ColorConstant.instance.primary_main,
      bottomRightColor: color ?? ColorConstant.instance.primary_darker,
      enableFlipping: enableFlipping ?? true,
      cardProviderLogo: brand != null ? Image.asset(logoPath) : null,
      validThru: validThru ?? expirationDate,
    );
  }
}
