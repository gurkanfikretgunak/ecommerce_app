import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CategoriesRowLayout extends StatelessWidget {
  final List<Widget> items;
  final double? height;
  final double? itemsWidth;

  const CategoriesRowLayout(
      {super.key, required this.items, this.height, this.itemsWidth});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double calculatedMargin;

    if (kIsWeb) {
      calculatedMargin = screenWidth * 0.1;
    } else {
      calculatedMargin = screenWidth * 0.05;
    }

    return SizedBox(
      height: height ?? 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              width: itemsWidth ?? 75,
              margin: EdgeInsets.only(right: calculatedMargin),
              child: items[index],
            );
          }),
    );
  }
}
