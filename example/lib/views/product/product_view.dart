import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/models/review_model/review_model.dart';
import 'package:example/core/network/models/wishlist_model/wishlist_model.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:example/cubits/review/review_cubit.dart';
import 'package:example/cubits/review/review_state.dart';
import 'package:example/cubits/wishlist/wishlist_cubit.dart';
import 'package:example/cubits/wishlist/wishlist_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:example/views/product/models/product_detail_cubit.dart';
import 'package:example/views/product/models/product_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController reviewTextController = TextEditingController();
  late final AuthState userState;

  @override
  void initState() {
    super.initState();

    final productCubit = context.read<ProductCubit>();
    if (productCubit.state is ProductChanged) {
      final product = (productCubit.state as ProductChanged).product;
      context.read<ProductDetailCubit>().getProductDetail(product.product_id);

      userState = context.read<AuthCubit>().state;
      if (userState is AuthAuthenticated) {
        final userId = (userState as AuthAuthenticated).user.id;
        context.read<WishlistCubit>().isProductInWishlist(product.id, userId);
      }
    }
  }

  void _showAddToCartSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopupSuccesLabel(
          succesIconPath: Assets.icons.success.path,
          title: L10n.of(context)!.success,
          buttonOnPressed: () {
            AutoRouter.of(context).push(MainpageViewRoute(pageNo: 2));
          },
          description: L10n.of(context)!.orderSuccessDescription,
          iconPath: "assets/icons/cart.svg",
          buttonText: L10n.of(context)!.viewCart,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildProductBody(),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildProductBody() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, productState) {
        if (productState is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (productState is ProductChanged) {
          final product = (productState as ProductChanged).product;

          return _buildProductDetail(productState.product);
        } else if (productState is ProductError) {
          return _buildErrorView(productState.message);
        }
        return Container();
      },
    );
  }

  Widget _buildErrorView(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text('Error: $message',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetail(dynamic product) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        if (state is ProductDetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductDetailLoaded) {
          return _buildProductContent(state, product);
        } else if (state is ProductDetailError) {
          return _buildErrorView(state.message);
        }
        return Container();
      },
    );
  }

  Widget _buildProductContent(ProductDetailLoaded state, dynamic product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProductHeader(state.productDetail.images),
          _buildProductInfo(state, product),
          _buildColorSection(state),
          _buildSizeSection(state),
          _buildDescriptionSection(state),
          _buildReviewsSection(state),
          _buildReviewForm(state),
          _buildRelatedProducts(state),
          context.emptySizedHeightBoxHigh,
        ],
      ),
    );
  }

  Widget _buildProductHeader(List<String> images) {
    return ProductHeader(
      imagePaths: images,
      onPressed: () {
        Navigator.pop(context);
      },
      action: [
        InkWell(
          onTap: () {
            AutoRouter.of(context).push(MainpageViewRoute(pageNo: 2));
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
    );
  }

  Widget _buildProductInfo(ProductDetailLoaded state, dynamic product) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ProductInfoLabel(
        rating: state.productDetail.rate.toString(),
        reviewCount: state.productDetail.rate_count.toString(),
        soldCount: product.sold_count.toString(),
        productName: product.name,
        description: state.productDetail.info,
      ),
    );
  }

  Widget _buildColorSection(ProductDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ProductSectionLabel(
        title: L10n.of(context)!.color,
        element: ColorsLabel(
          colors: state.productDetail.colors
              .map((color) => Color(int.parse("0x$color")))
              .toList(),
          selectedColor: state.selectedColor,
          onColorSelected: (color) {
            context.read<ProductDetailCubit>().changeSelectedColor(color);
          },
        ),
      ),
    );
  }

  Widget _buildSizeSection(ProductDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ProductSectionLabel(
        title: L10n.of(context)!.size,
        element: SizesLabel(
          sizes: state.productDetail.sizes,
          selectedSize: state.selectedSize,
          onSizeSelected: (size) {
            context.read<ProductDetailCubit>().changeSelectedSize(size);
          },
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(ProductDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ProductDescriptionLabel(
        text: state.productDetail.description,
        imagePath: state.productDetail.description_image[0],
      ),
    );
  }

  Widget _buildReviewsSection(ProductDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ProductReviewColumnLayout(
        items: state.productDetail.reviews!.map((review) {
          return ProductReviewModal(
            imagePath: review.user!.profile_picture!,
            name: review.user!.display_name,
            rate: review.rate ?? 0,
            reviewText: review.text ?? '',
            date: DateFormat('yyyy-MM-dd')
                .format(DateTime.parse(review.createdAt ?? '')),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildReviewForm(ProductDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          if (authState is AuthAuthenticated) {
            return BlocConsumer<ReviewCubit, ReviewState>(
              listener: (context, reviewState) {
                if (reviewState is ReviewSuccess) {
                  final productCubit = context.read<ProductCubit>();
                  if (productCubit.state is ProductChanged) {
                    final product =
                        (productCubit.state as ProductChanged).product;
                    context
                        .read<ProductDetailCubit>()
                        .getProductDetail(product.product_id);
                  }
                  reviewTextController.clear();
                }
              },
              builder: (context, reviewState) {
                return ReviewFormLabel(
                    onStarSelected: (rate) {
                      context
                          .read<ProductDetailCubit>()
                          .changeSelectedRate(rate);
                    },
                    onSubmit: () => _submitReview(authState, state),
                    selectedStarCount: state.selectedRate ?? 0,
                    reviewTextController: reviewTextController,
                    titleText: L10n.of(context)!.addReview,
                    reviewHintText: L10n.of(context)!.yourReview,
                    ratingLabelText: L10n.of(context)!.yourRating,
                    submitButtonText: L10n.of(context)!.submit);
              },
            );
          } else {
            return Center(
              child: Text(L10n.of(context)!.pleaseSignInReview),
            );
          }
        },
      ),
    );
  }

  void _submitReview(AuthAuthenticated authState, ProductDetailLoaded state) {
    final review = Review(
      text: reviewTextController.text,
      rate: state.selectedRate,
      productDetailId: state.productDetail.id,
      userId: authState.user.id,
    );
    context.read<ReviewCubit>().postReview(review);
  }

  Widget _buildRelatedProducts(ProductDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SectionLayout(
        sectionText: L10n.of(context)!.relatedProduct,
        layout: ProductRowLayout(
          items: state.relatedProducts!.map((relatedProduct) {
            return ProductCardModal(
              imagePath: relatedProduct.image,
              productName: relatedProduct.name,
              productPrice: relatedProduct.price.toString(),
              productStock: relatedProduct.sold_count.toString(),
              onTap: () {
                context.read<ProductCubit>().changeProduct(relatedProduct);
                context
                    .read<ProductDetailCubit>()
                    .getProductDetail(relatedProduct.product_id);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBottomSheet() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, productState) {
        if (productState is ProductChanged) {
          return BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, productDetailState) {
              if (productDetailState is ProductDetailLoaded) {
                return _buildAuthenticatedBottomSheet(
                    productState.product, productDetailState);
              }
              return Container();
            },
          );
        }
        return Container();
      },
    );
  }

  Widget _buildAuthenticatedBottomSheet(
      dynamic product, ProductDetailLoaded state) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        if (authState is AuthAuthenticated) {
          final productId = product.id;
          final userId = authState.user.id;

          return BlocBuilder<WishlistCubit, WishlistState>(
            builder: (context, wishlistState) {
              bool isFavorite = false;
              if (wishlistState is WishlistIsFavorite) {
                isFavorite = wishlistState.isFavorite;
              } else if (wishlistState is WishlistChangeFavorite) {
                context
                    .read<WishlistCubit>()
                    .isProductInWishlist(product.id, userId);
                isFavorite = wishlistState.isFavorite;
              } else if (wishlistState is WishlistLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return ProductBottomSheetLabel(
                isFavorite: isFavorite,
                favoriteOnPressed: () =>
                    _toggleFavorite(productId, state, userId),
                buttonOnPressed: () => _addToCart(product, state, userId),
                buttonText: L10n.of(context)!.addToCard,
                price: product.price.toString(),
              );
            },
          );
        }
        return Container();
      },
    );
  }

  void _toggleFavorite(
      int productId, ProductDetailLoaded state, String userId) {
    final wishlistCubit = context.read<WishlistCubit>();
    bool isFavorite = wishlistCubit.state is WishlistIsFavorite &&
        (wishlistCubit.state as WishlistIsFavorite).isFavorite;

    if (isFavorite) {
      wishlistCubit.deleteWishlist(productId);
    } else {
      final wishlistModel = Wishlist(
        product_id: productId,
        user_id: userId,
        sizes: state.productDetail.sizes,
        colors: state.productDetail.colors,
      );
      wishlistCubit.postWishlist(wishlistModel);
    }
  }

  void _addToCart(dynamic product, ProductDetailLoaded state, String userId) {
    final cartModel = Cart(
      userId: userId,
      productId: product.id,
      unitPrice: product.price,
      quantity: 1,
      color: state.selectedColor.value
          .toRadixString(16)
          .padLeft(8, '0')
          .toUpperCase(),
      size: state.selectedSize,
    );
    context.read<CartCubit>().postCart(cartModel);
    _showAddToCartSuccess();
  }
}
