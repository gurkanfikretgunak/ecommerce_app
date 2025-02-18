import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductCardModal extends StatelessWidget {
  final String imagePath;
  final String productStock;
  final String productName;
  final String productPrice;

  const ProductCardModal(
      {super.key,
      required this.imagePath,
      required this.productStock,
      required this.productName,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        ProductText(
          text: productStock,
          fontSize: 8,
          color: ColorConstant.instance.neutral4,
        ),
        ProductText(
          text: productName,
          fontSize: 12,
          color: ColorConstant.instance.neutral1,
        ),
        ProductText(
            text: productPrice,
            fontSize: 16,
            color: ColorConstant.instance.primary_main),
      ],
    );
  }
}
