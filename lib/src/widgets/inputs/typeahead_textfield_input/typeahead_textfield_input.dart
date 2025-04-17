import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class TypeaheadTextfieldInput extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;
  final String? labelText;
  final Color? labelColor;
  final Color? activeColor;
  final Widget? suffixIcon;
  final InputBorder? border;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final Function(String)? onTextChanged;

  const TypeaheadTextfieldInput({
    super.key,
    required this.items,
    required this.controller,
    this.labelText,
    this.suffixIcon,
    this.border,
    this.labelStyle,
    this.textStyle,
    this.labelColor,
    this.activeColor,
    this.onTextChanged,
  });

  @override
  State<TypeaheadTextfieldInput> createState() =>
      _TypeaheadTextfieldInputState();
}

class _TypeaheadTextfieldInputState extends State<TypeaheadTextfieldInput> {
  late FocusNode _focusNode;
  late Color _labelColor;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _labelColor = widget.labelColor ?? ColorConstant.instance.neutral4;

    _focusNode.addListener(() {
      setState(() {
        _labelColor = _focusNode.hasFocus
            ? widget.activeColor ?? ColorConstant.instance.primary_main
            : widget.labelColor ?? ColorConstant.instance.neutral4;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: widget.controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          labelText: widget.labelText ?? 'Country / Region *',
          labelStyle: widget.labelStyle ??
              TextStyle(
                fontSize: 15,
                color: _labelColor,
              ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.activeColor ?? ColorConstant.instance.primary_main,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.activeColor ?? ColorConstant.instance.primary_main,
            ),
          ),
          border: widget.border ??
              UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstant.instance.neutral5,
                ),
              ),
          suffixIcon: widget.suffixIcon ?? const Icon(Icons.expand_more),
        ),
      ),
      suggestionsCallback: (pattern) {
        return widget.items.where(
            (country) => country.toLowerCase().contains(pattern.toLowerCase()));
      },
      itemBuilder: (context, String suggestion) {
        return ColoredBox(
          color: ColorConstant.instance.neutral9,
          child: ListTile(
            hoverColor: ColorConstant.instance.neutral9,
            title: Text(suggestion, style: widget.textStyle),
          ),
        );
      },
      onSuggestionSelected: (String text) {
        widget.controller.text = text;
        widget.onTextChanged!(text);
      },
    );
  }
}
