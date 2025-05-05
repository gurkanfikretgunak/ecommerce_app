import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class BottomSheetLayout extends StatefulWidget {
  final List<String> items;
  final Function(String) onItemSelected;
  final String selectedValue;
  final Color? containerColor;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;

  const BottomSheetLayout({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.selectedValue,
    this.containerColor,
    this.height,
    this.margin,
    this.borderRadius,
  });

  @override
  State<BottomSheetLayout> createState() => _BottomSheetLayoutState();
}

class _BottomSheetLayoutState extends State<BottomSheetLayout> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: widget.containerColor ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius ?? 20),
          topRight: Radius.circular(widget.borderRadius ?? 20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 10),
            height: 2,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: ContentText(
                    fontSize: 12,
                    textAlign: TextAlign.start,
                    color: ColorConstant.instance.neutral1,
                    text: widget.items[index],
                  ),
                  trailing: Radio(
                    hoverColor: ColorConstant.instance.neutral5,
                    activeColor: ColorConstant.instance.primary_main,
                    value: widget.items[index],
                    groupValue: selectedItem,
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value!;
                      });
                      widget.onItemSelected(value!);
                      Navigator.pop(context);
                    },
                  ),
                  onTap: () {
                    setState(() {
                      selectedItem = widget.items[index];
                    });
                    widget.onItemSelected(widget.items[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
