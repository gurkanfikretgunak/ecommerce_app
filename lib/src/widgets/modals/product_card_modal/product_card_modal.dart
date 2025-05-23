import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductCardModal extends StatelessWidget {
  final String imagePath;
  final String productStock;
  final String productName;
  final String productPrice;
  final VoidCallback? onTap;
  final double? imageHeight;
  final double? imageWidth;

  const ProductCardModal({
    super.key,
    required this.imagePath,
    required this.productStock,
    required this.productName,
    this.imageHeight,
    this.imageWidth,
    required this.productPrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = Uri.parse(imagePath).isAbsolute;

    double calculatedHeight;
    if (kIsWeb) {
      calculatedHeight = imageHeight ?? context.dynamicWidth(0.35);
    } else {
      calculatedHeight = imageHeight ?? context.dynamicWidth(0.45);
    }

    double calculatedWidth;
    if (kIsWeb) {
      final screenWidth = MediaQuery.of(context).size.width;
      if (screenWidth > 1200) {
        calculatedWidth = imageWidth ?? context.dynamicWidth(0.30);
      } else if (screenWidth > 800) {
        calculatedWidth = imageWidth ?? context.dynamicWidth(0.35);
      } else {
        calculatedWidth = imageWidth ?? context.dynamicWidth(0.40);
      }
    } else {
      calculatedWidth = imageWidth ?? context.dynamicWidth(0.40);
    }

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: calculatedWidth,
              height: calculatedHeight,
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                child: isNetworkImage
                    ? Image.network(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      )
                    : Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            context.emptySizedHeightBoxLow,
            ContentText(
              text: 'Sold($productStock Products)',
              fontSize: 8,
              color: ColorConstant.instance.neutral4,
            ),
            context.emptySizedHeightBoxLow,
            SizedBox(
              child: ContentText(
                textAlign: TextAlign.left,
                text: productName,
                fontSize: 12,
                softWrap: true,
                color: ColorConstant.instance.neutral1,
              ),
            ),
            context.emptySizedHeightBoxLow,
            ContentText(
                text: "\$$productPrice",
                fontSize: 16,
                color: ColorConstant.instance.primary_main)
          ],
        ),
      ),
    );
  }
}
