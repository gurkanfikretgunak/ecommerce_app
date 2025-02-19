import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class HomePageAppbar extends StatefulWidget {
  final String logoPath;
  final IconData icon;
  final Color? iconColor;
  final double? logoScale;

  const HomePageAppbar(
      {super.key,
      required this.logoPath,
      required this.icon,
      this.iconColor,
      this.logoScale});

  @override
  State<HomePageAppbar> createState() => _HomePageAppbarState();
}

class _HomePageAppbarState extends State<HomePageAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          widget.logoPath,
          scale: widget.logoScale ?? 2,
        ),
        Icon(
          widget.icon,
          color: widget.iconColor ?? ColorConstant.instance.neutral4,
        )
      ],
    );
  }
}
