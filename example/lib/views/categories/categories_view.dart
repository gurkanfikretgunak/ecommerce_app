import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/cubits/categories/categories_cubit.dart';
import 'package:example/cubits/categories/categories_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
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
                        .push(CategorieProductsViewRoute(categorie: category));
                  },
                  imagePath: category.bannerImage,
                  text: category.title);
            }).toList()),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
