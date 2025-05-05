import 'package:bloc/bloc.dart';
import 'package:example/core/network/repository/product_respository/product_respository.dart';
import 'package:example/cubits/product/product_state.dart';
import 'package:example/core/network/models/product_model/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading());

  void changeProduct(Product product) {
    emit(ProductLoading());
    emit(ProductChanged(product: product));
  }
}
