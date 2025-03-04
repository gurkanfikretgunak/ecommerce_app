import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/inputs/size_box_input/size_box_input.dart';

class SizesLabel extends StatefulWidget {
  final List<String>? sizes;

  const SizesLabel({
    super.key,
    this.sizes,
  });

  @override
  State<SizesLabel> createState() => _SizesLabelState();
}

class _SizesLabelState extends State<SizesLabel> {
  late String _selectedSize;
  late List<String> _sizes;

  @override
  void initState() {
    super.initState();
    _sizes = widget.sizes ?? ["S", "M", "L", "XL"];
    _selectedSize = _sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _sizes.map((size) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizeBoxInput(
            text: size,
            onTap: () {
              setState(() {
                _selectedSize = size;
              });
            },
            isSelected: _selectedSize == size,
            inStock: true,
          ),
        );
      }).toList(),
    );
  }
}
