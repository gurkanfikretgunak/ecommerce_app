import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:example/core/network/models/order_detail_model/order_detail_model.dart';

class OrderDetailRespository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  OrderDetailRespository() : apiService = ApiService(Dio());

  Future<List<OrderDetail>> getOrderDetail(String orderId) async {
    try {
      final response = await apiService.getOrderDetail(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        order_id: 'eq.$orderId',
      );
      if (response.isNotEmpty) {
        return response;
      } else {
        throw Exception('Order details not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
