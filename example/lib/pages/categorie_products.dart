import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategorieProducts extends StatefulWidget {
  const CategorieProducts({super.key});

  @override
  State<CategorieProducts> createState() => _CategorieProductsState();
}

class _CategorieProductsState extends State<CategorieProducts> {
  List<Widget> productCardItems = [
    ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesHeader(
                imagePath: "assets/images/categorieheader_first.png",
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "MEN"),
            ProductGridLayout(
                crossAxisSpacing: 3,
                heigth: MediaQuery.sizeOf(context).height * 0.8,
                productItems: productCardItems)
          ],
        ),
      ),
    );
  }
}
