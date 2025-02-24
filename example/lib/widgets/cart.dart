import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Cart extends StatefulWidget {
  final VoidCallback? buttonCallBack;
  const Cart({super.key, this.buttonCallBack});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CartListLayout(items: productBoxRowItems),
          SizedBox(
            height: 20,
          ),
          SectionLayout(
              sectionText: "YOU ALSO VIEWED",
              layout: ProductGridLayout(productItems: productCardItems)),
          CustomButton(
              onPressed: widget.buttonCallBack ?? () {},
              height: 50,
              text: "Proceed To Checkout")
        ],
      ),
    );
  }
}
