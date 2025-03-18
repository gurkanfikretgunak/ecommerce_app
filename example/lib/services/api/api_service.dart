import 'package:example/models/categorie_model/categorie_model.dart';
import 'package:example/models/user_model/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://oqltumpjgdudytkfaoio.supabase.co/rest/v1/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('categories')
  Future<List<Categorie>> getCategories({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
  });
  @POST('users')
  Future<void> postUser({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Body() required User usermodel,
  });
}
