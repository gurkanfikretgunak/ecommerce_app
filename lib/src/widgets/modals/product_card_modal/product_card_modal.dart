import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductCardModal extends StatelessWidget {
  final String imagePath;
  final String productStock;
  final String productName;
  final String productPrice;
  final VoidCallback? onTap;
  final double? imageHeight;

  const ProductCardModal({
    super.key,
    required this.imagePath,
    required this.productStock,
    required this.productName,
    this.imageHeight,
    required this.productPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: imageHeight ?? context.dynamicWidth(.47),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            context.emptySizedHeightBoxLow,
            ContentText(
              text: productStock,
              fontSize: 8,
              color: ColorConstant.instance.neutral4,
            ),
            context.emptySizedHeightBoxLow,
            ContentText(
              text: productName,
              fontSize: 12,
              color: ColorConstant.instance.neutral1,
            ),
            context.emptySizedHeightBoxLow,
            ContentText(
                text: productPrice,
                fontSize: 16,
                color: ColorConstant.instance.primary_main)
          ],
        ),
      ),
    );
  }
}
