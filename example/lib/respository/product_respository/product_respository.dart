import 'package:dio/dio.dart';
import 'package:example/models/product_model/product_model.dart';
import 'package:example/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductRespository {
  Dio dio;
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  ProductRespository()
      : dio = Dio(),
        apiService = ApiService(Dio());

  Future<List<Product>> getProducts() async {
    try {
      final response = await apiService.getProducts(
        apikey: authToken,
        authToken: 'Bearer $authToken',
      );

      if (response.isNotEmpty) {
        return response;
      } else {
        throw Exception('Products not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
