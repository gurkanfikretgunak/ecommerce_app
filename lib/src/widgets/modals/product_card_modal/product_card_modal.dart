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
    bool isNetworkImage = Uri.parse(imagePath).isAbsolute;

    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.dynamicWidth(.40),
              height: imageHeight ?? context.dynamicWidth(.45),
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
