import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductBoxModal extends StatefulWidget {
  final String imagePath;
  final String name;
  final double price;
  int quantity;
  final Color? textColor;
  final Color? priceColor;
  final double? imageWidth;
  final double? imageHeight;
  final double? spacing;
  final double? fontSize;
  final VoidCallback? onTap;

  ProductBoxModal({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    this.quantity = 0,
    this.textColor,
    this.priceColor,
    this.imageWidth,
    this.imageHeight,
    this.spacing,
    this.fontSize,
    this.onTap,
  });

  double get total => quantity * price;

  @override
  State<ProductBoxModal> createState() => _ProductBoxModalState();
}

class _ProductBoxModalState extends State<ProductBoxModal> {
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          SizedBox(
            width: widget.imageWidth ?? 60,
            height: widget.imageHeight ?? 80,
            child: _buildImage(widget.imagePath),
          ),
          SizedBox(width: widget.spacing ?? 10),
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentText(
                    textAlign: TextAlign.start,
                    softWrap: true,
                    text: widget.name,
                    fontSize: widget.fontSize ?? 15,
                    color: widget.textColor ?? ColorConstant.instance.neutral1,
                  ),
                  SizedBox(height: widget.spacing ?? 3),
                  ContentText(
                    textAlign: TextAlign.start,
                    text: "\$ ${widget.price}",
                    fontSize: widget.fontSize ?? 15,
                    color: widget.priceColor ??
                        ColorConstant.instance.primary_main,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
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
}
