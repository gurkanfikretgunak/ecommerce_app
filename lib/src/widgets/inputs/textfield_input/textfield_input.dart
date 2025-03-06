import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  });

  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  bool isObscure = true;
  bool isValidEmail = false;
  String countryCode = '+1';

  @override
  void initState() {
    super.initState();
    isObscure = widget.inputType == InputType.password;
    widget.controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  void _validateInput() {
    final input = widget.controller.text;
    if (widget.inputType == InputType.email) {
      final emailRegex =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,}$');
      setState(() {
        isValidEmail = emailRegex.hasMatch(input);
      });
    }
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
      decoration: InputDecoration(
        label: ContentText(
          text: widget.hintText,
          fontSize: widget.hintFontSize ?? 15,
          color: widget.hintColor ?? ColorConstant.instance.neutral4,
        ),
        border: const UnderlineInputBorder(),
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
            : widget.inputType == InputType.email && isValidEmail
                ? Icon(Icons.check, color: ColorConstant.instance.primary_main)
                : widget.suffixIcon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.instance.neutral5),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstant.instance.neutral5),
        ),
      ),
    );
  }
}
