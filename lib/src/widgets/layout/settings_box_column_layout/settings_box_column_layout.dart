import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SettingsBoxColumnLayout extends StatelessWidget {
  final List<SettingsBoxLabel> items;
  const SettingsBoxColumnLayout({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return items[index];
      },
      separatorBuilder: (context, index) {
        return context.emptySizedHeightBoxNormal;
      },
    );
  }
}
