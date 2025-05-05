import 'package:flutter/material.dart';

class CategoriesRowLayout extends StatelessWidget {
  final List<Widget> items;
  final double? height;
  final double? itemsWidth;

  const CategoriesRowLayout(
      {super.key, required this.items, this.height, this.itemsWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              width: itemsWidth ?? 75,
              margin: const EdgeInsets.only(right: 20),
              child: items[index],
            );
          }),
    );
  }
}
