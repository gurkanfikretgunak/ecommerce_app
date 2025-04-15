import 'package:dio/dio.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WishlistRespository {
  Dio dio;
  ApiService apiService;
  final String? authToken = dotenv.env['SUPABASE_KEY'];

  WishlistRespository()
      : dio = Dio(),
        apiService = ApiService(Dio());

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
}
