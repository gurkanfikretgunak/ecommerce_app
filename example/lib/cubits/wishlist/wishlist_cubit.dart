import 'package:bloc/bloc.dart';
import 'package:example/core/network/models/wishlist_model/wishlist_model.dart';
import 'package:example/core/network/respository/wishlist_respository/wishlist_respository.dart';
import 'package:example/cubits/wishlist/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  void getWishlist(String userId) async {
    try {
      emit(WishlistLoading());
      final response = await WishlistRespository().getWishlist(userId);
      emit(WishlistLoaded(response));
    } catch (e) {
      emit(WishlistError("Failed to load wishlist: ${e.toString()}"));
    }
  }

  Future<void> isProductInWishlist(int productId, String userId) async {
    try {
      final response =
          await WishlistRespository().isProductInWishlist(productId, userId);
      emit(WishlistIsFavorite(response));
    } catch (e) {
      emit(WishlistError("Failed to check wishlist: ${e.toString()}"));
    }
  }

  Future<void> postWishlist(Wishlist wishlist) async {
    try {
      emit(WishlistLoading());
      await WishlistRespository().postWishlist(wishlist);
      emit(WishlistChangeFavorite(true));
    } catch (e) {
      emit(WishlistError("Failed to add to wishlist: ${e.toString()}"));
    }
  }

  Future<void> deleteWishlist(int id) async {
    try {
      emit(WishlistLoading());
      await WishlistRespository().deleteWishlist(id);
      emit(WishlistChangeFavorite(false));
    } catch (e) {
      emit(WishlistError("Failed to remove from wishlist: ${e.toString()}"));
    }
  }
}
