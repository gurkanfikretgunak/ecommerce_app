import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductOrderBoxModal extends StatelessWidget {
  final List<String> imagePath;
  final double price;
  final int? quantity;
  final Color? priceColor;
  final double? fontSize;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback? onTap;

  const ProductOrderBoxModal(
      {super.key,
      required this.imagePath,
      required this.price,
      this.priceColor,
      this.onTap,
      this.fontSize,
      this.quantity,
      this.imageWidth,
      this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ContentText(
        textAlign: TextAlign.start,
        text: "\$ ${price}",
        fontSize: fontSize ?? 15,
        color: priceColor ?? ColorConstant.instance.primary_main,
      ),
      ContentText(
        textAlign: TextAlign.start,
        text: "${quantity} Product",
        fontSize: fontSize ?? 15,
        color: priceColor ?? ColorConstant.instance.neutral4,
      ),
      Row(
        children: [
          ...imagePath.map((item) => SizedBox(
                width: imageWidth ?? 40,
                height: imageHeight ?? 40,
                child: _buildImage(item),
              )),
        ],
      )
    ]);
  }
}

Widget _buildImage(String path) {
  if (path.startsWith('http://') || path.startsWith('https://')) {
    return Image.network(
      path,
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
