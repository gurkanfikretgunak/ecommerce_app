import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/cubits/search_cubit/search_cubit.dart';
import 'package:example/cubits/search_cubit/search_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  void addTags(String tag) {
    context.read<SearchCubit>().changeTag(tag);
  }

  bool isAdded(String tag) {
    return context.read<SearchCubit>().isAdded(tag);
  }

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allTags = [
      "shoes",
      "dresses",
      "shirts",
      "polos",
      "jeans",
      "blazers",
      "coats",
      "trousers",
      "skirts",
      "bags",
      "jacket",
      "top"
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SearchAppbar(
          textOnChanged: (text) {
            context.read<SearchCubit>().changeSearchText(text);
          },
          textEditingController: searchController,
          text: L10n.of(context)!.searchProduct,
          onPressed: () {
            context.read<BottomNavigationCubit>().setPage(0);
          },
          iconOnPressed: () {
            AutoRouter.of(context).push(const FilterViewRoute());
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
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: allTags
                        .map((tagName) => TagsLabel(
                              label: tagName,
                              onChanged: addTags,
                              isSelected:
                                  state.filter.tags?.contains(tagName) ?? false,
                            ))
                        .toList(),
                  );
                },
              ),
              context.emptySizedHeightBoxNormal,
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.errorMessage != null) {
                    return Center(
                      child: HeadText(
                        text: state.errorMessage!,
                        color: ColorConstant.instance.neutral1,
                      ),
                    );
                  } else if (state.products.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 48,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          HeadText(
                            text: L10n.of(context)!.noProductsFound,
                            color: ColorConstant.instance.neutral1,
                          ),
                          const SizedBox(height: 8),
                          ContentText(
                            text: L10n.of(context)!.changeSearchTerm,
                            textAlign: TextAlign.center,
                            color: ColorConstant.instance.neutral4,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        SectionLayout(
                          sectionText: L10n.of(context)!.searchResult,
                          layout: ProductGridLayout(
                              productItems: state.products
                                  .map((e) => ProductCardModal(
                                        imagePath: e.image,
                                        productStock: e.sold_count.toString(),
                                        productName: e.name,
                                        productPrice: e.price.toString(),
                                        onTap: () {
                                          context
                                              .read<ProductCubit>()
                                              .changeProduct(e);
                                          AutoRouter.of(context)
                                              .push(ProductViewRoute());
                                        },
                                      ))
                                  .toList()),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
