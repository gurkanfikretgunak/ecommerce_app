import 'package:dio/dio.dart';
import 'package:example/core/network/models/order_detail_model/order_detail_model.dart';
import 'package:example/core/network/models/order_model/order_model.dart';
import 'package:example/core/network/repository/order_detail_repository/order_detail_repository.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OrderRepository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  OrderRepository() : apiService = ApiService(Dio());

  Future<List<Order>> getOrder(String userId) async {
    try {
      final response = await apiService.getOrders(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        user_id: 'eq.$userId',
      );
      if (response.isNotEmpty) {
        for (Order item in response) {
          final orderDetailResponse =
              await OrderDetailRepository().getOrderDetail(item.id.toString());
          item.orderDetail = orderDetailResponse.first;
          item.orderDetails = orderDetailResponse;
        }
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> postOrder(Order order, List<OrderDetail> orderDetail) async {
    try {
      final response = await apiService.postOrder(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          request: {
            ...order.toJson(),
            "order_items": orderDetail.map((item) => item.toJson()).toList(),
          });

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
