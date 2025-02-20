import 'package:flutter/material.dart';

class ProductRowLayout extends StatelessWidget {
  final List<Widget> items;
  final double? height;
  final double? itemsWidth;

  const ProductRowLayout(
      {super.key, required this.items, this.height, this.itemsWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              width: itemsWidth ?? 160,
              child: items[index],
              margin: EdgeInsets.only(right: 20),
            );
          }),
    );
  }
}
