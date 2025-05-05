import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'functions_api_service.g.dart';

@RestApi(baseUrl: 'https://oqltumpjgdudytkfaoio.supabase.co/functions/v1/')
abstract class FunctionsApiService {
  factory FunctionsApiService(Dio dio) = _FunctionsApiService;
}
