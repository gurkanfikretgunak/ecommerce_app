import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

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
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "Cart",
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CartListLayout(items: productBoxRowItems),
              SizedBox(
                height: 20,
              ),
              SectionLayout(
                  sectionText: "YOU ALSO VIEWED",
                  layout: ProductGridLayout(productItems: productCardItems)),
              CustomButton(
                onPressed: () {},
                height: 50,
                text: "Proceed to Checkout",
              )
            ],
          ),
        ),
      ),
    );
  }
}
