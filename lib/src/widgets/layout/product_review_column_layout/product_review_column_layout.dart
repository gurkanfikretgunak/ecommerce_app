import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProductReviewColumnLayout extends StatelessWidget {
  final List<Widget> items;

  const ProductReviewColumnLayout({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadText(
          fontSize: 20,
          color: ColorConstant.instance.neutral1,
          text: "${items.length} REVIEWS FOR SLIT DENIM SKIRT",
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: items.length * 100,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: items[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
