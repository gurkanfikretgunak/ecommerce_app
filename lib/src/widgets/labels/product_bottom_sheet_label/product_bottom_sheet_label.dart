import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductBottomSheetLabel extends StatefulWidget {
  final String price;
  final VoidCallback? buttonOnPressed;
  const ProductBottomSheetLabel(
      {super.key, required this.price, this.buttonOnPressed});

  @override
  State<ProductBottomSheetLabel> createState() =>
      _ProductBottomSheetLabelState();
}

class _ProductBottomSheetLabelState extends State<ProductBottomSheetLabel> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorConstant.instance.neutral9,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            ProductText(
              fontSize: 20,
              color: ColorConstant.instance.neutral1,
              text: "\$ ${widget.price}",
            ),
            SizedBox(width: screenWidth * 0.05),
            Container(
              width: 2,
              height: 30,
              color: ColorConstant.instance.neutral5,
            ),
            SizedBox(width: screenWidth * 0.05),
            InkWell(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                size: 24,
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: ColorConstant.instance.secondary2,
              ),
            ),
            SizedBox(width: screenWidth * 0.05),
            CustomButton(
              onPressed: widget.buttonOnPressed,
              width: 160,
              height: 40,
              borderColor: ColorConstant.instance.neutral9,
              text: "Add to Cart",
            ),
          ],
        ),
      ),
    );
  }
}
