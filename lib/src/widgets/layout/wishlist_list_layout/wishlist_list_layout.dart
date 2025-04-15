import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class WishlistListLayout extends StatefulWidget {
  final List<ProductBoxModal> items;
  final VoidCallback? onCartAddPressed;
  final Function(int)? onRemovePressed;
  const WishlistListLayout(
      {super.key,
      required this.items,
      this.onCartAddPressed,
      this.onRemovePressed});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductBoxRowLayout(
                item: CartAddRemoveButtonLabel(
                  onRemovePressed: (_) {
                    if (widget.onRemovePressed != null) {
                      // ignore: prefer_null_aware_method_calls
                      widget.onRemovePressed!(index);
                    }
                  },
                ),
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
