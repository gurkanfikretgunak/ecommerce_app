import 'package:bloc/bloc.dart';

class OrderwishlistCubit extends Cubit<bool> {
  OrderwishlistCubit() : super(false);

  void showOrder(bool state) {
    emit(state);
  }
}
