import 'package:dio/dio.dart';
import 'package:example/models/review_model/review_model.dart';

import 'package:example/services/api/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReviewRespository {
  Dio dio;
  ApiService apiService;
  final String? authToken = dotenv.env['SUPABASE_KEY'];

  ReviewRespository()
      : dio = Dio(),
        apiService = ApiService(Dio());

  Future<void> postReview(Review review) async {
    try {
      await apiService.postReview(
          apikey: authToken,
          authToken: 'Bearer $authToken',
          reviewModel: review.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
