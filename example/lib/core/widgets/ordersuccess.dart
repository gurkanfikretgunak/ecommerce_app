import 'package:example/core/gen/assets.gen.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          OrderSuccessLabel(
              onPrimaryButtonPressed: () {
                context.read<BottomNavigationCubit>().setPage(1);
              },
              onSecondaryButtonPressed: () {
                context.read<BottomNavigationCubit>().setPage(0);
              },
              title: "ORDER SUCCESS",
              primaryButtonText: "MY ORDERS",
              secondaryButtonText: "CONTINUE SHOPPING",
              iconPath: Assets.icons.truck.path,
              succesiconPath: Assets.icons.success.path,
              radiusColor: ColorConstant.instance.green2,
              description:
                  "Dolor magna eget est lorem ipsum dolor sit amet consectetur."),
        ],
      ),
    );
  }
}
