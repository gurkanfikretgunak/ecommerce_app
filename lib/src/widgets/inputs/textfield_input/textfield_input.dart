import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

enum InputType {
  text,
  password,
  email,
  phone,
}

class TextFieldInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final InputType inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? hintColor;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final Function(String)? onChanged;
  final bool isValid;

  const TextFieldInput({
    super.key,
    required this.controller,
    this.hintText = "Enter text",
    this.inputType = InputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.hintColor,
    this.hintFontSize,
    this.hintFontWeight,
    this.onChanged,
    this.isValid = false,
  });

  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    isObscure = widget.inputType == InputType.password;
  }

  Widget _buildPhoneNumberInput() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {},
      selectorConfig: const SelectorConfig(
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 0,
        trailingSpace: false,
      ),
      countries: const ['US', 'CA', 'GB', 'DE', 'FR', 'TR'],
      initialValue: PhoneNumber(isoCode: 'TR'),
      selectorTextStyle: const TextStyle(color: Colors.black),
      textFieldController: widget.controller,
      inputDecoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: TextStyle(
          color: widget.isValid ? ColorConstant.instance.neutral4 : Colors.red,
          fontSize: widget.hintFontSize ?? 15,
          fontWeight: widget.hintFontWeight ?? FontWeight.normal,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.isValid ? ColorConstant.instance.neutral5 : Colors.red,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.isValid ? ColorConstant.instance.neutral5 : Colors.red,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.isValid ? ColorConstant.instance.neutral5 : Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput() {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.inputType == InputType.password ? isObscure : false,
      keyboardType: widget.inputType == InputType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      style: TextStyle(
        color: widget.isValid ? Colors.black : Colors.red,
      ),
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: TextStyle(
          color: widget.isValid ? ColorConstant.instance.neutral4 : Colors.red,
          fontSize: widget.hintFontSize ?? 15,
          fontWeight: widget.hintFontWeight ?? FontWeight.normal,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.isValid ? ColorConstant.instance.neutral5 : Colors.red,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.isValid ? ColorConstant.instance.neutral5 : Colors.red,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.isValid ? ColorConstant.instance.neutral5 : Colors.red,
          ),
        ),
        suffixIcon: widget.inputType == InputType.password
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : widget.suffixIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.inputType == InputType.phone) {
      return _buildPhoneNumberInput();
    } else {
      return _buildTextInput();
    }
  }
}
