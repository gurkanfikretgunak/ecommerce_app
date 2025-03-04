import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Order extends StatelessWidget {
  final List<ProductBoxModal> items;
  const Order({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return MyorderListLayout(items: items);
  }
}
