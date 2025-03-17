import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

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
  String countryCode = '+1';

  @override
  void initState() {
    super.initState();
    isObscure = widget.inputType == InputType.password;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.inputType == InputType.password ? isObscure : false,
      keyboardType: widget.inputType == InputType.email
          ? TextInputType.emailAddress
          : widget.inputType == InputType.phone
              ? TextInputType.phone
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
            color: widget.isValid
                ? ColorConstant.instance.neutral5
                : Colors.red, // Eğer geçersizse kırmızı
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: widget.isValid
                  ? ColorConstant.instance.neutral5
                  : Colors.red),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: widget.isValid
                  ? ColorConstant.instance.neutral5
                  : Colors.red),
        ),
        prefixIcon: widget.inputType == InputType.phone
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  countryCode,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : widget.prefixIcon,
        suffixIcon: widget.inputType == InputType.password
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
        /*: widget.inputType == InputType.email && widget.isValid
                ? Icon(Icons.check, color: ColorConstant.instance.primary_main)
                : widget.suffixIcon,*/
      ),
    );
  }
}
