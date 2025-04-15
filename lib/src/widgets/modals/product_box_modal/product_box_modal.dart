import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/inputs/size_box_input/size_box_input.dart';

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
  final Color? color;
  final String? size;
  final List<String>? sizeList;

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
    this.color,
    this.size,
    this.sizeList,
  });

  double get total => quantity * price;

  @override
  State<ProductBoxModal> createState() => _ProductBoxModalState();
}

class _ProductBoxModalState extends State<ProductBoxModal> {
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = widget.sizeList != null ? widget.sizeList![0] : "S";
  }

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
                  Row(
                    children: [
                      ContentText(
                        textAlign: TextAlign.start,
                        text: "\$ ${widget.price}",
                        fontSize: widget.fontSize ?? 15,
                        color: widget.priceColor ??
                            ColorConstant.instance.primary_main,
                      ),
                      SizedBox(width: widget.spacing ?? 5),
                      if (widget.size != null)
                        SizeBoxInput(
                            height: 25,
                            width: 35,
                            isSelected: false,
                            inStock: true,
                            text: widget.size!,
                            onTap: () {}),
                      if (widget.sizeList != null)
                        DropDownMenuInput(
                          items: widget.sizeList!,
                          selected: selectedSize,
                          onSelected: (String value) {
                            setState(() {
                              selectedSize = value;
                            });
                          },
                        ),
                    ],
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
