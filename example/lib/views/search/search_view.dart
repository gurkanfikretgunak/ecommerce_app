import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/cubits/search_cubit/search_cubit.dart';
import 'package:example/cubits/search_cubit/search_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SearchAppbar(
          textOnChanged: (text) {
            context.read<SearchCubit>().changeSearchText(text);
          },
          textEditingController: searchController,
          text: "Search Product ...",
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
              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: tags,
              ),
              context.emptySizedHeightBoxNormal,
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchApply) {
                    return Column(
                      children: [
                        SectionLayout(
                          sectionText: "Search Result",
                          layout: ProductGridLayout(
                              productItems: state.products
                                  .map((e) => ProductCardModal(
                                        imagePath: e.image,
                                        productStock: e.sold_count.toString(),
                                        productName: e.name,
                                        productPrice: e.price.toString(),
                                      ))
                                  .toList()),
                        ),
                      ],
                    );
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  } else if (state is SearchApply) {
                    return Center(child: Text("Lütfen filtre seçiniz"));
                  } else {
                    return const Center(child: CircularProgressIndicator());
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
