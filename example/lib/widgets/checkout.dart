import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/addresses/addresses_view.dart';
import 'package:example/pages/paymentmethods/paymentmethods_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class Checkout extends StatefulWidget {
  final VoidCallback? buttonCallBack;
  const Checkout({super.key, this.buttonCallBack});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          context.emptySizedHeightBoxNormal,
          AddressBoxModal(
              name: "Theresa Webb",
              address: "3517 W. Gray St. Utica, Pennsylvania 57867",
              email: "willie.jennings@example.com",
              onTap: () {
                AutoRouter.of(context).push(AddressesViewRoute());
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressesView()));*/
              },
              phone: "(480) 555-0103"),
          context.emptySizedHeightBoxNormal,
          PaymentMethodBoxModal(
              onTap: () {
                AutoRouter.of(context).push(const PaymentMethodsViewRoute());
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentMethodsView()));*/
              },
              text: "Master card Ending *****23"),
          context.emptySizedHeightBoxNormal,
          CheckoutListLayout(items: productBoxRowItems),
          context.emptySizedHeightBoxNormal,
          CustomButton(
              onPressed: widget.buttonCallBack ?? () {},
              height: 50,
              text: "Order Now"),
        ],
      ),
    );
  }
}
