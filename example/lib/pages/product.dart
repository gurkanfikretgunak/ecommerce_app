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

  final List<String> imagePaths = [
    "assets/images/productheaderimage_first.png",
    "assets/images/productheaderimage_first.png",
    "assets/images/productheaderimage_first.png",
  ];

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
          ],
        ),
      ),
    );
  }
}
