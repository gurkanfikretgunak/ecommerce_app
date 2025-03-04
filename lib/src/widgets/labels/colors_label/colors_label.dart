import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ColorsLabel extends StatefulWidget {
  final List<Color>? colors;

  const ColorsLabel({
    super.key,
    this.colors,
  });

  @override
  State<ColorsLabel> createState() => _ColorsLabelState();
}

class _ColorsLabelState extends State<ColorsLabel> {
  late Color _selectedColor;
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();
    _colors = widget.colors ??
        [Colors.brown, ColorConstant.instance.neutral4, Colors.blue];
    _selectedColor = _colors[0];
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
            },
          ),
        );
      }).toList(),
    );
  }
}
