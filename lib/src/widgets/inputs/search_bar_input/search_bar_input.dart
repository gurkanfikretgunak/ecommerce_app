import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SearchBarInput extends StatefulWidget {
  final String hintText;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;

  final TextEditingController? textEditingController;
  final Function(String)? textOnChanged;

  final EdgeInsetsGeometry? contentPadding;

  const SearchBarInput({
    super.key,
    required this.hintText,
    this.borderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.contentPadding,
    this.textEditingController,
    this.textOnChanged,
  });

  @override
  State<SearchBarInput> createState() => _SearchBarInputState();
}

class _SearchBarInputState extends State<SearchBarInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.textEditingController,
        onChanged: widget.textOnChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
              color: widget.borderColor ?? ColorConstant.instance.neutral4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
              color: widget.focusedBorderColor ??
                  ColorConstant.instance.primary_main,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: widget.fillColor ?? ColorConstant.instance.neutral9,
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 25.0),
        ),
      ),
    );
  }
}
