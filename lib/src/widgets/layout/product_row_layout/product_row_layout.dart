import 'package:flutter/material.dart';

class ProductRowLayout extends StatelessWidget {
  final List<Widget> items;
  final double? height;
  final double? itemsWidth;

  const ProductRowLayout({
    super.key,
    required this.items,
    this.height,
    this.itemsWidth,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height ?? screenHeight * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: itemsWidth ?? screenWidth * 0.4,
            margin: EdgeInsets.only(right: screenWidth * 0.05), // %5 boşluk
            child: items[index],
          );
        },
      ),
    );
  }
}
