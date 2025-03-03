import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductDescriptionLabel extends StatelessWidget {
  final String text;
  final String imagePath;

  const ProductDescriptionLabel(
      {super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadText(
          color: ColorConstant.instance.neutral1,
          text: "DESCRIPTION",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        ProductDescriptionText(
          text: text,
        ),
        const SizedBox(
          height: 20,
        ),
        ProductDescriptionImage(
            width: MediaQuery.of(context).size.width * 0.9,
            imagePath: imagePath),
        const SizedBox(
          height: 10,
        ),
        Align(
          child: Column(
            children: [
              ProductText(
                text: "Show More",
                fontSize: 10,
                color: ColorConstant.instance.neutral4,
              ),
              Icon(
                Icons.expand_more,
                color: ColorConstant.instance.neutral4,
              )
            ],
          ),
        )
      ],
    );
  }
}
