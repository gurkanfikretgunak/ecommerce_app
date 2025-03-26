import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<ProductBoxModal> productBoxRowItems = [
    ProductBoxModal(
        imagePath: Assets.images.productboximage.path,
        name: "Basic T-shirt",
        price: 49.99),
    ProductBoxModal(
        imagePath: Assets.images.productboximage.path,
        name: "Basic T-shirt",
        price: 40.99),
    ProductBoxModal(
        imagePath: Assets.images.productboximage.path,
        name: "Basic T-shirt",
        price: 52.99),
  ];

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        Widget cartContent;

        if (cartState is CartLoading) {
          context.read<CartCubit>().getCart(widget.userId);
          cartContent = const Center(child: CircularProgressIndicator());
        } else if (cartState is CartLoaded) {
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
                text: "Cart is Empty",
                color: ColorConstant.instance.neutral1,
              )));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              context.emptySizedHeightBoxNormal,
              cartContent,
              context.emptySizedHeightBoxNormal,
              SectionLayout(
                sectionText: "YOU ALSO VIEWED",
                layout: ProductGridLayout(productItems: productCardItems),
              ),
              CustomButton(
                onPressed: widget.buttonCallBack ?? () {},
                height: 50,
                text: "Proceed To Checkout",
              ),
            ],
          ),
        );
      },
    );
  }
}
