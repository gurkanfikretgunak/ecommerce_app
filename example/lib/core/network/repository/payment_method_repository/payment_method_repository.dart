import 'package:dio/dio.dart';
import 'package:example/core/network/models/payment_method_model/payment_method_model.dart';

import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentMethodRepository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  PaymentMethodRepository() : apiService = ApiService(Dio());

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

      return response;
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

  Future<void> patchPaymentMethod(int id) async {
    try {
      await apiService.patchPaymentMethod(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          id: 'eq.$id',
          body: {'is_default': true});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePaymentMethod(int id) async {
    try {
      await apiService.deletePaymentMethod(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        id: 'eq.$id',
      );
    } catch (e) {
      rethrow;
    }
  }
}
