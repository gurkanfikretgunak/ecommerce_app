import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductBoxRowLayout extends StatefulWidget {
  final ProductBoxModal productBox;
  final Widget? item;
  const ProductBoxRowLayout({super.key, required this.productBox, this.item});

  @override
  State<ProductBoxRowLayout> createState() => _ProductBoxRowLayoutState();
}

class _ProductBoxRowLayoutState extends State<ProductBoxRowLayout> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: widget
                .productBox), // Bu, productBox'ın fazla alan kaplamasını engeller.
        if (widget.item != null) widget.item!,
        const SizedBox.shrink()
      ],
    );
  }
}
