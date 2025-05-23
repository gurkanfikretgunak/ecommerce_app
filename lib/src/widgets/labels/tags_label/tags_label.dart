import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class TagsLabel extends StatefulWidget {
  final String label;
  final Function(String)? onChanged;
  bool? isSelected;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double? fontSize;
  final Color? shadowColor;
  final double? spreadRadius;
  final double? blurRadius;
  final Offset? offset;

  TagsLabel({
    super.key,
    required this.label,
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.fontSize,
    this.shadowColor,
    this.spreadRadius,
    this.blurRadius,
    this.offset,
    this.onChanged,
    this.isSelected,
  });

  @override
  State<TagsLabel> createState() => _TagsLabelState();
}

class _TagsLabelState extends State<TagsLabel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 80,
        height: 45,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor ?? Colors.black.withOpacity(0.1),
              spreadRadius: widget.spreadRadius ?? 1,
              blurRadius: widget.blurRadius ?? 150,
              offset: widget.offset ?? const Offset(0, 1),
            ),
          ],
        ),
        child: ActionChip(
          label: ContentText(
            text: widget.label,
            color: widget.isSelected!
                ? widget.selectedTextColor ??
                    ColorConstant.instance.primary_main
                : widget.unselectedTextColor ?? ColorConstant.instance.neutral4,
            fontSize: widget.fontSize ?? 10,
          ),
          backgroundColor: widget.isSelected!
              ? widget.selectedColor ?? ColorConstant.instance.neutral9
              : widget.unselectedColor ?? ColorConstant.instance.neutral9,
          shape: StadiumBorder(
            side: BorderSide(
              color: widget.isSelected!
                  ? widget.selectedColor ?? ColorConstant.instance.primary_main
                  : widget.unselectedColor ?? ColorConstant.instance.neutral9,
            ),
          ),
          onPressed: () {
            setState(() {
              widget.onChanged!(widget.label);
            });
          },
        ),
      ),
    );
  }
}
