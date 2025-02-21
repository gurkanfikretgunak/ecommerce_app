import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductInfoLabel extends StatelessWidget {
  final String? rating;
  final String? reviewCount;
  final Color? starColor;
  final Color? ratingColor;
  final Color? reviewColor;
  final String soldCount;
  final String productName;
  final String description;

  const ProductInfoLabel({
    super.key,
    this.rating,
    this.reviewCount,
    this.starColor,
    this.ratingColor,
    this.reviewColor,
    required this.soldCount,
    required this.productName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RatingText(
              rating: rating,
              reviewCount: reviewCount,
              starColor: starColor,
              ratingColor: ratingColor,
              reviewColor: reviewColor,
            ),
            Expanded(child: SizedBox()),
            ProductText(
              fontSize: 12,
              text: "Sold ($soldCount products)",
              color: ColorConstant.instance.neutral5,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ProductText(
          fontSize: 18,
          text: productName,
          color: ColorConstant.instance.neutral1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ProductDescriptionText(
              text: description,
            )),
      ],
    );
  }
}
