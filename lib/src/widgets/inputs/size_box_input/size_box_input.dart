import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SizeBoxInput extends StatefulWidget {
  final double? width;
  final double? height;
  final bool inStock;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeBoxInput({
    super.key,
    required this.isSelected,
    required this.inStock,
    this.width,
    this.height,
    required this.text,
    required this.onTap,
  });

  @override
  State<SizeBoxInput> createState() => _SizeBoxInputState();
}

class _SizeBoxInputState extends State<SizeBoxInput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? 42,
        height: widget.height ?? 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: widget.isSelected
              ? ColorConstant.instance.neutral1
              : ColorConstant.instance.neutral9,
          border: widget.isSelected
              ? null
              : Border.all(color: ColorConstant.instance.neutral5),
        ),
        child: Center(
          child: ContentText(
            text: widget.text,
            fontSize: 12,
            color: widget.isSelected
                ? ColorConstant.instance.neutral9
                : (widget.inStock
                    ? ColorConstant.instance.neutral1
                    : ColorConstant.instance.neutral5),
          ),
        ),
      ),
    );
  }
}
