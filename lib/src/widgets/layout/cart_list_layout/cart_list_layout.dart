import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/layout/product_box_row_layout/product_box_row_layout.dart';

class CartListLayout extends StatefulWidget {
  final List<ProductBoxModal> items;

  const CartListLayout({super.key, required this.items});

  @override
  State<CartListLayout> createState() => _CartListLayoutState();
}

class _CartListLayoutState extends State<CartListLayout> {
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
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ProductBoxRowLayout(
                    item: QuantitySelectorInput(
                      onQuantityChanged: (newQuantity) {
                        setState(() {
                          widget.items[index].quantity = newQuantity;
                        });
                      },
                    ),
                    productBox: widget.items[index],
                  ),
                  const SizedBox(height: 15),
                ],
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductText(
              color: ColorConstant.instance.neutral1,
              fontSize: 18,
              text: "Total",
            ),
            ProductText(
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
