import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CouponcodeTextfieldInput extends StatefulWidget {
  const CouponcodeTextfieldInput({super.key});

  @override
  State<CouponcodeTextfieldInput> createState() =>
      _CouponcodeTextfieldInputState();
}

class _CouponcodeTextfieldInputState extends State<CouponcodeTextfieldInput> {
  final TextEditingController cuoponCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFieldInput(
            hintText: "Coupon Code",
            controller: cuoponCodeController,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: ContentText(
            fontSize: 12,
            color: ColorConstant.instance.neutral1,
            text: "Apply Coupon",
          ),
        ),
      ],
    );
  }
}
