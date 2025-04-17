import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SearchAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Color? iconColor;
  final String? text;
  final String? hintText;
  final VoidCallback? onPressed;
  final VoidCallback? iconOnPressed;
  final TextEditingController? textEditingController;
  final Function(String)? textOnChanged;

  const SearchAppbar({
    super.key,
    this.iconColor,
    this.text,
    this.onPressed,
    this.hintText = 'Search Product...',
    required this.iconOnPressed,
    this.textEditingController,
    this.textOnChanged,
  });

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _SearchAppbarState extends State<SearchAppbar> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        height: widget.preferredSize.height,
        child: Row(
          children: [
            BackArrowButton(
              color: widget.iconColor,
              size: 15,
              onPressed: widget.onPressed,
            ),
            SizedBox(
              height: 75,
              width: screenWidth * 0.65,
              child: SearchBarInput(
                textEditingController: widget.textEditingController,
                hintText: widget.hintText ?? '',
                textOnChanged: widget.textOnChanged,
              ),
            ),
            IconButton(
              onPressed: widget.iconOnPressed,
              icon: const Icon(Icons.tune),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
