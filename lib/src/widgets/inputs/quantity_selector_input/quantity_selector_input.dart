import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class QuantitySelectorInput extends StatefulWidget {
  final double? size;
  final Function(int)? onQuantityChanged;

  const QuantitySelectorInput({super.key, this.size, this.onQuantityChanged});

  @override
  State<QuantitySelectorInput> createState() => _QuantitySelectorInputState();
}

class _QuantitySelectorInputState extends State<QuantitySelectorInput> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (count > 1) {
              setState(() {
                count--;
                widget.onQuantityChanged?.call(count);
              });
            }
          },
          iconSize: widget.size ?? 14,
          icon: const Icon(Icons.remove),
        ),
        ContentText(
            fontSize: widget.size ?? 14,
            color: ColorConstant.instance.neutral1,
            text: "$count"),
        IconButton(
          onPressed: () {
            setState(() {
              count++;
              widget.onQuantityChanged?.call(count);
            });
          },
          icon: const Icon(Icons.add),
          iconSize: widget.size ?? 14,
        ),
      ],
    );
  }
}
