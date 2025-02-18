import 'package:flutter/material.dart';
import 'package:shopapp_widgets/src/widgets/buttons/back_arrow_button/back_arrow_button.dart';

class CustomAppbar extends StatefulWidget {
  final Color? iconColor;

  const CustomAppbar({super.key, this.iconColor});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackArrowButton(color: widget.iconColor),
      ],
    );
  }
}
