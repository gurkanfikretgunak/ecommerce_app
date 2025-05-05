import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class RateRowLayout extends StatelessWidget {
  final int rate;
  const RateRowLayout({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return RateInput(isSelected: index < rate, onTap: () {});
      }),
    );
  }
}
