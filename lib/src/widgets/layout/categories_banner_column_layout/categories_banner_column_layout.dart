import 'package:flutter/material.dart';

class CategoriesBannerColumnLayout extends StatelessWidget {
  final List<Widget> items;

  const CategoriesBannerColumnLayout({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: items[index],
          );
        });
  }
}
