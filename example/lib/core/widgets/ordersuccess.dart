import 'package:example/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OrderSuccess extends StatelessWidget {
  final VoidCallback onSecondaryButtonPressed;
  final VoidCallback onPrimaryButtonPressed;
  const OrderSuccess(
      {super.key,
      required this.onSecondaryButtonPressed,
      required this.onPrimaryButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          OrderSuccessLabel(
              onPrimaryButtonPressed: onPrimaryButtonPressed,
              title: "ORDER SUCCESS",
              primaryButtonText: "MY ORDERS",
              secondaryButtonText: "CONTINUE SHOPPING",
              onSecondaryButtonPressed: onSecondaryButtonPressed,
              iconPath: Assets.icons.truck.path,
              succesiconPath: Assets.icons.success.path,
              radiusColor: ColorConstant.instance.green2,
              description:
                  "Dolor magna eget est lorem ipsum dolor sit amet consectetur."),
        ],
      ),
    );
  }
}
