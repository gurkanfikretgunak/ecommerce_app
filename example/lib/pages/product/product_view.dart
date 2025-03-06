import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/mainpage/mainpage_view.dart';
import 'package:example/pages/payment/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  void initState() {
    super.initState();
  }

  final List<String> imagePaths = [
    Assets.images.productheaderimageFirst.path,
    Assets.images.productheaderimageFirst.path,
    Assets.images.productheaderimageFirst.path,
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

  final List<Widget> reviewItems = [
    const ProductReviewModal(
        name: "Theresa Webb",
        rate: 5,
        date: "May1,2022",
        reviewText:
            "Cursus sit amet dictum sit amet justo donec enim. Commodo ullamcorper a lacus",
        imagePath: "assets/images/categorierow_first.png"),
    const ProductReviewModal(
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
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainpageView(
                            pageNo: 2,
                          )));
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
              action: [
                InkWell(
                  child: SvgPicture.asset("assets/icons/cart.svg"),
                ),
                context.emptySizedWidthBoxNormal,
                InkWell(
                  child: SvgPicture.asset("assets/icons/search.svg"),
                ),
              ],
            ),
            const Padding(
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
            const Padding(
              padding: EdgeInsets.all(15),
              child:
                  ProductSectionLabel(title: "Color:", element: ColorsLabel()),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: ProductSectionLabel(title: "Size:", element: SizesLabel()),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: ProductDescriptionLabel(
                text:
                    "Purus in massa tempor nec feugiat. Congue nisi vitae suscipit tellus mauris a diam. Nam aliquam sem et tortor. Quis risus sed vulputate odio ut enim. Ultrices dui sapien eget mi proin sed libero enim sed. Quis viverra nibh cras pulvinar mattis nunc sed blandit libero. At volutpat diam ut venenatis tellus in",
                imagePath: "assets/images/productdescriptionimage.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ProductReviewColumnLayout(
                items: reviewItems,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: ReviewFormLabel(),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SectionLayout(
                sectionText: "RELATED PRODUCT",
                layout: ProductRowLayout(items: productCardItems),
              ),
            ),
            context.emptySizedHeightBoxHigh,
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
