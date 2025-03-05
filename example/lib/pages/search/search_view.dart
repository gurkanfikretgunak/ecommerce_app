import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/filter/filter_view.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Widget> productCardItems = [
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
    ProductCardModal(
        imagePath: Assets.images.productcardimageSecond.path,
        productStock: "Sold(50 Product)",
        productName: "Printed Cotton Shirt",
        productPrice: "\$45.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageFourth.path,
        productStock: "Sold(50 Product)",
        productName: "Embroidered T-Shirt",
        productPrice: "\$39.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "Sold(50 Product)",
        productName: "Cotton T-shirt",
        productPrice: "\$49.00"),
  ];

  List<TagsLabel> tags = [
    const TagsLabel(label: "Shoes"),
    const TagsLabel(label: "Dresses"),
    const TagsLabel(label: "Shirts"),
    const TagsLabel(label: "Polos"),
    const TagsLabel(label: "Jeans"),
    const TagsLabel(label: "Blazers"),
    const TagsLabel(label: "Coats"),
    const TagsLabel(label: "Trousers"),
    const TagsLabel(label: "Skirts"),
    const TagsLabel(label: "Bags"),
    const TagsLabel(label: "Jacket"),
    const TagsLabel(label: "Top"),
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
          iconOnPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FilterView()));
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.emptySizedHeightBoxNormal,
              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: tags,
              ),
              context.emptySizedHeightBoxNormal,
              SectionLayout(
                  sectionText: "YOU ALSO VIEWED",
                  layout: ProductGridLayout(
                    productItems: productCardItems,
                    mainAxisSpacing: 17,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
