import 'package:example/pages/payment.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  PageController _pageController = PageController();

  void initState() {
    super.initState();
  }

  final List<String> imagePaths = [
    "assets/images/productheaderimage_first.png",
    "assets/images/productheaderimage_first.png",
    "assets/images/productheaderimage_first.png",
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

  final List<Widget> reviewItems = [
    ProductReviewModal(
        name: "Theresa Webb",
        rate: 5,
        date: "May1,2022",
        reviewText:
            "Cursus sit amet dictum sit amet justo donec enim. Commodo ullamcorper a lacus",
        imagePath: "assets/images/categorierow_first.png"),
    ProductReviewModal(
        name: "Theresa Webb",
        rate: 3,
        date: "May1,2022",
        reviewText:
            "Cursus sit amet dictum sit amet justo donec enim. Commodo ullamcorper a lacus",
        imagePath: "assets/images/categorierow_first.png"),
  ];

  void _shopPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopupSuccesLabel(
            title: "SUCCESS",
            buttonOnPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Payment()));
            },
            description:
                "Dolor magna eget est lorem ipsum dolor sit amet consectetur.",
            iconPath: "assets/icons/cart.svg",
            buttonText: "VIEW CART",
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductHeader(
              imagePaths: imagePaths,
              onPressed: () {
                Navigator.pop(context);
              },
              iconRow: Row(
                children: [
                  InkWell(
                    child: SvgPicture.asset("assets/icons/cart.svg"),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    child: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ProductInfoLabel(
                rating: "4,9",
                reviewCount: "12",
                soldCount: "50",
                productName: "Printed cotton shirt",
                description:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lectus urna duis convallis convallis tellus.",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ColorsLabel(),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SizesLabel(),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ProductDescriptionLabel(
                text:
                    "Purus in massa tempor nec feugiat. Congue nisi vitae suscipit tellus mauris a diam. Nam aliquam sem et tortor. Quis risus sed vulputate odio ut enim. Ultrices dui sapien eget mi proin sed libero enim sed. Quis viverra nibh cras pulvinar mattis nunc sed blandit libero. At volutpat diam ut venenatis tellus in",
                imagePath: "assets/images/productdescriptionimage.png",
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ProductReviewColumnLayout(
                items: reviewItems,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: ReviewFormLabel(),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SectionLayout(
                sectionText: "RELATED PRODUCT",
                layout: ProductRowLayout(items: productCardItems),
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      bottomSheet: ProductBottomSheetLabel(
        buttonOnPressed: _shopPopup,
        price: "45.00",
      ),
    );
  }
}
