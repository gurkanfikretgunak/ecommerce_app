import 'package:auto_route/auto_route.dart';
import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/cubits/search_cubit/search_cubit.dart';
import 'package:example/cubits/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  final TextEditingController categorieController = TextEditingController();

  final List<Color> colors = [
    Colors.brown,
    Colors.grey,
    Colors.blue,
    Colors.pinkAccent,
    Colors.green,
    Colors.yellow,
  ];

  final List<String> sizes = ["XS", "S", "M", "L", "XL"];

  final List<String> categories = [
    'men',
    'women',
    'kids',
    'bags',
    'shoes',
    'accessories',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    categorieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchState) {
            categorieController.text = state.filter.categorie ?? "";
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    FilterFormLabel(
                      filterText: L10n.of(context)!.filter,
                      categoryText: L10n.of(context)!.category,
                      colorText: L10n.of(context)!.color,
                      sizeText: L10n.of(context)!.size,
                      priceText: L10n.of(context)!.price,
                      categorieController: categorieController,
                      selectedColor: state.filter.color,
                      categories: categories,
                      colors: colors,
                      sizes: sizes,
                      selectedSize: state.filter.size,
                      onSizeSelected: (size) {
                        context.read<SearchCubit>().changeSize(size);
                      },
                      onColorSelected: (color) {
                        context.read<SearchCubit>().changeColor(color);
                      },
                      onPriceChanged: (price) {
                        context.read<SearchCubit>().changePrice(price);
                      },
                      iconCallBack: () {
                        context.read<SearchCubit>().clearFilters();
                      },
                      onCategorieChanged: (categorie) {
                        context.read<SearchCubit>().changeCategorie(categorie);
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      height: 50,
                      text: L10n.of(context)!.applyFilter,
                      onPressed: () {
                        context.read<SearchCubit>().applyFilters();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressAnimation());
          }
        },
      ),
    );
  }
}
