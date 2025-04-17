import 'package:auto_route/auto_route.dart';
import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/cubits/search_cubit/search_cubit.dart';
import 'package:example/cubits/search_cubit/search_state.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchApply) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    FilterFormLabel(
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
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      height: 50,
                      text: "Apply Filter",
                      onPressed: () {
                        context.read<BottomNavigationCubit>().setPage(3);
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
