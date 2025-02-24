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
  int currentStep = 1;

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

  final List<ProductBoxModal> productBoxRowItems = [
    ProductBoxModal(
        imagePath: "assets/images/productboximage.png",
        name: "Basic T-shirt",
        price: 49.99),
    ProductBoxModal(
        imagePath: "assets/images/productboximage.png",
        name: "Basic T-shirt",
        price: 40.99),
    ProductBoxModal(
        imagePath: "assets/images/productboximage.png",
        name: "Basic T-shirt",
        price: 52.99),
  ];

  List<Widget> productCardItems = [
    ProductCardModal(
        imagePath: "assets/images/productcardimage_first.png",
        productStock: "Sold(50 Product)",
        productName: "Long-sleeved T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_second.png",
        productStock: "Sold(50 Product)",
        productName: "Printed Cotton Shirt",
        productPrice: "\$45.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_fourth.png",
        productStock: "Sold(50 Product)",
        productName: "Embroidered T-Shirt",
        productPrice: "\$39.00"),
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
