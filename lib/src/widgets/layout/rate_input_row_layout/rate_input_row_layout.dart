import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RateInputRowLayout extends StatefulWidget {
  final double? size;
  const RateInputRowLayout({super.key, this.size});

  @override
  State<RateInputRowLayout> createState() => _RateInputRowLayoutState();
}

class _RateInputRowLayoutState extends State<RateInputRowLayout> {
  int selectedStarCount = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RateInput(
            size: widget.size,
            isSelected: selectedStarCount >= 1,
            onTap: () {
              setState(() {
                selectedStarCount = selectedStarCount == 1 ? 0 : 1;
              });
            }),
        RateInput(
            size: widget.size,
            isSelected: selectedStarCount >= 2,
            onTap: () {
              setState(() {
                selectedStarCount = 2;
              });
            }),
        RateInput(
            size: widget.size,
            isSelected: selectedStarCount >= 3,
            onTap: () {
              setState(() {
                selectedStarCount = 3;
              });
            }),
        RateInput(
            size: widget.size,
            isSelected: selectedStarCount >= 4,
            onTap: () {
              setState(() {
                selectedStarCount = 4;
              });
            }),
        RateInput(
            size: widget.size,
            isSelected: selectedStarCount == 5,
            onTap: () {
              setState(() {
                selectedStarCount = 5;
              });
            }),
      ],
    );
  }
}
