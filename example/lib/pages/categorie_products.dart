import 'package:example/pages/product.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategorieProducts extends StatefulWidget {
  const CategorieProducts({super.key});

  @override
  State<CategorieProducts> createState() => _CategorieProductsState();
}

class _CategorieProductsState extends State<CategorieProducts> {
  List<String> bottomDragItems = [
    "All Product",
    "Shirts",
    "Polos",
    "Jeans",
    "Trousers",
    "Jackets",
    "Shoes",
    "Accessories"
  ];

  String selectedItem = "All Product";
  bool bottomDragOpen = false;

  @override
  void initState() {
    super.initState();
    bottomDragOpen = false;
  }

  void showBottomSheet() {
    setState(() {
      bottomDragOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      builder: (context) {
        return BottomSheetLayout(
          items: bottomDragItems,
          selectedValue: selectedItem,
          onItemSelected: (value) {
            setState(() {
              bottomDragOpen = false;
              selectedItem = value;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> productCardItems = [
      ProductCardModal(
        imagePath: "assets/images/productcardimage_third.png",
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00",
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Product()));
        },
      ),
      const ProductCardModal(
          imagePath: "assets/images/productcardimage_third.png",
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00"),
      const ProductCardModal(
          imagePath: "assets/images/productcardimage_third.png",
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00"),
      const ProductCardModal(
          imagePath: "assets/images/productcardimage_third.png",
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00"),
      const ProductCardModal(
          imagePath: "assets/images/productcardimage_third.png",
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00"),
      const ProductCardModal(
          imagePath: "assets/images/productcardimage_third.png",
          productStock: "Sold(50 Product)",
          productName: "Cotton T-shirt",
          productPrice: "\$49.00"),
    ];

    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      body: Column(
        children: [
          CategoriesHeader(
            imagePath: "assets/images/categorieheader_first.png",
            onPressed: () {
              Navigator.pop(context);
            },
            text: "MEN",
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 350,
            height: 40,
            child: GestureDetector(
              onTap: showBottomSheet,
              child: AbsorbPointer(
                  child: CategoriesTextfieldInput(
                initialText: selectedItem,
                suffixIcon: bottomDragOpen
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
              )),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ProductGridLayout(
              crossAxisSpacing: 3,
              productItems: productCardItems,
            ),
          ),
        ],
      ),
    );
  }
}
