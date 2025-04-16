import 'package:example/cubits/order/order_cubit.dart';
import 'package:example/cubits/order/order_state.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Order extends StatefulWidget {
  final List<ProductBoxModal> items;
  const Order({super.key, required this.items});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  void initState() {
    super.initState();
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
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrderLoaded) {
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
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("Unknown state"));
            }
          },
        );
      },
    );
  }
}
