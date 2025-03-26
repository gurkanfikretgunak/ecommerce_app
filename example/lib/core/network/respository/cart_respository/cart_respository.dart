import 'package:dio/dio.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/respository/product_respository/product_respository.dart';
import 'package:example/core/network/services/api/api_service.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
        for (Cart item in response) {
          final productResponse =
              await ProductRespository().getProducts(id: item.userId);
          item.product = productResponse.first;
        }

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

  Future<void> deleteCart(String id) async {
    try {
      await apiService.deleteCart(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        id: 'eq.$id',
      );
    } catch (e) {
      rethrow;
    }
  }
}
