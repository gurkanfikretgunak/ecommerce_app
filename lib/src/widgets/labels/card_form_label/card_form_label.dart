import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CardFormLabel extends StatefulWidget {
  const CardFormLabel({super.key});

  @override
  State<CardFormLabel> createState() => _CardFormLabelState();
}

class _CardFormLabelState extends State<CardFormLabel> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expMonthController = TextEditingController();
  final TextEditingController expDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    cardNumberController.dispose();
    expMonthController.dispose();
    expDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PaymentCardModal(
            name: nameController.text,
            cartNumber: cardNumberController.text,
            cvvNumber: cvvController.text,
            color: ColorConstant.instance.neutral4,
            expirationDate:
                "${expMonthController.text}/${expDateController.text}"),
        SizedBox(
          height: 30,
        ),
        TextFieldInput(
          hintText: "Name On Card",
          inputType: InputType.text,
          onChanged: (value) {
            setState(() {});
          },
          controller: nameController,
        ),
        SizedBox(height: 20),
        TextFieldInput(
          hintText: "Card Number",
          onChanged: (value) {
            setState(() {});
          },
          inputType: InputType.text,
          controller: cardNumberController,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextFieldInput(
                controller: expMonthController,
                onChanged: (value) {
                  setState(() {});
                },
                hintText: 'Exp Month',
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: TextFieldInput(
                controller: expDateController,
                onChanged: (value) {
                  setState(() {});
                },
                hintText: 'Exp Date',
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        TextFieldInput(
          hintText: "Cvv",
          onChanged: (value) {
            setState(() {});
          },
          inputType: InputType.text,
          controller: cvvController,
        ),
      ],
    );
  }
}
