import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class NotificationBoxColumnLayout extends StatefulWidget {
  final bool isSelectView;
  final List<NofiticationBoxModal> nofiticationItems;

  const NotificationBoxColumnLayout({
    super.key,
    required this.nofiticationItems,
    required this.isSelectView,
  });

  @override
  State<NotificationBoxColumnLayout> createState() =>
      _NofiticationBoxColumnLayoutState();
}

class _NofiticationBoxColumnLayoutState
    extends State<NotificationBoxColumnLayout> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            if (widget.isSelectView)
              Checkbox(
                activeColor: ColorConstant.instance.primary_main,
                value: widget.nofiticationItems[index].isSelected,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            Expanded(child: widget.nofiticationItems[index]),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return context.emptySizedHeightBoxNormal;
      },
      itemCount: widget.nofiticationItems.length,
    );
  }
}
