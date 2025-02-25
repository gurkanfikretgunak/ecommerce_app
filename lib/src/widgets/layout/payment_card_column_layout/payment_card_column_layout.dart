import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class PaymentCardColumnLayout extends StatefulWidget {
  final List<PaymentCardModal>? paymentCardItems;
  const PaymentCardColumnLayout({super.key, this.paymentCardItems});

  @override
  State<PaymentCardColumnLayout> createState() =>
      _PaymentCardColumnLayoutState();
}

class _PaymentCardColumnLayoutState extends State<PaymentCardColumnLayout> {
  late List<PaymentCardModal> paymentCardItems;
  @override
  void initState() {
    super.initState();
    paymentCardItems = widget.paymentCardItems ??
        [
          PaymentCardModal(
              cartNumber: "1234567891011121",
              name: "Kaan Çerkez",
              brand: CartBrand.mastercard,
              expirationDate: "09/29"),
          PaymentCardModal(
              cartNumber: "99999999999999999999",
              name: "Kaan Çerkez",
              color: ColorConstant.instance.neutral1,
              brand: CartBrand.mastercard,
              expirationDate: "09/29"),
          PaymentCardModal(
              cartNumber: "1234567891011121",
              name: "Kaan Çerkez",
              cvvNumber: "222",
              color: ColorConstant.instance.secondary2,
              brand: CartBrand.mastercard,
              expirationDate: "09/29"),
        ];
  }

  final List<PaymentCardModal> items = [
    PaymentCardModal(
        cartNumber: "1234567891011121",
        name: "Kaan Çerkez",
        brand: CartBrand.mastercard,
        expirationDate: "09/29"),
    PaymentCardModal(
        cartNumber: "99999999999999999999",
        name: "Kaan Çerkez",
        color: ColorConstant.instance.neutral1,
        brand: CartBrand.mastercard,
        expirationDate: "09/29"),
    PaymentCardModal(
        cartNumber: "1234567891011121",
        name: "Kaan Çerkez",
        cvvNumber: "222",
        color: ColorConstant.instance.secondary2,
        brand: CartBrand.mastercard,
        expirationDate: "09/29"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return PaymentCardModal(
              cartNumber: items[index].cartNumber,
              name: items[index].name,
              color: items[index].color,
              expirationDate: items[index].expirationDate,
              brand: items[index].brand,
            );
          },
        ),
      ],
    );
  }
}
