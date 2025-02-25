import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "PAYMENT METHOD",
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            PaymentCartColumnLayout(),
          ],
        ),
      ),
    );
  }
}
