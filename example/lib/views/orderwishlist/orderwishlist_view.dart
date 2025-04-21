import 'package:example/core/gen/assets.gen.dart';
import 'package:example/core/widgets/order.dart';
import 'package:example/core/widgets/wishlist.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:example/cubits/wishlist/wishlist_cubit.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class OrderwishlistView extends StatefulWidget {
  final bool? showOrder;
  const OrderwishlistView({super.key, this.showOrder});

  @override
  State<OrderwishlistView> createState() => _OrderwishlistViewState();
}

class _OrderwishlistViewState extends State<OrderwishlistView> {
  List<Widget> productCardItems = [
    ProductCardModal(
        imagePath: Assets.images.productcardimageFirst.path,
        productStock: "50",
        productName: "Long-sleeved T-shirt",
        productPrice: "49.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageSecond.path,
        productStock: "50",
        productName: "Printed Cotton Shirt",
        productPrice: "45.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageThird.path,
        productStock: "50",
        productName: "Cotton T-shirt",
        productPrice: "49.00"),
    ProductCardModal(
        imagePath: Assets.images.productcardimageFourth.path,
        productStock: "50",
        productName: "Embroidered T-Shirt",
        productPrice: "39.00"),
  ];

  bool _showOrder = false;

  @override
  void initState() {
    super.initState();
    _showOrder = widget.showOrder ?? false;

    //context.read<ProductCubit>().getProducts("you also viewed");
    final authState = context.read<AuthCubit>().state;
    if (authState is AuthAuthenticated) {
      final userId = authState.user.id;

      context.read<WishlistCubit>().getWishlist(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: _showOrder
              ? L10n.of(context)!.myOrder
              : L10n.of(context)!.wishlist,
          onPressed: () {
            context.read<BottomNavigationCubit>().setPage(0);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () {
                      setState(() {
                        _showOrder = true;
                      });
                    },
                    text: L10n.of(context)!.myOrder,
                    fontSize: 12,
                    width: context.width * 0.42,
                    color: _showOrder
                        ? ColorConstant.instance.primary_main
                        : ColorConstant.instance.neutral9,
                    textColor: _showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    icon: Icons.local_mall,
                    iconColor: _showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    height: 35,
                  ),
                  context.emptySizedWidthBoxNormal,
                  CustomButton(
                    onPressed: () {
                      setState(() {
                        _showOrder = false;
                      });
                    },
                    fontSize: 12,
                    text: L10n.of(context)!.wishlist,
                    width: context.width * 0.42,
                    color: !_showOrder
                        ? ColorConstant.instance.primary_main
                        : ColorConstant.instance.neutral9,
                    textColor: !_showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    icon: Icons.favorite,
                    iconColor: !_showOrder
                        ? ColorConstant.instance.neutral9
                        : ColorConstant.instance.neutral1,
                    height: 35,
                  ),
                ],
              ),
              context.emptySizedHeightBoxNormal,
              _showOrder ? Order() : Wishlist(),
              /*BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    context.read<ProductCubit>().getProducts("you also viewed");
                    return const Center(child: CircularProgressIndicator());
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
            ],
          ),
        ),
      ),
    );
  }
}
