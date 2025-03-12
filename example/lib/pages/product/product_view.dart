import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProductData();
  }

  void _shopPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopupSuccesLabel(
            title: "SUCCESS",
            buttonOnPressed: () {
              AutoRouter.of(context).push(MainpageViewRoute(pageNo: 2));
            },
            description:
                "Dolor magna eget est lorem ipsum dolor sit amet consectetur.",
            iconPath: "assets/icons/cart.svg",
            buttonText: "VIEW CART",
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            debugPrint("selectedColor${state.selectedColor}");
            return SingleChildScrollView(
              child: Column(
                children: [
                  ProductHeader(
                    imagePaths: state.imagePaths,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    action: [
                      InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(const PaymentViewRoute());
                        },
                        child: SvgPicture.asset("assets/icons/cart.svg"),
                      ),
                      context.emptySizedWidthBoxNormal,
                      InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(const SearchViewRoute());
                        },
                        child: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ProductInfoLabel(
                      rating: state.rating,
                      reviewCount: state.reviewCount,
                      soldCount: state.soldCount,
                      productName: state.productName,
                      description: state.description,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ProductSectionLabel(
                        title: "Color:",
                        element: ColorsLabel(
                          colors: state
                              .colors, // Renkleri buraya prop olarak geçiyoruz
                          selectedColor: state
                              .selectedColor, // Seçilen rengi buraya prop olarak geçiyoruz
                          onColorSelected: (color) {
                            context
                                .read<ProductCubit>()
                                .changeSelectedColor(color);
                          },
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ProductSectionLabel(
                        title: "Size:",
                        element: SizesLabel(sizes: state.sizes)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ProductDescriptionLabel(
                      text: state.productDescriptionText,
                      imagePath: state.productDescriptionImagePath,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: ProductReviewColumnLayout(
                      items: state.reviewItems,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: ReviewFormLabel(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SectionLayout(
                      sectionText: "RELATED PRODUCT",
                      layout: ProductRowLayout(items: state.productCardItems),
                    ),
                  ),
                  context.emptySizedHeightBoxHigh,
                ],
              ),
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
      bottomSheet: ProductBottomSheetLabel(
        buttonOnPressed: _shopPopup,
        price: "45.00",
      ),
    );
  }
}
