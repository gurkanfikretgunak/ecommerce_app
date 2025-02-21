import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductReviewModal extends StatelessWidget {
  final String imagePath;
  final int rate;
  final String name;
  final String date;
  final String reviewText;

  const ProductReviewModal({
    super.key,
    required this.imagePath,
    required this.rate,
    required this.name,
    this.date = "Unknown Date", // Varsayılan değer
    this.reviewText = "No review provided.", // Varsayılan değer
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageRadiusModal(
          width: 54,
          height: 54,
          text: "",
          imagePath: imagePath,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RateRowLayout(rate: rate),
            SizedBox(height: 5),
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
                const SizedBox(width: 5),
                ProductText(
                  color: ColorConstant.instance.neutral4,
                  text: date,
                ),
              ],
            ),
            SizedBox(height: 5),
            ProductDescriptionText(
              softWrap: true,
              width: MediaQuery.of(context).size.width * 0.7,
              text: reviewText,
            ),
          ],
        )
      ],
    );
  }
}
