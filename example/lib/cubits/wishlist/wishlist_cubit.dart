import 'package:bloc/bloc.dart';
import 'package:example/core/network/respository/wishlist_respository/wishlist_respository.dart';
import 'package:example/cubits/wishlist/wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  Future<void> isProductInWishlist(int productId, String userId) async {
    try {
      final response =
          await WishlistRespository().isProductInWishlist(productId, userId);
      if (response) {
        emit(WishlistSuccess("Product is in wishlist"));
      } else {
        emit(WishlistError("Product is not in wishlist"));
      }
    } catch (e) {
      emit(WishlistError("Failed to check wishlist: ${e.toString()}"));
    }
  }
}
