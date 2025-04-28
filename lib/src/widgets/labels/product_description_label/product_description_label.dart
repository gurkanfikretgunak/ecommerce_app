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
        context.emptySizedHeightBoxLow,
        ProductDescriptionText(
          text: text,
        ),
        context.emptySizedHeightBoxLow,
        ProductDescriptionImage(
            width: MediaQuery.of(context).size.width * 0.9,
            imagePath: imagePath),
        context.emptySizedHeightBoxLow,
        /*Align(
          child: Column(
            children: [
              ContentText(
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
        )*/
      ],
    );
  }
}
