import 'dart:io';

import 'package:dio/dio.dart';
import 'package:example/core/network/models/notification_model/notification_model.dart';
import 'package:retrofit/retrofit.dart';

part 'functions_api_service.g.dart';

@RestApi(baseUrl: 'https://oqltumpjgdudytkfaoio.supabase.co/functions/v1/')
abstract class FunctionsApiService {
  factory FunctionsApiService(Dio dio) = _FunctionsApiService;

  @POST('upload-profile-photo')
  Future<bool> uploadProfilePhoto({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Part(name: 'userId') required String userId,
    @Part(name: 'file') required File file,
  });

  @POST('getNotifications')
  Future<List<Notification>> getNotifications({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
  });
}
