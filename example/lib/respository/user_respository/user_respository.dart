import 'package:dio/dio.dart';
import 'package:example/models/user_model/user_model.dart';
import 'package:example/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRespository {
  Dio dio;
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  UserRespository()
      : dio = Dio(),
        apiService = ApiService(Dio());

  Future<void> postUser(User user) async {
    try {
      await apiService.postUser(
          apikey: authToken, authToken: 'Bearer $authToken', usermodel: user);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isUUIDExist(String uuid) async {
    try {
      final response = await apiService.getUser(
          apikey: authToken, authToken: 'Bearer $authToken', uuid: 'eq.$uuid');

      return response.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }
}
