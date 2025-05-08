import 'package:example/core/network/models/filter_model/filter_model.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SearchRepository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  SearchRepository() : apiService = ApiService(Dio());

  Future<List<Product>> getSearchProducts(Filter filter) async {
    try {
      final response = await apiService.getSearchProducts(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          body: filter.toJson());

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
