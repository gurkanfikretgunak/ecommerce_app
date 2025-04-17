import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductBottomSheetLabel extends StatefulWidget {
  final String price;
  final VoidCallback? buttonOnPressed;
  final VoidCallback? favoriteOnPressed;
  final bool isFavorite;
  const ProductBottomSheetLabel(
      {super.key,
      required this.price,
      this.buttonOnPressed,
      this.favoriteOnPressed,
      required this.isFavorite});

  @override
  State<ProductBottomSheetLabel> createState() =>
      _ProductBottomSheetLabelState();
}

class _ProductBottomSheetLabelState extends State<ProductBottomSheetLabel> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorConstant.instance.neutral9,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            ContentText(
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
              onTap: widget.favoriteOnPressed,
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
