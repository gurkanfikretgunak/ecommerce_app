import 'package:dio/dio.dart';
import 'package:example/core/network/models/product_detail_model/product_detail_model.dart';
import 'package:example/core/network/models/review_model/review_model.dart';
import 'package:example/core/network/repository/user_respository/user_respository.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductDetailRespository {
  Dio dio;
  ApiService apiService;
  final String? authToken = dotenv.env['SUPABASE_KEY'];

  ProductDetailRespository()
      : dio = Dio(),
        apiService = ApiService(Dio());

  Future<ProductDetail> getProductDetail(int id) async {
    try {
      final response = await apiService.getProductDetail(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        id: 'eq.$id',
        select: "*,reviews(*)",
      );

      if (response.isNotEmpty) {
        final productDetail = response.first;

        if (productDetail.reviews != null) {
          for (Review item in productDetail.reviews!) {
            if (item.userId != null) {
              final userResponse =
                  await UserRespository().getUser(item.userId!);
              if (userResponse != null) {
                item.user = userResponse;
              }
            }
          }
        }

        return productDetail;
      } else {
        throw Exception('Product not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
