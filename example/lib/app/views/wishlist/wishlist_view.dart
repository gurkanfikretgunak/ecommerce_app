import 'package:auto_route/auto_route.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/cubits/cart/cart_cubit.dart';
import 'package:example/core/cubits/product/product_cubit.dart';
import 'package:example/core/cubits/wishlist/wishlist_cubit.dart';
import 'package:example/core/cubits/wishlist/wishlist_state.dart';
import 'package:example/core/cubits/auth/auth_cubit.dart';
import 'package:example/core/cubits/auth/auth_state.dart';
import 'package:example/app/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/app/l10n/app_l10n.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({
    super.key,
  });

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        if (authState is AuthAuthenticated) {
          final userId = authState.user.id;
          bool isWishlistEmpty = false;
          context.read<WishlistCubit>().getWishlist(userId);
          return BlocBuilder<WishlistCubit, WishlistState>(
            builder: (context, state) {
              if (state is WishlistLoading) {
                return const Center(child: CircularProgressAnimation());
              } else if (state is WishlistChangeFavorite) {
                context.read<WishlistCubit>().getWishlist(userId);
                return const Center(child: CircularProgressAnimation());
              } else if (state is WishlistLoaded) {
                isWishlistEmpty = state.wishlist.isEmpty;

                if (isWishlistEmpty) {
                  return SizedBox(
                      height: 100,
                      child: Center(
                          child: HeadText(
                        text: L10n.of(context)!.wishlistEmpty,
                        color: ColorConstant.instance.neutral1,
                      )));
                }
                return WishlistListLayout(
                  onCartAddPressed: (index) {
                    context.read<CartCubit>().postCart(Cart(
                          userId: userId,
                          productId: state.wishlist[index].product_id!,
                          quantity: 1,
                          unitPrice: state.wishlist[index].product!.price,
                          size: state.wishlist[index].selectedSize ??
                              state.wishlist[index].sizes[0],
                          color: state.wishlist[index].colors[0],
                        ));
                    ToastMessageLabel(
                            title: L10n.of(context)!.productAddedToCart,
                            type: ToastType.success,
                            description:
                                L10n.of(context)!.productAddedToCartSuccess)
                        .show(context);
                  },
                  onRemovePressed: (index) {
                    context
                        .read<WishlistCubit>()
                        .deleteWishlist(state.wishlist[index].product_id!);
                  },
                  items: state.wishlist.map((item) {
                    return ProductBoxModal(
                      fontSize: 15,
                      imagePath: item.product!.image,
                      name: item.product!.name,
                      price: item.product!.price,
                      sizeList: item.sizes,
                      onTap: () {
                        context
                            .read<ProductCubit>()
                            .changeProduct(item.product!);
                        AutoRouter.of(context).push(ProductViewRoute());
                      },
                      onSizeChange: (value) {
                        item.selectedSize = value;
                      },
                    );
                  }).toList(),
                );
              } else if (state is WishlistError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                context.read<WishlistCubit>().getWishlist(userId);
                return const Center(child: CircularProgressAnimation());
              }
            },
          );
        } else {
          return const Center(child: CircularProgressAnimation());
        }
      },
    );
  }
}
