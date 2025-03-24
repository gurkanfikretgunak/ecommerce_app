import 'package:auto_route/auto_route.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:example/views/product/models/product_detail_cubit.dart';
import 'package:example/views/product/models/product_detail_state.dart';
import 'package:example/cubits/review/review_cubit.dart';
import 'package:example/cubits/review/review_state.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:example/core/network/models/review_model/review_model.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController reviewTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final product =
        (context.read<ProductCubit>().state as ProductLoaded).product;
    context.read<ProductDetailCubit>().getProductDetail(product.id);
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, productState) {
          if (productState is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (productState is ProductLoaded) {
            final product = productState.product;
            context.read<ProductDetailCubit>().getProductDetail(product.id);
            return BlocBuilder<ProductDetailCubit, ProductDetailState>(
              builder: (context, state) {
                if (state is ProductDetailLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductDetailLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductHeader(
                          imagePaths: state.productDetail.images,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          action: [
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context).push(PaymentViewRoute());
                              },
                              child: SvgPicture.asset("assets/icons/cart.svg"),
                            ),
                            context.emptySizedWidthBoxNormal,
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const SearchViewRoute());
                              },
                              child:
                                  SvgPicture.asset("assets/icons/search.svg"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ProductInfoLabel(
                            rating: state.productDetail.rate.toString(),
                            reviewCount:
                                state.productDetail.rate_count.toString(),
                            soldCount: product.sold_count.toString(),
                            productName: product.name,
                            description: state.productDetail.info,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ProductSectionLabel(
                            title: "Color:",
                            element: ColorsLabel(
                              colors: state.productDetail.colors
                                  .map(
                                      (color) => Color(int.parse("0xFF$color")))
                                  .toList(),
                              selectedColor: state.selectedColor,
                              onColorSelected: (color) {
                                context
                                    .read<ProductDetailCubit>()
                                    .changeSelectedColor(color);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ProductSectionLabel(
                              title: "Size:",
                              element: SizesLabel(
                                sizes: state.productDetail.sizes,
                                selectedSize: state.selectedSize,
                                onSizeSelected: (size) {
                                  context
                                      .read<ProductDetailCubit>()
                                      .changeSelectedSize(size);
                                },
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ProductDescriptionLabel(
                            text: state.productDetail.description,
                            imagePath: state.productDetail.description_image[0],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ProductReviewColumnLayout(
                            items: state.productDetail.reviews!.map((review) {
                              return ProductReviewModal(
                                imagePath: review.user!.profile_picture,
                                name: review.user!.display_name,
                                rate: review.rate ?? 0,
                                reviewText: review.text ?? '',
                                date: DateFormat('yyyy-MM-dd').format(
                                    DateTime.parse(review.createdAt ?? '')),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, authState) {
                              if (authState is AuthAuthenticated) {
                                return BlocListener<ReviewCubit, ReviewState>(
                                  listener: (context, reviewState) {
                                    if (reviewState is ReviewSuccess) {
                                      context
                                          .read<ProductDetailCubit>()
                                          .getProductDetail(product.id);
                                      reviewTextController.clear();
                                    }
                                  },
                                  child: ReviewFormLabel(
                                    onStarSelected: (rate) {
                                      context
                                          .read<ProductDetailCubit>()
                                          .changeSelectedRate(rate);
                                    },
                                    onSubmit: () {
                                      final review = Review(
                                        text: reviewTextController.text,
                                        rate: state.selectedRate,
                                        productDetailId: state.productDetail.id,
                                        userId: authState.user.id,
                                      );
                                      context
                                          .read<ReviewCubit>()
                                          .postReview(review);
                                    },
                                    selectedStarCount: state.selectedRate ?? 0,
                                    reviewTextController: reviewTextController,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child:
                                      Text('Please sign in to leave a review.'),
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: SectionLayout(
                            sectionText: "RELATED PRODUCT",
                            layout: ProductRowLayout(
                              items:
                                  state.relatedProducts!.map((relatedProduct) {
                                return ProductCardModal(
                                  imagePath: relatedProduct.image,
                                  productName: relatedProduct.name,
                                  productPrice: relatedProduct.price.toString(),
                                  productStock:
                                      relatedProduct.sold_count.toString(),
                                  onTap: () {
                                    context
                                        .read<ProductCubit>()
                                        .changeProduct(relatedProduct);
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        context.emptySizedHeightBoxHigh,
                      ],
                    ),
                  );
                } else if (state is ProductDetailError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return Container();
                }
              },
            );
          } else if (productState is ProductError) {
            return Center(child: Text('Error: ${productState.message}'));
          } else {
            return Container();
          }
        },
      ),
      bottomSheet: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, productState) {
          if (productState is ProductLoaded) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is AuthAuthenticated) {
                  return ProductBottomSheetLabel(
                    buttonOnPressed: () {
                      final cartModel = Cart(
                        userId: authState.user.id,
                        productId: productState.product.product_id,
                        productName: productState.product.name,
                        unitPrice: productState.product.price,
                        productImage: productState.product.image,
                        quantity: 1,
                      );
                      context.read<CartCubit>().postCart(cartModel);
                      _shopPopup();
                    },
                    price: productState.product.price.toString(),
                  );
                } else {
                  return Container();
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
