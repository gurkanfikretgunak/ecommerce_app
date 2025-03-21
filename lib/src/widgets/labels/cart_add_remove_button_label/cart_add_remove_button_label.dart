import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CartAddRemoveButtonLabel extends StatelessWidget {
  const CartAddRemoveButtonLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CartAddRemoveButton(
          icon: Icons.local_mall,
        ),
        CartAddRemoveButton(
          color: ColorConstant.instance.neutral9,
          icon: Icons.close,
          iconColor: ColorConstant.instance.neutral1,
        )
      ],
    );
  }
}
