import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class NotificationBoxColumnLayout extends StatefulWidget {
  final List<NotificationBoxModal> notificationItems;

  const NotificationBoxColumnLayout({
    super.key,
    required this.notificationItems,
  });

  @override
  State<NotificationBoxColumnLayout> createState() =>
      _NotificationBoxColumnLayoutState();
}

class _NotificationBoxColumnLayoutState
    extends State<NotificationBoxColumnLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(child: widget.notificationItems[index]),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return context.emptySizedHeightBoxNormal;
      },
      itemCount: widget.notificationItems.length,
    );
  }
}
