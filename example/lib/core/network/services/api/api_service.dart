import 'package:dio/dio.dart';
import 'package:example/core/network/models/billing_detail_model/billing_detail_model.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/models/categorie_model/categorie_model.dart';
import 'package:example/core/network/models/payment_method_model/payment_method_model.dart';
import 'package:example/core/network/models/product_detail_model/product_detail_model.dart';
import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:example/core/network/models/user_model/user_model.dart';
import 'package:example/core/network/models/wishlist_model/wishlist_model.dart';
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
    @Query('id') String? id,
    @Query('select') String select = '*',
  });

  @GET('product')
  Future<List<Product>> getProductsById({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
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

  @POST('rpc/get_cart_total')
  Future<double> getCartTotal({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Body() required Map<String, dynamic> body,
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
    @Query('user_id') String? user_id,
    @Query('id') String? id,
    @Query('select') String select = "*",
  });

  @POST('rpc/insert_order')
  Future<bool> postOrder({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Body() required Map<String, dynamic> request,
  });

  @GET('billing_details')
  Future<List<BillingDetail>> getBillingDetail({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('user_id') String? user_id,
    @Query('is_default') String? isdefault,
    @Query('select') String select = '*',
  });

  @POST('billing_details')
  Future<void> postBillingDetail({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Body() required Map<String, dynamic> body,
  });

  @PATCH("billing_details")
  Future<void> patchBillingDetail({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
    @Query('select') String select = "*",
    @Body() required Map<String, dynamic> body,
  });
  @DELETE("billing_details")
  Future<void> deleteBillingDetail({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
    @Query('select') String select = "*",
  });

  @GET('payment_method')
  Future<List<PaymentMethod>> getPaymentMethod({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('is_default') String? is_default,
    @Query('user_id') String? user_id,
    @Query('select') String select = '*',
  });
  @POST('payment_method')
  Future<List<PaymentMethod>> postPaymentMethod({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Body() required Map<String, dynamic> body,
  });
  @PATCH('payment_method')
  Future<void> patchPaymentMethod({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
    @Query('select') String select = '*',
    @Body() required Map<String, dynamic> body,
  });
  @DELETE('payment_method')
  Future<void> deletePaymentMethod({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('id') String? id,
    @Query('select') String select = '*',
  });

  @GET("wishlist")
  Future<List<Wishlist>> getWishlist({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('user_id') String? user_id,
    @Query('select') String select = '*',
  });

  @POST("rpc/is_product_in_wishlist")
  Future<bool> isProductInWishlist({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Body() required Map<String, dynamic> body,
  });

  @POST("wishlist")
  Future<void> postWishlist({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('select') String select = '*',
    @Body() required Map<String, dynamic> body,
  });

  @DELETE("wishlist")
  Future<void> deleteWishlist({
    @Header('apikey') String? apikey,
    @Header('Authorization') String? authToken,
    @Query('product_id') String? product_id,
    @Query('select') String select = '*',
  });
}
