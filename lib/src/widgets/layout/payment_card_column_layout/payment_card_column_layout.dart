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
          const PaymentCardModal(
              cartNumber: "1234567891011121",
              name: "Kaan Çerkez",
              brand: CartBrand.mastercard,
              expirationDate: "09/29"),
          PaymentCardModal(
            cartNumber: "99999999999999999999",
            name: "Kaan Çerkez",
            color: ColorConstant.instance.neutral1,
            brand: CartBrand.mastercard,
            expirationDate: "09/29",
          ),
        ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: paymentCardItems.length,
          itemBuilder: (context, index) {
            return PaymentCardModal(
              cartNumber: paymentCardItems[index].cartNumber,
              name: paymentCardItems[index].name,
              color: paymentCardItems[index].color,
              expirationDate: paymentCardItems[index].expirationDate,
              brand: paymentCardItems[index].brand,
            );
          },
        ),
      ],
    );
  }
}
