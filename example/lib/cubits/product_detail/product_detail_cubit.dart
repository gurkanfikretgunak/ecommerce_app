import 'package:bloc/bloc.dart';
import 'package:example/cubits/product_detail/product_detail_state.dart';
import 'package:example/respository/product_detail_respository/product_detail_respository.dart';
import 'package:flutter/material.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailLoading());

  Future<void> getProductDetail(int id) async {
    try {
      emit(ProductDetailLoading());

      final productDetail =
          await ProductDetailRespository().getProductDetail(id);

      emit(ProductDetailLoaded(
        productDetail: productDetail,
        selectedColor: Color(int.parse("0xFF${productDetail.colors[0]}")),
      ));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }

  void changeSelectedColor(Color color) {
    if (state is ProductDetailLoaded) {
      final loadedState = state as ProductDetailLoaded;
      emit(loadedState.copyWith(selectedColor: color));
    }
  }
}
