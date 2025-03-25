import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class QuantitySelectorInput extends StatefulWidget {
  final double? size;
  final Function(int)? onQuantityChanged;
  final int? count;

  const QuantitySelectorInput(
      {super.key, this.size, this.onQuantityChanged, this.count});

  @override
  State<QuantitySelectorInput> createState() => _QuantitySelectorInputState();
}

class _QuantitySelectorInputState extends State<QuantitySelectorInput> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.count ?? 2;
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (count > 0) {
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
