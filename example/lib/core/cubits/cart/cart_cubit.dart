import 'package:bloc/bloc.dart';
import 'package:example/core/cubits/cart/cart_state.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';
import 'package:example/core/network/repository/cart_repository/cart_repository.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> postCart(Cart cart) async {
    emit(CartInitial());
    try {
      await CartRepository().postCart(cart);
      emit(CartSucces("Cart posted successfully!"));
    } catch (e) {
      emit(CartError("Failed to post cart:${e.toString()}"));
    }
  }

  Future<void> getCart(String userId) async {
    emit(CartLoading());
    try {
      final cart = await CartRepository().getCart(userId);
      emit(CartLoaded(cart: cart));
    } catch (e) {
      emit(CartError("Failed to get cart:${e.toString()}"));
    }
  }

  Future<double?> getCartTotal(String userId) async {
    try {
      final total = await CartRepository().getCartTotal(userId);
      if (total != null) {
        return total;
      } else {
        emit(CartError("Failed to get cart total"));
      }
    } catch (e) {
      emit(CartError("Failed to get cart total:${e.toString()}"));
    }
  }

  void updateQuantity(int index, int newQuantity) async {
    if (state is CartLoaded) {
      final cart = (state as CartLoaded).cart;
      final id = cart[index].id;
      try {
        if (newQuantity < 1) {
          await CartRepository().deleteCart('$id');
          emit(CartLoading());
        }
        cart[index].quantity = newQuantity;
        await CartRepository().patchCart('$id', newQuantity);
      } catch (e) {
        emit(CartError("Failed to patch cart:${e.toString()}"));
      }
      emit(CartLoaded(cart: List.from(cart)));
    }
  }

  void clearCart(String userId) async {
    if (state is CartLoaded) {
      await CartRepository().deleteAllCart('$userId');
      emit(CartLoading());
    }
  }
}
