import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/l10n/app_l10n.dart';

class Cart extends StatefulWidget {
  final VoidCallback? buttonCallBack;
  final String userId;

  const Cart({super.key, this.buttonCallBack, required this.userId});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart(widget.userId);
    // context.read<ProductCubit>().getProducts("you also viewed");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        Widget cartContent;
        bool isCartEmpty = false;

        if (cartState is CartLoading) {
          context.read<CartCubit>().getCart(widget.userId);
          cartContent = const Center(child: CircularProgressAnimation());
        } else if (cartState is CartLoaded) {
          isCartEmpty = cartState.cart.isEmpty;
          cartContent = CartListLayout(
            onQuantityChanged: (index, newQuantity) {
              context.read<CartCubit>().updateQuantity(index, newQuantity);
            },
            items: cartState.cart.map((item) {
              return ProductBoxModal(
                imagePath: item.product!.image,
                name: item.product!.name,
                quantity: item.quantity,
                price: item.product!.price,
                color: Color(int.parse("0x${item.color}")),
                size: item.size,
                onTap: () {
                  context.read<ProductCubit>().changeProduct(item.product!);
                  AutoRouter.of(context).push(const ProductViewRoute());
                },
              );
            }).toList(),
          );
        } else {
          cartContent = SizedBox(
              height: 100,
              child: Center(
                  child: HeadText(
                text: L10n.of(context)!.cartIsEmpty,
                color: ColorConstant.instance.neutral1,
              )));
          isCartEmpty = true;
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              context.emptySizedHeightBoxNormal,
              cartContent,
              context.emptySizedHeightBoxNormal,
              /*  BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressAnimation());
                  } else if (state is ProductChanged) {
                    //context.read<ProductCubit>().getProducts("you also viewed");
                    return const Center(child: CircularProgressAnimation());
                  } else if (state is ProductLoaded) {
                    return SectionLayout(
                      sectionText: "YOU ALSO VIEWED",
                      layout: ProductRowLayout(
                        items: state.product!.map((product) {
                          return ProductCardModal(
                            imagePath: product.image,
                            productName: product.name,
                            productPrice: product.price.toString(),
                            productStock: product.sold_count.toString(),
                            onTap: () {
                              context
                                  .read<ProductCubit>()
                                  .changeProduct(product);
                              AutoRouter.of(context)
                                  .push(const ProductViewRoute());
                            },
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )*/
              Opacity(
                opacity: isCartEmpty ? 0.5 : 1.0,
                child: CustomButton(
                  onPressed: isCartEmpty
                      ? () {
                          ToastMessageLabel(
                            title: L10n.of(context)!.cartIsEmpty,
                            type: ToastType.warning,
                            description: L10n.of(context)!.emptyCartWarningDesc,
                          ).show(context);
                        }
                      : widget.buttonCallBack ?? () {},
                  height: 50,
                  text: L10n.of(context)!.proceedToCheckout,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
