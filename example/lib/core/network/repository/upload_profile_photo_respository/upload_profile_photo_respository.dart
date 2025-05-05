import 'package:example/core/network/services/api/functions_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UploadProfilePhotoRespository {
  Dio dio;
  FunctionsApiService functionsApiService;
  final String? authToken = dotenv.env['SUPABASE_KEY'];
  UploadProfilePhotoRespository()
      : dio = Dio(),
        functionsApiService = FunctionsApiService(Dio());
}
