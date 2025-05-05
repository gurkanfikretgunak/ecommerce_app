import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RatingText extends StatelessWidget {
  final String? rating;
  final String? reviewCount;
  final Color? starColor;
  final Color? ratingColor;
  final Color? reviewColor;

  const RatingText({
    super.key,
    this.rating,
    this.reviewCount,
    this.starColor,
    this.ratingColor,
    this.reviewColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: starColor ?? ColorConstant.instance.yellow1,
        ),
        context.emptySizedWidthBoxLow,
        ContentText(
          fontSize: 12,
          text: rating ?? "0,0",
          color: ratingColor ?? ColorConstant.instance.neutral1,
        ),
        context.emptySizedWidthBoxLow,
        ContentText(
          fontSize: 12,
          text: "(${reviewCount ?? "0"})",
          color: reviewColor ?? ColorConstant.instance.neutral5,
        ),
      ],
    );
  }
}
