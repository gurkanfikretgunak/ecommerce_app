import 'package:example/core/gen/assets.gen.dart';
import 'package:example/core/cubits/notification/notification_cubit.dart';
import 'package:example/core/cubits/notification/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/app/l10n/app_l10n.dart';

@RoutePage()
class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();

    context.read<NotificationCubit>().getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            onPressed: () {
              Navigator.pop(context);
            },
            text: L10n.of(context)!.notification,
            iconColor: ColorConstant.instance.neutral1,
          )),
      body: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          bool isEmpty = false;
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressAnimation());
          } else if (state is NotificationLoaded) {
            isEmpty = state.notifications.isEmpty;
            if (isEmpty) {
              return Center(
                child: HeadText(
                  text: L10n.of(context)!.notificationIsEmpty,
                  color: ColorConstant.instance.neutral1,
                ),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    NotificationBoxColumnLayout(
                      notificationItems: state.notifications.map((item) {
                        return NotificationBoxModal(
                          text: item.content,
                          timeText: DateFormat('yyyy-MM-dd')
                              .format(DateTime.parse(item.date)),
                          iconPath: Assets.icons.cart.path,
                          isSeen: false,
                          isSelected: false,
                        );
                      }).toList(),
                    ),
                    context.emptySizedHeightBoxNormal,
                  ],
                ),
              ),
            );
          } else if (state is NotificationError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
