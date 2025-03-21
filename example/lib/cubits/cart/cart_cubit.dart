import 'package:bloc/bloc.dart';
import 'package:example/cubits/cart/cart_state.dart';
import 'package:example/models/cart_model/cart_model.dart';
import 'package:example/respository/cart_respository/cart_respository.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> postCart(Cart cart) async {
    emit(CartInitial());
    try {
      await CartRespository().postCart(cart);
      emit(CartSucces("Cart posted successfully!"));
    } catch (e) {
      emit(CartError("Failed to posrt cart:${e.toString()}"));
    }
  }
}
