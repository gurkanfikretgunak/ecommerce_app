import 'package:flutter/material.dart';

class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;
  final IconData icon;
  final Color? iconColor;
  final double? logoScale;
  final VoidCallback? iconOnPressed;

  const HomePageAppbar({
    super.key,
    required this.logoPath,
    required this.icon,
    this.iconColor,
    this.logoScale,
    this.iconOnPressed,
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
            IconButton(
              icon: Icon(
                icon,
                color: iconColor ?? Colors.black,
              ),
              onPressed: iconOnPressed,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
