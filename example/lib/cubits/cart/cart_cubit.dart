import 'package:bloc/bloc.dart';
import 'package:example/cubits/cart/cart_state.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/respository/cart_respository/cart_respository.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> postCart(Cart cart) async {
    emit(CartInitial());
    try {
      await CartRespository().postCart(cart);
      emit(CartSucces("Cart posted successfully!"));
    } catch (e) {
      emit(CartError("Failed to post cart:${e.toString()}"));
    }
  }

  Future<void> getCart(String userId) async {
    emit(CartLoading());
    try {
      final cart = await CartRespository().getCart(userId);
      emit(CartLoaded(cart: cart));
    } catch (e) {
      emit(CartError("Failed to get cart:${e.toString()}"));
    }
  }
}
