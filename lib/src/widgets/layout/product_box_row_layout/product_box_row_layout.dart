import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductBoxRowLayout extends StatefulWidget {
  final ProductBoxModal? productBox;
  final ProductOrderBoxModal? productOrderBoxModal;
  final Widget? item;
  const ProductBoxRowLayout(
      {super.key, this.productBox, this.item, this.productOrderBoxModal});

  @override
  State<ProductBoxRowLayout> createState() => _ProductBoxRowLayoutState();
}

class _ProductBoxRowLayoutState extends State<ProductBoxRowLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: widget.productBox ??
                widget.productOrderBoxModal ??
                const SizedBox.shrink()),
        if (widget.item != null) widget.item!,
        const SizedBox.shrink()
      ],
    );
  }
}
