import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/wishlist/wishlist_cubit.dart';
import 'package:example/cubits/wishlist/wishlist_state.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class Wishlist extends StatefulWidget {
  final List<ProductBoxModal> items;

  const Wishlist({super.key, required this.items});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    super.initState();
  }

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
                return const Center(child: CircularProgressIndicator());
              } else if (state is WishlistChangeFavorite) {
                context.read<WishlistCubit>().getWishlist(userId);
                return const Center(child: CircularProgressIndicator());
              } else if (state is WishlistLoaded) {
                isWishlistEmpty = state.wishlist.isEmpty;

                if (isWishlistEmpty) {
                  return SizedBox(
                      height: 100,
                      child: Center(
                          child: HeadText(
                        text: "Wishlist is Empty",
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
                    const ToastMessageLabel(
                            title: "Product Added to Cart",
                            type: ToastType.success,
                            description: "Product Added to Cart Successfully")
                        .show(context);
                  },
                  onRemovePressed: (index) {
                    context
                        .read<WishlistCubit>()
                        .deleteWishlist(state.wishlist[index].product_id!);
                  },
                  items: state.wishlist.map((item) {
                    return ProductBoxModal(
                      imagePath: item.product!.image,
                      name: item.product!.name,
                      price: item.product!.price,
                      sizeList: item.sizes,
                      onSizeChange: (value) {
                        item.selectedSize = value;
                      },
                    );
                  }).toList(),
                );
              } else if (state is WishlistError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return SizedBox(
                    height: 100,
                    child: Center(
                        child: HeadText(
                      text: "Wishlist is Empty",
                      color: ColorConstant.instance.neutral1,
                    )));
              }
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
