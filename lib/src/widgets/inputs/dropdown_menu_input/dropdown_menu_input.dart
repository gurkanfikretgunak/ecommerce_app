import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class DropDownMenuInput extends StatefulWidget {
  final List<String> items;
  final String? selected;
  final Function(String)? onSelected;
  const DropDownMenuInput(
      {super.key, required this.items, this.selected, this.onSelected});

  @override
  State<DropDownMenuInput> createState() => _DropDownMenuInputState();
}

class _DropDownMenuInputState extends State<DropDownMenuInput> {
  late String selected;
  @override
  void initState() {
    super.initState();
    selected = widget.selected != null ? widget.selected! : widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selected,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: ContentText(
              text: value,
              fontSize: 11,
              color: ColorConstant.instance.neutral1),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.onSelected!(newValue!);
        });
      },
    );
  }
}
