import 'package:dio/dio.dart';
import 'package:example/core/network/models/notification_model/notification_model.dart';
import 'package:example/core/network/services/api/functions_api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NotifcationRespository {
  FunctionsApiService functionsApiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  NotifcationRespository() : functionsApiService = FunctionsApiService(Dio());

  Future<List<Notification>> getNotifications() async {
    try {
      final response = await functionsApiService.getNotifications(
          apikey: authToken, authToken: 'Bearer $authToken');
      if (response.isNotEmpty) {
        return response;
      } else {
        throw Exception('Notifications not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
