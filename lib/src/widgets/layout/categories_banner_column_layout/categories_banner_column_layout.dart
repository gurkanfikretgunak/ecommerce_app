import 'package:flutter/material.dart';

class CategoriesBannerColumnLayout extends StatelessWidget {
  final List<Widget> items;

  const CategoriesBannerColumnLayout({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            child: items[index],
            margin: EdgeInsets.only(bottom: 20),
          );
        });
  }
}
