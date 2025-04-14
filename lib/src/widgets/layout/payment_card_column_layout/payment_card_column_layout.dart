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
    paymentCardItems = widget.paymentCardItems ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              context.emptySizedHeightBoxNormal,
          itemCount: paymentCardItems.length,
          itemBuilder: (context, index) {
            return PaymentCardModal(
              cartNumber: paymentCardItems[index].cartNumber,
              name: paymentCardItems[index].name,
              isSelected: paymentCardItems[index].isSelected,
              color: paymentCardItems[index].color,
              expirationDate: paymentCardItems[index].expirationDate,
              brand: paymentCardItems[index].brand,
              onTap: paymentCardItems[index].onTap,
            );
          },
        ),
      ],
    );
  }
}
