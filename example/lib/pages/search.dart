import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Widget> productCardItems = [
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
    ProductCardModal(
        imagePath: "assets/images/productcardimage_second.png",
        productStock: "Sold(50 Product)",
        productName: "Printed Cotton Shirt",
        productPrice: "\$45.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_fourth.png",
        productStock: "Sold(50 Product)",
        productName: "Embroidered T-Shirt",
        productPrice: "\$39.00"),
    ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
  ];

  List<TagsLabel> tags = [
    TagsLabel(label: "Shoes"),
    TagsLabel(label: "Dresses"),
    TagsLabel(label: "Shirts"),
    TagsLabel(label: "Polos"),
    TagsLabel(label: "Jeans"),
    TagsLabel(label: "Blazers"),
    TagsLabel(label: "Coats"),
    TagsLabel(label: "Trousers"),
    TagsLabel(label: "Skirts"),
    TagsLabel(label: "Bags"),
    TagsLabel(label: "Jacket"),
    TagsLabel(label: "Top"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SearchAppbar(
          text: "Search Product ...",
          onPressed: () {
            Navigator.pop(context);
          },
          iconOnPressed: () {},
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: tags,
              ),
              SizedBox(height: 10),
              SectionLayout(
                  sectionText: "YOU ALSO VIEWED",
                  layout: ProductGridLayout(productItems: productCardItems))
            ],
          ),
        ),
      ),
    );
  }
}
