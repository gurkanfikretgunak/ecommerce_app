import 'package:example/widgets/cart.dart';
import 'package:example/widgets/checkout.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int currentStep = 0;

  List<Widget> get stepContents {
    return [
      Cart(
        buttonCallBack: () {
          setState(() {
            currentStep++;
          });
        },
      ),
      Checkout(),
      Placeholder(),
    ];
  }

  final List<String> stepTitles = [
    "Cart",
    "Checkout",
    "Payment",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: stepTitles[currentStep],
          onPressed: () {
            if (currentStep == 0) {
              Navigator.pop(context);
            }
            setState(() {
              currentStep--;
            });
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              StepperLabel(currentStep: currentStep),
              stepContents[currentStep],
            ],
          ),
        ),
      ),
    );
  }
}
