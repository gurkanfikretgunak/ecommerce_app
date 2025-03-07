import 'package:auto_route/auto_route.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/categorie_products/categorie_products_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> categoriesBannerItems = [
      CategorieBanner(
          onTap: () {
            AutoRouter.of(context).push(const CategorieProductsViewRoute());

            /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CategorieProductsView()));*/
          },
          imagePath: Assets.images.categoriebannerFirst.path,
          text: "MEN"),
      CategorieBanner(
          imagePath: Assets.images.categoriebannerSecond.path, text: "WOMEN"),
      CategorieBanner(
          imagePath: Assets.images.categoriebannerThird.path, text: "KIDS"),
      CategorieBanner(
          imagePath: Assets.images.categoriebannerFourth.path, text: "SHOES"),
      CategorieBanner(
          imagePath: Assets.images.categoriebannerFifth.path,
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
