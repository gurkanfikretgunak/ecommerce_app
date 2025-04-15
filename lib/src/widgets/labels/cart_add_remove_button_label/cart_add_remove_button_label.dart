import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CartAddRemoveButtonLabel extends StatelessWidget {
  final Function(int)? onCartAddPressed;
  final Function(int)? onRemovePressed;
  const CartAddRemoveButtonLabel(
      {super.key, this.onCartAddPressed, this.onRemovePressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CartAddRemoveButton(
          icon: Icons.local_mall,
          onPressed: onCartAddPressed,
        ),
        CartAddRemoveButton(
          color: ColorConstant.instance.neutral9,
          icon: Icons.close,
          iconColor: ColorConstant.instance.neutral1,
          onPressed: onRemovePressed,
        )
      ],
    );
  }
}
