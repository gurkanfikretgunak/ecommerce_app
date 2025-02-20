import 'package:flutter/material.dart';

class CategoriesTextfieldInput extends StatefulWidget {
  final String? initialText;
  final IconData? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color? suffixIconColor;

  const CategoriesTextfieldInput({
    super.key,
    this.initialText,
    this.suffixIcon,
    this.contentPadding,
    this.controller,
    this.borderColor,
    this.suffixIconColor,
  });

  @override
  State<CategoriesTextfieldInput> createState() =>
      _CategoriesTextfieldInputState();
}

class _CategoriesTextfieldInputState extends State<CategoriesTextfieldInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        isDense: true,
        suffixIcon: Icon(
          widget.suffixIcon ?? Icons.arrow_drop_down,
          color: widget.suffixIconColor ?? Colors.black,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? Colors.grey),
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      controller: widget.controller ??
          TextEditingController(text: widget.initialText ?? "All Product"),
    );
  }
}
