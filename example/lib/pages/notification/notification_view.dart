import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late bool isSelectView;

  @override
  void initState() {
    super.initState();
    isSelectView = false;
  }

  final List<NofiticationBoxModal> nofiticationItems = [
    NofiticationBoxModal(
        iconPath: Assets.icons.cart.path,
        isSeen: false,
        isSelected: false,
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        timeText: "2 Day Ago"),
    NofiticationBoxModal(
        iconPath: Assets.icons.cart.path,
        isSeen: false,
        isSelected: false,
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        timeText: "3 Day Ago"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            onPressed: () {
              Navigator.pop(context);
            },
            text: "notification",
            iconColor: ColorConstant.instance.neutral1,
            actions: [
              if (isSelectView)
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.done_all)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isSelectView = !isSelectView;
                    });
                  },
                  icon: const Icon(Icons.more_horiz))
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              NotificationBoxColumnLayout(
                  isSelectView: isSelectView,
                  nofiticationItems: nofiticationItems),
              if (isSelectView)
                Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      onPressed: () {},
                      height: 50,
                      text: "Mark As Read",
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
