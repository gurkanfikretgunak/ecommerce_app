import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/inputs/size_box_input/size_box_input.dart';

class SizesLabel extends StatefulWidget {
  const SizesLabel({super.key});

  @override
  State<SizesLabel> createState() => _SizesLabelState();
}

class _SizesLabelState extends State<SizesLabel> {
  String _selectedSize = "S";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductText(
          text: "Size:",
          fontSize: 12,
          textAlign: TextAlign.start,
          color: ColorConstant.instance.neutral1,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            SizeBoxInput(
                text: "S",
                onTap: () {
                  setState(() {
                    _selectedSize = "S";
                  });
                },
                isSelected: _selectedSize == "S",
                inStock: true),
            const SizedBox(
              width: 10,
            ),
            SizeBoxInput(
                text: "M",
                onTap: () {
                  setState(() {
                    _selectedSize = "M";
                  });
                },
                isSelected: _selectedSize == "M",
                inStock: true),
            const SizedBox(
              width: 10,
            ),
            SizeBoxInput(
                text: "L", onTap: () {}, isSelected: false, inStock: false),
            const SizedBox(
              width: 10,
            ),
            SizeBoxInput(
              text: "XL",
              onTap: () {
                setState(() {
                  _selectedSize = "XL";
                });
              },
              isSelected: _selectedSize == "XL",
              inStock: true,
            ),
          ],
        )
      ],
    );
  }
}
