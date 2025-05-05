import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ColorsLabel extends StatelessWidget {
  final List<Color>? colors;
  final Color? selectedColor;
  final Function(Color)? onColorSelected;

  const ColorsLabel({
    super.key,
    this.colors,
    this.selectedColor,
    this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> colorsList =
        colors ?? [Colors.red, Colors.blue, Colors.green, Colors.yellow];
    final Color selected = selectedColor ?? Colors.white;

    return Row(
      children: colorsList.map((color) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ColorRadiusInput(
            color: color,
            isSelected: selected == color,
            onTap: () {
              if (onColorSelected != null) {
                onColorSelected!(color);
              }
            },
          ),
        );
      }).toList(),
    );
  }
}
