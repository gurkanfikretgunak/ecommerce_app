import 'package:dio/dio.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:example/core/network/models/wishlist_model/wishlist_model.dart';
import 'package:example/core/network/repository/product_respository/product_respository.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WishlistRespository {
  Dio dio;
  ApiService apiService;
  final String? authToken = dotenv.env['SUPABASE_KEY'];

  WishlistRespository()
      : dio = Dio(),
        apiService = ApiService(Dio());

  Future<List<Wishlist>> getWishlist(String userId) async {
    try {
      final response = await apiService.getWishlist(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        user_id: 'eq.$userId',
      );
      if (response.isNotEmpty) {
        for (Wishlist item in response) {
          final product = await ProductRespository()
              .getProductsById(id: '${item.product_id}');
          item.product = product.first;
        }
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isProductInWishlist(int productId, String userId) async {
    try {
      final response = await apiService.isProductInWishlist(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        body: {
          "p_user_id": userId,
          "p_product_id": productId,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postWishlist(Wishlist wishlist) async {
    try {
      await apiService.postWishlist(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          body: wishlist.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteWishlist(int id) async {
    try {
      await apiService.deleteWishlist(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        product_id: "eq.$id",
      );
    } catch (e) {
      rethrow;
    }
  }
}
