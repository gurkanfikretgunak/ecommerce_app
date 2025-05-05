import 'package:dio/dio.dart';
import 'package:example/core/network/models/billing_detail_model/billing_detail_model.dart';
import 'package:example/core/network/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BillingDetailRespository {
  ApiService apiService;
  final authToken = dotenv.env['SUPABASE_KEY'];
  BillingDetailRespository() : apiService = ApiService(Dio());

  Future<List<BillingDetail>> getBillingDetail(
      {required String userId, bool? isDefault}) async {
    try {
      String? isDefaultquery;

      if (isDefault != null) {
        isDefaultquery = 'eq.$isDefault';
      }

      final response = await apiService.getBillingDetail(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        user_id: 'eq.$userId',
        isdefault: isDefaultquery,
      );

      if (response.isNotEmpty) {
        return response;
      } else {
        throw Exception('Billing Detail not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postBillingDetail(BillingDetail billingDetail) async {
    try {
      final response = await apiService.postBillingDetail(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        body: billingDetail.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> patchBillingDetail(int id) async {
    try {
      await apiService.patchBillingDetail(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        id: 'eq.$id',
        body: {'is_default': true},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteBillingDetail(int id) async {
    try {
      await apiService.deleteBillingDetail(
        apikey: authToken,
        authToken: 'Bearer $authToken',
        id: 'eq.$id',
      );
    } catch (e) {
      rethrow;
    }
  }
}
