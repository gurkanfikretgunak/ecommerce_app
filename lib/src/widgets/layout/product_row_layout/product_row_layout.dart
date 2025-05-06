import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

    double calculatedHeight;
    if (kIsWeb) {
      calculatedHeight = height ?? screenHeight * 0.9;
    } else {
      calculatedHeight = height ?? screenHeight * 0.4;
    }

    double calculatedWidth;
    double calculatedMargin;

    if (kIsWeb) {
      if (screenWidth > 1200) {
        calculatedWidth = itemsWidth ?? screenWidth * 0.30;
        calculatedMargin = screenWidth * 0.04;
      } else if (screenWidth > 800) {
        calculatedWidth = itemsWidth ?? screenWidth * 0.35;
        calculatedMargin = screenWidth * 0.03;
      } else {
        calculatedWidth = itemsWidth ?? screenWidth * 0.40;
        calculatedMargin = screenWidth * 0.04;
      }
    } else {
      calculatedWidth = itemsWidth ?? screenWidth * 0.4;
      calculatedMargin = screenWidth * 0.05;
    }

    return SizedBox(
      height: calculatedHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: calculatedWidth,
            margin: EdgeInsets.only(right: calculatedMargin),
            child: items[index],
          );
        },
      ),
    );
  }
}
