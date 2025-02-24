import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductBoxModal extends StatefulWidget {
  final String imagePath;
  final String name;
  final double price;
  int quantity = 1;

  ProductBoxModal({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
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
        Container(
          width: 60,
          height: 80,
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductText(
                text: widget.name,
                fontSize: 15,
                color: ColorConstant.instance.neutral1,
              ),
              SizedBox(height: 3),
              ProductText(
                text: "\$ ${widget.price}",
                fontSize: 15,
                color: ColorConstant.instance.primary_main,
              ),
            ],
          ),
        )
      ],
    );
  }
}
