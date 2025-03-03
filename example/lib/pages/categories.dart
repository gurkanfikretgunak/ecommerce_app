import 'package:example/pages/categorie_products.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> categoriesBannerItems = [
      CategorieBanner(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CategorieProducts()));
          },
          imagePath: "assets/images/categoriebanner_first.png",
          text: "MEN"),
      const CategorieBanner(
          imagePath: "assets/images/categoriebanner_second.png", text: "WOMEN"),
      const CategorieBanner(
          imagePath: "assets/images/categoriebanner_third.png", text: "KIDS"),
      const CategorieBanner(
          imagePath: "assets/images/categoriebanner_fourth.png", text: "SHOES"),
      const CategorieBanner(
          imagePath: "assets/images/categoriebanner_fifth.png",
          text: "ACCESSORIES"),
    ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            text: "Categories",
            onPressed: () {
              Navigator.pop(context);
            },
            iconColor: ColorConstant.instance.neutral1,
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CategoriesBannerColumnLayout(items: categoriesBannerItems),
      ),
    );
  }
}
