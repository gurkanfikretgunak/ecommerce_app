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
    return Container(
      child: Center(
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
                iconPath: "assets/icons/truck.svg",
                description:
                    "Dolor magna eget est lorem ipsum dolor sit amet consectetur."),
          ],
        ),
      ),
    );
  }
}
