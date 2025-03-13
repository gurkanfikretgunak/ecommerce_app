import 'package:dio/dio.dart';
import 'package:example/models/categorie_model/categorie_model.dart';
import 'package:example/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CategorieRespository {
  Future<List<Categorie>> getCategories() async {
    final Dio dio = Dio();
    final apiService = ApiService(dio);
    final authToken = dotenv.env['SUPABASE_KEY'];
    print(authToken);
    try {
      final response = await apiService.getCategories(
          apikey: authToken, authToken: 'Bearer $authToken');
      return response;
    } catch (e) {
      print("API Request failed: $e");
      rethrow;
    }
  }
}
