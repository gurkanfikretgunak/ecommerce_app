import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ColorsLabel extends StatefulWidget {
  const ColorsLabel({super.key});

  @override
  State<ColorsLabel> createState() => _ColorsLabelState();
}

class _ColorsLabelState extends State<ColorsLabel> {
  Color _selectedColor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductText(
          text: "Color:",
          fontSize: 12,
          textAlign: TextAlign.start,
          color: ColorConstant.instance.neutral1,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            ColorRadiusInput(
              color: Colors.brown,
              isSelected: _selectedColor == Colors.brown,
              onTap: () {
                setState(() {
                  _selectedColor = Colors.brown;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ColorRadiusInput(
              color: ColorConstant.instance.neutral4,
              isSelected: _selectedColor == ColorConstant.instance.neutral4,
              onTap: () {
                setState(() {
                  _selectedColor = ColorConstant.instance.neutral4;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ColorRadiusInput(
              color: Colors.blue,
              isSelected: _selectedColor == Colors.blue,
              onTap: () {
                setState(() {
                  _selectedColor = Colors.blue;
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
