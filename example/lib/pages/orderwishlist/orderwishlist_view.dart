import 'package:example/gen/assets.gen.dart';
import 'package:example/widgets/order.dart';
import 'package:example/widgets/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OrderwishlistView extends StatefulWidget {
  const OrderwishlistView({super.key});

  @override
  State<OrderwishlistView> createState() => _OrderwishlistViewState();
}

class _OrderwishlistViewState extends State<OrderwishlistView> {
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

  bool _showOrder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: _showOrder ? "MY ORDER" : "WISHLIST",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {
                      setState(() {
                        _showOrder = true;
                      });
                    },
                    text: "My Order",
                    width: context.width * 0.4,
                    color: _showOrder
                        ? ColorConstant.instance.primary_main
                        : ColorConstant.instance.neutral9,
                    textColor: _showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    icon: Icons.local_mall,
                    iconColor: _showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    height: 35,
                  ),
                  context.emptySizedWidthBoxNormal,
                  CustomButton(
                    onPressed: () {
                      setState(() {
                        _showOrder = false;
                      });
                    },
                    text: "Wishlist",
                    width: context.width * 0.4,
                    color: !_showOrder
                        ? ColorConstant.instance.primary_main
                        : ColorConstant.instance.neutral9,
                    textColor: !_showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    icon: Icons.favorite,
                    iconColor: !_showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    height: 35,
                  ),
                ],
              ),
              context.emptySizedHeightBoxNormal,
              _showOrder
                  ? Order(items: productBoxRowItems)
                  : Wishlist(items: productBoxRowItems),
              SectionLayout(
                sectionText: "YOU ALSO VIEWED",
                layout: ProductGridLayout(productItems: productCardItems),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
