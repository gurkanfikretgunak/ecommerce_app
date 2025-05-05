import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class PaymentCardColumnLayout extends StatefulWidget {
  final List<PaymentCardModal>? paymentCardItems;
  final Function(int)? deletePaymentCardCallBack;
  const PaymentCardColumnLayout(
      {super.key, this.paymentCardItems, this.deletePaymentCardCallBack});

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
            return Dismissible(
              key: Key(paymentCardItems[index].cartNumber),
              direction: DismissDirection.endToStart,
              background: Container(),
              secondaryBackground: Container(
                color: ColorConstant.instance.secondary2,
                alignment: Alignment.centerRight,
                // padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return true;
                }
                return false;
              },
              onDismissed: (direction) {
                setState(() {
                  paymentCardItems.removeAt(index);
                  if (widget.deletePaymentCardCallBack != null) {
                    widget.deletePaymentCardCallBack!(index);
                  }
                });
              },
              child: Center(
                child: PaymentCardModal(
                  cartNumber: paymentCardItems[index].cartNumber,
                  name: paymentCardItems[index].name,
                  isSelected: paymentCardItems[index].isSelected,
                  color: paymentCardItems[index].color,
                  expirationDate: paymentCardItems[index].expirationDate,
                  brand: paymentCardItems[index].brand,
                  onTap: paymentCardItems[index].onTap,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
