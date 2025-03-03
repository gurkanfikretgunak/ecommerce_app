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

  ProductBoxModal({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.textColor,
    this.priceColor,
    this.imageWidth,
    this.imageHeight,
    this.spacing,
    this.fontSize,
  });

  double get total => quantity * price;

  @override
  State<ProductBoxModal> createState() => _ProductBoxModalState();
}

class _ProductBoxModalState extends State<ProductBoxModal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.imageWidth ?? 60,
          height: widget.imageHeight ?? 80,
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: widget.spacing ?? 10),
        Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductText(
                text: widget.name,
                fontSize: widget.fontSize ?? 15,
                color: widget.textColor ?? ColorConstant.instance.neutral1,
              ),
              SizedBox(height: widget.spacing ?? 3),
              ProductText(
                text: "\$ ${widget.price}",
                fontSize: widget.fontSize ?? 15,
                color: widget.priceColor ?? ColorConstant.instance.primary_main,
              ),
            ],
          ),
        )
      ],
    );
  }
}
