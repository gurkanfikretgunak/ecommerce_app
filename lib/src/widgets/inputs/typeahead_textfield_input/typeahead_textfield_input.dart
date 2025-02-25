import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class TypeaheadTextfieldInput extends StatefulWidget {
  final List<String> items;
  final TextEditingController controller;
  final String? labelText;
  final Widget? suffixIcon;
  final InputBorder? border;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  const TypeaheadTextfieldInput({
    super.key,
    required this.items,
    required this.controller,
    this.labelText,
    this.suffixIcon,
    this.border,
    this.labelStyle,
    this.textStyle,
  });

  @override
  State<TypeaheadTextfieldInput> createState() =>
      _TypeaheadTextfieldInputState();
}

class _TypeaheadTextfieldInputState extends State<TypeaheadTextfieldInput> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText ?? 'Country / Region *',
          labelStyle: widget.labelStyle ??
              TextStyle(
                fontSize: 15,
                color: ColorConstant.instance.neutral4,
              ),
          border: widget.border ??
              UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstant.instance.neutral5,
                ),
              ),
          suffixIcon: widget.suffixIcon ?? Icon(Icons.expand_more),
        ),
      ),
      suggestionsCallback: (pattern) {
        return widget.items.where(
            (country) => country.toLowerCase().contains(pattern.toLowerCase()));
      },
      itemBuilder: (context, String suggestion) {
        return Container(
          color: ColorConstant.instance.neutral9,
          child: ListTile(
            hoverColor: ColorConstant.instance.neutral9,
            title: Text(suggestion, style: widget.textStyle),
          ),
        );
      },
      onSuggestionSelected: (String selectedCountry) {
        widget.controller.text = selectedCountry;
      },
    );
  }
}
