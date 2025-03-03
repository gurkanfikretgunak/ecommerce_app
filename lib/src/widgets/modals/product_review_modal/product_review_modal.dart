import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductReviewModal extends StatelessWidget {
  final String imagePath;
  final int rate;
  final String name;
  final String date;
  final String reviewText;
  final double? imageWidth;
  final double? imageHeight;
  final double? spacing;
  final double? reviewTextWidth;

  const ProductReviewModal({
    super.key,
    required this.imagePath,
    required this.rate,
    required this.name,
    this.date = "Unknown Date",
    this.reviewText = "No review provided.",
    this.imageWidth,
    this.imageHeight,
    this.spacing,
    this.reviewTextWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageRadiusModal(
          width: imageWidth ?? 54,
          height: imageHeight ?? 54,
          text: "",
          imagePath: imagePath,
        ),
        SizedBox(width: spacing ?? 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RateRowLayout(rate: rate),
            SizedBox(height: spacing ?? 5),
            Row(
              children: [
                ProductText(
                  color: ColorConstant.instance.neutral1,
                  text: name,
                ),
                ProductText(
                  color: ColorConstant.instance.neutral4,
                  text: " - ",
                ),
                SizedBox(width: spacing ?? 5),
                ProductText(
                  color: ColorConstant.instance.neutral4,
                  text: date,
                ),
              ],
            ),
            SizedBox(height: spacing ?? 5),
            ProductDescriptionText(
              softWrap: true,
              width: reviewTextWidth ?? MediaQuery.of(context).size.width * 0.7,
              text: reviewText,
            ),
          ],
        )
      ],
    );
  }
}
