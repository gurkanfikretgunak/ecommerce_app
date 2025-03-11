import 'package:auto_route/auto_route.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/product/product_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/cubits/categorie_products/categorie_products_cubit.dart';
import 'package:example/cubits/categorie_products/categorie_products_state.dart';

@RoutePage()
class CategorieProductsView extends StatefulWidget {
  const CategorieProductsView({super.key});

  @override
  State<CategorieProductsView> createState() => _CategorieProductsViewState();
}

class _CategorieProductsViewState extends State<CategorieProductsView> {
  String selectedItem = "All Product";
  bool bottomDragOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<CategorieProductsCubit>().loadCategorieData();
  }

  void showBottomSheet(List<String> bottomDragItems) {
    setState(() {
      bottomDragOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      builder: (context) {
        return BottomSheetLayout(
          items: bottomDragItems,
          selectedValue: selectedItem,
          onItemSelected: (value) {
            setState(() {
              bottomDragOpen = false;
              selectedItem = value;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorieProductsCubit, CategorieProductsState>(
      builder: (context, state) {
        if (state is CategorieProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategorieProductsLoaded) {
          return Scaffold(
            body: Column(
              children: [
                CategoriesHeader(
                  imagePath: state.categoriesHeader.imagePath,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: state.categoriesHeader.text,
                ),
                context.emptySizedHeightBoxNormal,
                SizedBox(
                  width: 350,
                  height: 40,
                  child: GestureDetector(
                    onTap: () => showBottomSheet(state.bottomDragItems),
                    child: AbsorbPointer(
                      child: CategoriesTextfieldInput(
                        initialText: selectedItem,
                        suffixIcon: bottomDragOpen
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxNormal,
                Expanded(
                  child: ProductGridLayout(
                    crossAxisSpacing: 3,
                    productItems: state.products.map((product) {
                      return ProductCardModal(
                        imagePath: product.imagePath,
                        productStock: product.productStock,
                        productName: product.productName,
                        productPrice: product.productPrice,
                        onTap: () {
                          AutoRouter.of(context).push(const ProductViewRoute());
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text("Error loading data"));
        }
      },
    );
  }
}
