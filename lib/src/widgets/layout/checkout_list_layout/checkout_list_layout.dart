import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CheckoutListLayout extends StatefulWidget {
  final List<ProductBoxModal> items;
  const CheckoutListLayout({super.key, required this.items});

  @override
  State<CheckoutListLayout> createState() => _CheckoutListLayoutState();
}

class _CheckoutListLayoutState extends State<CheckoutListLayout> {
  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  double calculateTotal() {
    double total = 0.0;
    for (final item in widget.items) {
      total += item.total;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProductBoxRowLayout(
                    item: ContentText(
                      text: "${widget.items[index].quantity}",
                      fontSize: 14,
                      color: ColorConstant.instance.neutral1,
                    ),
                    productBox: widget.items[index],
                  ),
                  context.emptySizedHeightBoxNormal,
                ],
              );
            },
          ),
        ),
        const CouponcodeTextfieldInput(),
        context.emptySizedHeightBoxNormal,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContentText(
              color: ColorConstant.instance.neutral1,
              fontSize: 18,
              text: "Total",
            ),
            ContentText(
              color: ColorConstant.instance.primary_main,
              fontSize: 18,
              text: "\$ ${calculateTotal().toStringAsFixed(2)}",
            ),
          ],
        ),
      ],
    );
  }
}
