import 'package:example/models/categorie_model/categorie_model.dart';
import 'package:example/models/product_detail_model/product_detail_model.dart';
import 'package:example/models/product_model/product_model.dart';
import 'package:example/models/review_model/review_model.dart';
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
  @GET('users')
  Future<List<User>> getUser({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Query('id') String? uuid,
  });

  @GET('product')
  Future<List<Product>> getProducts({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('titles') String? titles,
    @Query('select') String select = '*',
  });

  @GET('product_detail')
  Future<List<ProductDetail>> getProductDetail({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
    @Query('select') String select = '*',
  });

  @POST('reviews')
  Future<void> postReview({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Body() required Map<String, dynamic> reviewModel,
  });
}
