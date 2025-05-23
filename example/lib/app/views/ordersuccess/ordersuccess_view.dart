import 'package:example/core/gen/assets.gen.dart';
import 'package:example/core/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/core/cubits/orderwishlist/orderwishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/app/l10n/app_l10n.dart';

class OrderSuccessView extends StatelessWidget {
  const OrderSuccessView({
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
              context.read<OrderwishlistCubit>().showOrder(true);
              context.read<BottomNavigationCubit>().setPage(1);
            },
            onSecondaryButtonPressed: () {
              context.read<BottomNavigationCubit>().setPage(0);
            },
            title: L10n.of(context)!.orderSuccess,
            primaryButtonText: L10n.of(context)!.myOrders,
            secondaryButtonText: L10n.of(context)!.continueShopping,
            iconPath: Assets.icons.truck.path,
            succesiconPath: Assets.icons.success.path,
            radiusColor: ColorConstant.instance.green2,
            description: L10n.of(context)!.orderSuccessDescription,
          ),
        ],
      ),
    );
  }
}
