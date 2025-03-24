import 'package:dio/dio.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/services/api/api_service.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class CartRespository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  CartRespository() : apiService = ApiService(Dio());

  Future<List<Cart>> getCart(String userId) async {
    try {
      final response = await apiService.getCart(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          user_id: 'eq.$userId');

      if (response.isNotEmpty) {
        return response;
      } else {
        throw Exception('Products not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postCart(Cart cart) async {
    try {
      await apiService.postCart(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        cartModel: cart.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> patchCart(String id, int quantity) async {
    try {
      await apiService.patchCart(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          id: 'eq.$id',
          body: {"quantity": quantity});
    } catch (e) {
      rethrow;
    }
  }
}
