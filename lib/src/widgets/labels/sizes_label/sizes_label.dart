import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/inputs/size_box_input/size_box_input.dart';

class SizesLabel extends StatelessWidget {
  final List<String>? sizes;
  final String? selectedSize;
  final Function(String)? onSizeSelected;

  const SizesLabel({
    super.key,
    this.sizes,
    this.selectedSize,
    this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> sizesList = sizes ?? ["XS", "S", "M", "L", "XL"];
    final String selected = selectedSize ?? "";

    return Row(
      children: sizesList.map((size) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizeBoxInput(
            text: size,
            isSelected: selected == size,
            inStock: true,
            onTap: () {
              if (onSizeSelected != null) {
                onSizeSelected!(size);
              }
            },
          ),
        );
      }).toList(),
    );
  }
}
