import 'package:dio/dio.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ProductRespository {
  Dio dio;
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  ProductRespository()
      : dio = Dio(),
        apiService = ApiService(Dio());

  Future<List<Product>> getProducts(
      {String? title, String? categorieId, String? tag, String? id}) async {
    try {
      String? titlesQuery;
      String? tagsQuery;
      String? categoryIdQuery;
      String? id;

      if (title != null) {
        titlesQuery = 'cs.["$title"]';
      }
      if (tag != null) {
        tagsQuery = 'cs.["$tag"]';
      }
      if (categorieId != null) {
        categoryIdQuery = 'eq.$categorieId';
      }
      if (id != null) {
        categoryIdQuery = 'eq.$id';
      }
      final response = await apiService.getProducts(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        titles: titlesQuery,
        tags: tagsQuery,
        categorie_id: categoryIdQuery,
        id: id,
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
