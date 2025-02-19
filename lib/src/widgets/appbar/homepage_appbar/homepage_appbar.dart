import 'package:flutter/material.dart';

class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;
  final IconData icon;
  final Color? iconColor;
  final double? logoScale;

  const HomePageAppbar({
    super.key,
    required this.logoPath,
    required this.icon,
    this.iconColor,
    this.logoScale,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              logoPath,
              scale: logoScale ?? 2,
            ),
            Icon(
              icon,
              color: iconColor ?? Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
