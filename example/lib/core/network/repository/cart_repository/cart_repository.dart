import 'package:dio/dio.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/repository/product_repository/product_repository.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CartRepository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  CartRepository() : apiService = ApiService(Dio());

  Future<List<Cart>> getCart(String userId) async {
    try {
      final response = await apiService.getCart(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          user_id: 'eq.$userId');

      if (response.isNotEmpty) {
        for (Cart item in response) {
          final productResponse = await ProductRepository()
              .getProductsById(id: '${item.productId}');
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

  Future<double> getCartTotal(String userId) async {
    try {
      final response = await apiService.getCartTotal(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          body: {
            "p_user_id": userId,
          });

      if (response != null) {
        return response;
      } else {
        throw Exception('Cart total not found');
      }
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

  Future<void> deleteAllCart(String userId) async {
    try {
      await apiService.deleteCart(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        user_id: 'eq.$userId',
      );
    } catch (e) {
      rethrow;
    }
  }
}
