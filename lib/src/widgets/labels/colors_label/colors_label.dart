import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ColorsLabel extends StatefulWidget {
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
  State<ColorsLabel> createState() => _ColorsLabelState();
}

class _ColorsLabelState extends State<ColorsLabel> {
  late List<Color> _colors;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _colors = widget.colors ?? [Colors.brown, Colors.blue, Colors.red];
    _selectedColor = widget.selectedColor ?? _colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _colors.map((color) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ColorRadiusInput(
            color: color,
            isSelected: _selectedColor == color,
            onTap: () {
              setState(() {
                _selectedColor = color;
              });
              widget.onColorSelected!(color);
            },
          ),
        );
      }).toList(),
    );
  }
}
