import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/categorie_products/categorie_products_cubit.dart';
import 'package:example/cubits/categorie_products/categorie_products_state.dart';
import 'package:example/core/network/models/categorie_model/categorie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class CategorieProductsView extends StatefulWidget {
  final Categorie categorie;
  const CategorieProductsView({super.key, required this.categorie});

  @override
  State<CategorieProductsView> createState() => _CategorieProductsViewState();
}

class _CategorieProductsViewState extends State<CategorieProductsView> {
  String selectedItem = "all product";
  bool bottomDragOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<CategorieProductsCubit>().loadCategorieData(
        id: widget.categorie.id.toString(), tag: selectedItem);
  }

  List<String> bottomDragItems = [
    "all product",
    "shirts",
    "polos",
    "jeans",
    "trousers",
    "jackets",
    "shoes",
    "accessories"
  ];

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
              context.read<CategorieProductsCubit>().loadCategorieData(
                  id: widget.categorie.id.toString(), tag: selectedItem);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CategoriesHeader(
            imagePath: widget.categorie.bannerImage,
            onPressed: () {
              Navigator.pop(context);
            },
            text: widget.categorie.title,
          ),
          context.emptySizedHeightBoxNormal,
          SizedBox(
            width: 350,
            height: 40,
            child: GestureDetector(
              onTap: () => showBottomSheet(bottomDragItems),
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
            child: BlocBuilder<CategorieProductsCubit, CategorieProductsState>(
              builder: (context, state) {
                if (state is CategorieProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CategorieProductsLoaded) {
                  return ProductGridLayout(
                    crossAxisSpacing: 3,
                    productItems: state.products.map((product) {
                      return ProductCardModal(
                        imagePath: product.image,
                        productStock: product.sold_count.toString(),
                        productName: product.name,
                        productPrice: product.price.toString(),
                        onTap: () {},
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(child: Text("Error loading data"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
