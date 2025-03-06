import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Color? iconColor;
  final String? text;
  final VoidCallback? onPressed;
  final List<Widget>? actions; // İsteğe bağlı sağdaki Row için

  const CustomAppbar({
    super.key,
    this.iconColor,
    this.text,
    this.onPressed,
    this.actions,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        height: widget.preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackArrowButton(
              color: widget.iconColor,
              size: 15,
              onPressed: widget.onPressed,
            ),
            if (widget.text != null) Expanded(child: Container()),
            if (widget.text != null)
              Center(
                child: HeadText(
                  text: widget.text!,
                  color: ColorConstant.instance.neutral1,
                  fontSize: 20,
                ),
              ),
            if (widget.text != null) Expanded(child: Container()),
            if (widget.actions != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.actions!,
              ),
          ],
        ),
      ),
    );
  }
}
