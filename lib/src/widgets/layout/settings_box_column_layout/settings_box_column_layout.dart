import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class SettingsBoxColumnLayout extends StatefulWidget {
  final List<SettingsBoxLabel> items;
  SettingsBoxColumnLayout({super.key, required this.items});

  @override
  State<SettingsBoxColumnLayout> createState() =>
      _SettingsBoxColumnLayoutState();
}

class _SettingsBoxColumnLayoutState extends State<SettingsBoxColumnLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return widget.items[index];
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 25);
      },
    );
  }
}
