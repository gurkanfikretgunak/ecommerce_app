import 'package:example/cubits/order/order_cubit.dart';
import 'package:example/cubits/order/order_state.dart';
import 'package:example/cubits/wishlist/wishlist_cubit.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/l10n/app_l10n.dart';

class Order extends StatefulWidget {
  const Order({
    super.key,
  });

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authState = context.read<AuthCubit>().state;
    if (authState is AuthAuthenticated) {
      final userId = authState.user.id;
      context.read<WishlistCubit>().getWishlist(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        if (authState is AuthAuthenticated) {
          final userId = authState.user.id;
          context.read<OrderCubit>().getOrder(userId);
        }
        return BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return const Center(child: CircularProgressAnimation());
            } else if (state is OrderLoaded) {
              bool isOrdersEmpty = state.orders.isEmpty;

              if (isOrdersEmpty) {
                return SizedBox(
                    height: 100,
                    child: Center(
                        child: HeadText(
                      text: L10n.of(context)!.ordersEmpty,
                      color: ColorConstant.instance.neutral1,
                    )));
              }

              return MyorderListLayout(
                rightItem: state.orders
                    .map((item) => OrderDetailBoxLabel(
                          quantity: item.orderDetail!.quantity!,
                          date: DateFormat('yyyy-MM-dd')
                              .format(DateTime.parse(item.created_at!)),
                          status: item.status!,
                        ))
                    .toList(),
                items: state.orders
                    .map((item) => ProductBoxModal(
                          name: item.orderDetail!.name!,
                          imagePath: item.orderDetail!.image!,
                          price: item.orderDetail!.unit_price!,
                          size: item.orderDetail!.size!,
                        ))
                    .toList(),
              );
            } else if (state is OrderError) {
              return SizedBox(
                  height: 100,
                  child: Center(
                      child: HeadText(
                    text: state.message,
                    color: ColorConstant.instance.neutral1,
                  )));
            } else {
              return SizedBox(
                  height: 100,
                  child: Center(
                      child: HeadText(
                    text: L10n.of(context)!.orderFailed,
                    color: ColorConstant.instance.neutral1,
                  )));
            }
          },
        );
      },
    );
  }
}
