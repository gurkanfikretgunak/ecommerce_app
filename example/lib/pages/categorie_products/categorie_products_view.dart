import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CategorieProductsView extends StatefulWidget {
  const CategorieProductsView({super.key});

  @override
  State<CategorieProductsView> createState() => _CategorieProductsViewState();
}

class _CategorieProductsViewState extends State<CategorieProductsView> {
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
        imagePath: Assets.images.productcardimageFirst.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00",
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProductView()));
        },
      ),
      ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00",
      ),
      ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00",
      ),
      ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00",
      ),
      ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00",
      ),
      ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00",
      ),
    ];

    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      body: Column(
        children: [
          CategoriesHeader(
            imagePath: Assets.images.categorieheaderFirst.path,
            onPressed: () {
              Navigator.pop(context);
            },
            text: "MEN",
          ),
          context.emptySizedHeightBoxNormal,
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
                ),
              ),
            ),
          ),
          context.emptySizedHeightBoxNormal,
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
