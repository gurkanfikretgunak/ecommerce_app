import 'package:dio/dio.dart';
import 'package:example/core/network/models/order_detail_model/order_detail_model.dart';
import 'package:example/core/network/models/order_model/order_model.dart';
import 'package:example/core/network/respository/order_detail_respository/order_detail_respository.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OrderRespository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  OrderRespository() : apiService = ApiService(Dio());

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
              await OrderDetailRespository().getOrderDetail(item.id.toString());
          item.orderDetail = orderDetailResponse.first;
        }
        return response;
      } else {
        throw Exception('Order not found');
      }
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
