import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class MyorderListLayout extends StatefulWidget {
  final List<ProductBoxModal> items;
  final List<OrderDetailBoxLabel>? rightItem;

  const MyorderListLayout({super.key, required this.items, this.rightItem});

  @override
  State<MyorderListLayout> createState() => _MyorderListLayoutState();
}

class _MyorderListLayoutState extends State<MyorderListLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ProductBoxRowLayout(
                productBox: widget.items[index],
                item: widget.rightItem![index],
              ),
              context.emptySizedHeightBoxNormal,
            ],
          );
        },
      ),
    );
  }
}
