import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/cart/cart_state.dart';

@RoutePage()
class Checkout extends StatefulWidget {
  final VoidCallback? buttonCallBack;
  const Checkout({super.key, this.buttonCallBack});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        Widget checkoutContent;

        if (cartState is CartLoading) {
          checkoutContent = const Center(child: CircularProgressIndicator());
        } else if (cartState is CartLoaded) {
          checkoutContent = Column(
            children: [
              context.emptySizedHeightBoxNormal,
              AddressBoxModal(
                name: "Theresa Webb",
                address: "3517 W. Gray St. Utica, Pennsylvania 57867",
                email: "willie.jennings@example.com",
                onTap: () {
                  AutoRouter.of(context).push(AddressesViewRoute());
                },
                phone: "(480) 555-0103",
              ),
              context.emptySizedHeightBoxNormal,
              PaymentMethodBoxModal(
                onTap: () {
                  AutoRouter.of(context).push(const PaymentMethodsViewRoute());
                },
                text: "Master card Ending *****23",
              ),
              context.emptySizedHeightBoxNormal,
              CheckoutListLayout(
                items: cartState.cart.map((item) {
                  return ProductBoxModal(
                    imagePath: item.product!.image,
                    name: item.product!.name,
                    price: item.product!.price,
                    quantity: item.quantity,
                    size: item.size,
                    onTap: () {
                      context.read<ProductCubit>().changeProduct(item.product!);
                      AutoRouter.of(context).push(const ProductViewRoute());
                    },
                  );
                }).toList(),
              ),
              context.emptySizedHeightBoxNormal,
              CustomButton(
                onPressed: widget.buttonCallBack ?? () {},
                height: 50,
                text: "Order Now",
              ),
            ],
          );
        } else {
          checkoutContent = SizedBox(
            height: 100,
            child: Center(
              child: HeadText(
                text: "Cart is Empty",
                color: ColorConstant.instance.neutral1,
              ),
            ),
          );
        }

        return SingleChildScrollView(child: checkoutContent);
      },
    );
  }
}
