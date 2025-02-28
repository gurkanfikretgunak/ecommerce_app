import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RateInput extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final double? size;
  const RateInput(
      {super.key, required this.isSelected, required this.onTap, this.size});

  @override
  State<RateInput> createState() => _RateInputState();
}

class _RateInputState extends State<RateInput> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Icon(
        size: widget.size ?? 15,
        Icons.star,
        color: widget.isSelected
            ? ColorConstant.instance.yellow1
            : ColorConstant.instance.neutral5,
      ),
    );
  }
}
