import 'package:dio/dio.dart';
import 'package:example/core/network/models/notification_model/notification_model.dart';
import 'package:example/core/network/services/api/functions_api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NotifcationRepository {
  FunctionsApiService functionsApiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  NotifcationRepository() : functionsApiService = FunctionsApiService(Dio());

  Future<List<Notification>> getNotifications() async {
    try {
      final response = await functionsApiService.getNotifications(
          apikey: authToken, authToken: 'Bearer $authToken');

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
