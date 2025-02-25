import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class PaymentCartColumnLayout extends StatefulWidget {
  const PaymentCartColumnLayout({super.key});

  @override
  State<PaymentCartColumnLayout> createState() =>
      _PaymentCartColumnLayoutState();
}

class _PaymentCartColumnLayoutState extends State<PaymentCartColumnLayout> {
  final List<PaymentCartModal> items = [
    PaymentCartModal(
        cartNumber: "1234567891011121",
        name: "Kaan Çerkez",
        brand: CartBrand.mastercard,
        expirationDate: "09/29"),
    PaymentCartModal(
        cartNumber: "99999999999999999999",
        name: "Kaan Çerkez",
        color: ColorConstant.instance.neutral1,
        brand: CartBrand.mastercard,
        expirationDate: "09/29"),
    PaymentCartModal(
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
            return PaymentCartModal(
              cartNumber: items[index].cartNumber,
              name: items[index].name,
              color: items[index].color,
              expirationDate: items[index].expirationDate,
              brand: items[index].brand,
            );
          },
        )
      ],
    );
  }
}
