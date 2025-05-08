import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:example/core/network/models/order_detail_model/order_detail_model.dart';
import 'package:example/core/network/models/order_model/order_model.dart';
import 'package:example/core/network/repository/order_repository/order_repository.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:example/cubits/order/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  Future<void> getOrder(String userId) async {
    try {
      emit(OrderLoading());
      final response = await OrderRepository().getOrder(userId);
      emit(OrderLoaded(response));
    } catch (e) {
      emit(OrderError("${e.toString()}"));
    }
  }

  Future<void> postOrder(Order order, List<OrderDetail> orderDetails) async {
    emit(OrderInitial());
    try {
      final response = await OrderRepository().postOrder(order, orderDetails);
      if (response) {
        emit(OrderSucces("Order posted successfully!"));
      } else {
        emit(OrderError("Failed to post order"));
      }
    } catch (e) {
      emit(OrderError("Failed to post order:${e.toString()}"));
    }
  }
}
