import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CartListLayout extends StatefulWidget {
  final List<ProductBoxModal> items;
  final Function(int, int)? onQuantityChanged;

  const CartListLayout({
    super.key,
    required this.items,
    this.onQuantityChanged,
  });

  @override
  State<CartListLayout> createState() => _CartListLayoutState();
}

class _CartListLayoutState extends State<CartListLayout> {
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    total = calculateTotal();
  }

  double calculateTotal() {
    double total = 0.0;
    for (final item in widget.items) {
      total += item.total;
    }
    return total;
  }

  void _onQuantityChanged(int index, int newQuantity) {
    if (widget.onQuantityChanged != null) {
      widget.onQuantityChanged!(index, newQuantity);
    }
    setState(() {
      widget.items[index].quantity = newQuantity;
      total = calculateTotal();
    });
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
              print(widget.items[index].quantity);
              return Column(
                children: [
                  ProductBoxRowLayout(
                    item: QuantitySelectorInput(
                      count: widget.items[index].quantity,
                      onQuantityChanged: (newQuantity) {
                        _onQuantityChanged(index, newQuantity);
                      },
                    ),
                    productBox: widget.items[index],
                  ),
                  context.emptySizedHeightBoxNormal,
                ],
              );
            },
          ),
        ),
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
              text: "\$ ${total.toStringAsFixed(2)}",
            ),
          ],
        ),
      ],
    );
  }
}
