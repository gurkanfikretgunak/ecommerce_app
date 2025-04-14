import 'package:dio/dio.dart';
import 'package:example/core/network/models/payment_method_model/payment_method_model.dart';

import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentMethodRespository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  PaymentMethodRespository() : apiService = ApiService(Dio());

  Future<List<PaymentMethod>> getPaymentMethod(
      {required String userId, bool? isDefault}) async {
    try {
      String? isDefaultquery;

      if (isDefault != null) {
        isDefaultquery = 'eq.$isDefault';
      }

      final response = await apiService.getPaymentMethod(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        is_default: isDefaultquery,
        user_id: 'eq.$userId',
      );

      if (response.isNotEmpty) {
        return response;
      } else {
        throw Exception('Payment Method not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postPaymentMethod(PaymentMethod paymentMethod) async {
    try {
      await apiService.postPaymentMethod(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        body: paymentMethod.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
