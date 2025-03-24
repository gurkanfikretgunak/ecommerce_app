import 'package:dio/dio.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/models/categorie_model/categorie_model.dart';
import 'package:example/core/network/models/product_detail_model/product_detail_model.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:example/core/network/models/user_model/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://oqltumpjgdudytkfaoio.supabase.co/rest/v1/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('categories')
  Future<List<Categorie>> getCategories({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Query('order') String order = "id.asc",
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
    @Query('tags') String? tags,
    @Query('categorie_id') String? categorie_id,
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

  @POST('cart')
  Future<void> postCart({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Body() required Map<String, dynamic> cartModel,
  });

  @GET('cart')
  Future<List<Cart>> getCart({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('user_id') String? user_id,
    @Query('select') String select = '*',
  });

  @PATCH('cart')
  Future<void> patchCart({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
    @Query('select') String select = "*",
    @Body() required Map<String, dynamic> body,
  });

  @DELETE('cart')
  Future<void> deleteCart({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
    @Query('select') String select = "*",
  });
}
