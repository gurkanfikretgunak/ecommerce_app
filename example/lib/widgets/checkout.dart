import 'package:example/pages/addresses.dart';
import 'package:example/pages/paymentmethods.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Checkout extends StatefulWidget {
  final VoidCallback? buttonCallBack;
  const Checkout({super.key, this.buttonCallBack});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          AddressBoxModal(
              name: "Theresa Webb",
              address: "3517 W. Gray St. Utica, Pennsylvania 57867",
              email: "willie.jennings@example.com",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Addresses()));
              },
              phone: "(480) 555-0103"),
          SizedBox(
            height: 10,
          ),
          PaymentMethodBoxModal(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentMethods()));
              },
              text: "Master card Ending *****23"),
          SizedBox(
            height: 10,
          ),
          CheckoutListLayout(items: productBoxRowItems),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              onPressed: widget.buttonCallBack ?? () {},
              height: 50,
              text: "Order Now"),
        ],
      ),
    );
  }
}
