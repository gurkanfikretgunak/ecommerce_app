import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class BottomNavigationLabel extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final BottomNavigationBarType? type;

  const BottomNavigationLabel({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.type,
  });

  @override
  State<BottomNavigationLabel> createState() => _BottomNavigationLabelState();
}

class _BottomNavigationLabelState extends State<BottomNavigationLabel> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: widget.type ?? BottomNavigationBarType.fixed,
      items: widget.items,
      backgroundColor:
          widget.backgroundColor ?? ColorConstant.instance.neutral9,
      selectedItemColor:
          widget.selectedItemColor ?? ColorConstant.instance.primary_main,
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      unselectedItemColor:
          widget.unselectedItemColor ?? ColorConstant.instance.neutral4,
    );
  }
}
