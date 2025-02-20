import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductCardModal extends StatelessWidget {
  final String imagePath;
  final String productStock;
  final String productName;
  final String productPrice;
  final VoidCallback? onTap;
  final double? imageHeight;

  const ProductCardModal(
      {super.key,
      required this.imagePath,
      required this.productStock,
      required this.productName,
      this.imageHeight,
      required this.productPrice,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: imageHeight ?? 180,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8),
          ProductText(
            text: productStock,
            fontSize: 8,
            color: ColorConstant.instance.neutral4,
          ),
          SizedBox(height: 4),
          ProductText(
            text: productName,
            fontSize: 12,
            color: ColorConstant.instance.neutral1,
          ),
          SizedBox(height: 4),
          ProductText(
              text: productPrice,
              fontSize: 16,
              color: ColorConstant.instance.primary_main),
        ],
      ),
    );
  }
}
