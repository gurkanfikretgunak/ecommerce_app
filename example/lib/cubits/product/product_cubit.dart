import 'package:bloc/bloc.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:example/models/product_model/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  void changeProduct(Product product) {
    emit(ProductLoading());
    if (product != null) {
      emit(ProductLoaded(product: product));
    } else {
      emit(ProductError("something is wrong"));
    }
  }
}
