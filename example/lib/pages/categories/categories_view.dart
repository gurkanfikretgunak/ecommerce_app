import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/categories/categories_cubit.dart';
import 'package:example/cubits/categories/categories_state.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/categorie_products/categorie_products_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    List<CategorieBanner> categoriesBannerItems = [
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
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesError) {
          return const Center(child: Text(""));
        } else if (state is CategoriesLoaded) {
          final categoires = state.categories;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CategoriesBannerColumnLayout(
                items: categoires.map((category) {
              return CategorieBanner(
                  onTap: () {
                    AutoRouter.of(context)
                        .push(const CategorieProductsViewRoute());
                  },
                  imagePath: category.imagePath,
                  text: category.text);
            }).toList()),
          );
        } else {
          return const SizedBox();
          AutoRouter.of(context).push(MainpageViewRoute());
        }
      }),
    );
  }
}
