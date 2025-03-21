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
    super.key,
    required this.productItems,
    this.width,
    this.crossAxisCount,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width ?? screenWidth,
      child: GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount ?? 2,
          crossAxisSpacing: crossAxisSpacing ?? 15,
          mainAxisSpacing: mainAxisSpacing ?? 17,
          childAspectRatio: childAspectRatio ?? 0.6,
        ),
        padding: const EdgeInsets.all(8),
        itemCount: productItems.length,
        itemBuilder: (context, index) {
          return productItems[index];
        },
      ),
    );
  }
}
