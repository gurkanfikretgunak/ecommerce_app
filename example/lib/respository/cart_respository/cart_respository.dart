import 'package:dio/dio.dart';
import 'package:example/models/cart_model/cart_model.dart';
import 'package:example/services/api/api_service.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class CartRespository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  CartRespository() : apiService = ApiService(Dio());

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
}
