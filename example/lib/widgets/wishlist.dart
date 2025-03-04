import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Wishlist extends StatelessWidget {
  final List<ProductBoxModal> items;
  const Wishlist({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return WishlistListLayout(items: items);
  }
}
