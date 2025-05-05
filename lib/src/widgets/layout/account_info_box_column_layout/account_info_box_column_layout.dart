import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:shopapp_widgets/src/widgets/labels/account_info_box_label/account_info_box_label.dart';

class AccountInfoBoxColumnLayout extends StatelessWidget {
  final List<AccountInfoBoxLabel> items;
  const AccountInfoBoxColumnLayout({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return items[index];
        },
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return context.emptySizedHeightBoxNormal;
        },
        itemCount: items.length);
  }
}
