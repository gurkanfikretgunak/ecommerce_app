import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CardFormLabel extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController cardNumberController;
  final TextEditingController expMonthController;
  final TextEditingController expDateController;
  final TextEditingController cvvController;

  final bool isNameValid;
  final bool isCardNumberValid;
  final bool isExpMonthValid;
  final bool isExpDateValid;
  final bool isCvvValid;

  final Function(String) onNameChanged;
  final Function(String) onCardNumberChanged;
  final Function(String) onExpMonthChanged;
  final Function(String) onExpDateChanged;
  final Function(String) onCvvChanged;

  // Eklenen özelleştirilebilir metin parametreleri
  final String nameOnCardHintText;
  final String cardNumberHintText;
  final String expMonthHintText;
  final String expDateHintText;
  final String cvvHintText;

  const CardFormLabel({
    super.key,
    required this.nameController,
    required this.cardNumberController,
    required this.expMonthController,
    required this.expDateController,
    required this.cvvController,
    required this.isNameValid,
    required this.isCardNumberValid,
    required this.isExpMonthValid,
    required this.isExpDateValid,
    required this.isCvvValid,
    required this.onNameChanged,
    required this.onCardNumberChanged,
    required this.onExpMonthChanged,
    required this.onExpDateChanged,
    required this.onCvvChanged,
    // Metin parametreleri için varsayılan değerler
    this.nameOnCardHintText = "Name On Card",
    this.cardNumberHintText = "Card Number",
    this.expMonthHintText = "Exp Month",
    this.expDateHintText = "Exp Date",
    this.cvvHintText = "Cvv",
  });

  @override
  State<CardFormLabel> createState() => _CardFormLabelState();
}

class _CardFormLabelState extends State<CardFormLabel> {
  String getFormattedExpDate() {
    final month = widget.expMonthController.text;
    final year = widget.expDateController.text;

    final formattedMonth = (month.length == 2) ? month : "XX";
    final formattedYear = (year.length == 4) ? year.substring(2) : "YY";

    return "$formattedMonth/$formattedYear";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaymentCardModal(
          name: widget.nameController.text,
          cartNumber: widget.cardNumberController.text,
          cvvNumber: widget.cvvController.text,
          color: ColorConstant.instance.neutral4,
          expirationDate: getFormattedExpDate(),
        ),
        context.emptySizedHeightBoxNormal,
        TextFieldInput(
          hintText: widget.nameOnCardHintText,
          controller: widget.nameController,
          isValid: widget.isNameValid,
          onChanged: widget.onNameChanged,
        ),
        context.emptySizedHeightBoxNormal,
        TextFieldInput(
          hintText: widget.cardNumberHintText,
          controller: widget.cardNumberController,
          isValid: widget.isCardNumberValid,
          onChanged: widget.onCardNumberChanged,
          inputFormatters: [
            LengthLimitingTextInputFormatter(16),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        context.emptySizedHeightBoxNormal,
        Row(
          children: [
            Expanded(
              child: TextFieldInput(
                controller: widget.expMonthController,
                hintText: widget.expMonthHintText,
                isValid: widget.isExpMonthValid,
                onChanged: widget.onExpMonthChanged,
              ),
            ),
            context.emptySizedWidthBoxNormal,
            Expanded(
              child: TextFieldInput(
                controller: widget.expDateController,
                hintText: widget.expDateHintText,
                isValid: widget.isExpDateValid,
                onChanged: widget.onExpDateChanged,
              ),
            ),
          ],
        ),
        context.emptySizedHeightBoxNormal,
        TextFieldInput(
          hintText: widget.cvvHintText,
          controller: widget.cvvController,
          isValid: widget.isCvvValid,
          onChanged: widget.onCvvChanged,
        ),
      ],
    );
  }
}
