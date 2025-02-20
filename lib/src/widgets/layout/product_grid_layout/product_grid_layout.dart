import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductGridLayout extends StatelessWidget {
  final double? width;
  final int? crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final double? childAspectRatio;
  final List<Widget> productItems;

  const ProductGridLayout({
    Key? key,
    required this.productItems,
    this.width,
    this.crossAxisCount,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: width ?? screenWidth,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount ?? 2,
          crossAxisSpacing: crossAxisSpacing ?? 16,
          mainAxisSpacing: mainAxisSpacing ?? 16,
          childAspectRatio: childAspectRatio ?? 0.6,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: productItems.length,
        itemBuilder: (context, index) {
          return productItems[index];
        },
      ),
    );
  }
}
