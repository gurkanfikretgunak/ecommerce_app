import 'dart:io';

import 'package:dio/dio.dart';
import 'package:example/core/network/models/user_model/user_model.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:example/core/network/services/api/functions_api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepository {
  Dio dio;
  ApiService apiService;
  FunctionsApiService functionsApiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  UserRepository()
      : dio = Dio(),
        apiService = ApiService(Dio()),
        functionsApiService = FunctionsApiService(Dio());

  Future<void> postUser(User user) async {
    try {
      await apiService.postUser(
          apikey: authToken, authToken: 'Bearer $authToken', usermodel: user);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser(String uuid) async {
    try {
      final response = await apiService.getUser(
          apikey: authToken, authToken: 'Bearer $authToken', uuid: 'eq.$uuid');

      if (response.isNotEmpty) {
        return response.first;
      } else {
        throw Exception('User not found');
      }
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

  Future<bool> uploadProfilePhoto(String userId, File file) async {
    try {
      final response = await functionsApiService.uploadProfilePhoto(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        file: file,
        userId: userId,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
