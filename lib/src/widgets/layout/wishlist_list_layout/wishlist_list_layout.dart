import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class WishlistListLayout extends StatefulWidget {
  final List<ProductBoxModal> items;
  const WishlistListLayout({super.key, required this.items});

  @override
  State<WishlistListLayout> createState() => _WishlistListLayoutState();
}

class _WishlistListLayoutState extends State<WishlistListLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                item: const CartAddRemoveButtonLabel(),
                productBox: widget.items[index],
              ),
              context.emptySizedHeightBoxNormal,
            ],
          );
        },
      ),
    );
  }
}
