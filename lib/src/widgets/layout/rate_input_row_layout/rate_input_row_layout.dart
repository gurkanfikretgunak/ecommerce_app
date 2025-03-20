import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RateInputRowLayout extends StatefulWidget {
  final double? size;
  final int selectedStarCount;
  final Function(int) onStarSelected;

  const RateInputRowLayout({
    Key? key,
    this.size,
    required this.selectedStarCount,
    required this.onStarSelected,
  }) : super(key: key);

  @override
  State<RateInputRowLayout> createState() => _RateInputRowLayoutState();
}

class _RateInputRowLayoutState extends State<RateInputRowLayout> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RateInput(
          size: widget.size,
          isSelected: widget.selectedStarCount >= 1,
          onTap: () {
            widget.onStarSelected(widget.selectedStarCount == 1 ? 0 : 1);
          },
        ),
        RateInput(
          size: widget.size,
          isSelected: widget.selectedStarCount >= 2,
          onTap: () {
            widget.onStarSelected(2);
          },
        ),
        RateInput(
          size: widget.size,
          isSelected: widget.selectedStarCount >= 3,
          onTap: () {
            widget.onStarSelected(3);
          },
        ),
        RateInput(
          size: widget.size,
          isSelected: widget.selectedStarCount >= 4,
          onTap: () {
            widget.onStarSelected(4);
          },
        ),
        RateInput(
          size: widget.size,
          isSelected: widget.selectedStarCount == 5,
          onTap: () {
            widget.onStarSelected(5);
          },
        ),
      ],
    );
  }
}
