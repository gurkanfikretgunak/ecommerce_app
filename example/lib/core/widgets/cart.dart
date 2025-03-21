import 'package:example/core/gen/assets.gen.dart';
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
        imagePath: Assets.images.productboximage.path,
        name: "Basic T-shirt",
        price: 49.99),
    ProductBoxModal(
        imagePath: Assets.images.productboximage.path,
        name: "Basic T-shirt",
        price: 40.99),
    ProductBoxModal(
        imagePath: Assets.images.productboximage.path,
        name: "Basic T-shirt",
        price: 52.99),
  ];
  List<Widget> productCardItems = [
    ProductCardModal(
        imagePath: Assets.images.productcardimageFirst.path,
        productStock: "Sold(50 Product)",
        productName: "Long-sleeved T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageSecond.path,
        productStock: "Sold(50 Product)",
        productName: "Printed Cotton Shirt",
        productPrice: "\$45.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageFourth.path,
        productStock: "Sold(50 Product)",
        productName: "Embroidered T-Shirt",
        productPrice: "\$39.00"),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          context.emptySizedHeightBoxNormal,
          CartListLayout(items: productBoxRowItems),
          context.emptySizedHeightBoxNormal,
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
