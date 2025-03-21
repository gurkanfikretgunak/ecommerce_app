import 'package:bloc/bloc.dart';
import 'package:example/cubits/product_detail/product_detail_state.dart';
import 'package:example/core/network/respository/product_detail_respository/product_detail_respository.dart';
import 'package:example/core/network/respository/product_respository/product_respository.dart';
import 'package:flutter/material.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailLoading());

  Future<void> getProductDetail(int id) async {
    try {
      emit(ProductDetailLoading());

      final productDetail =
          await ProductDetailRespository().getProductDetail(id);

      final relatedProduct =
          await ProductRespository().getProducts(title: "related product");

      emit(
        ProductDetailLoaded(
          productDetail: productDetail,
          selectedColor: Color(int.parse("0xFF${productDetail.colors[0]}")),
          selectedSize: productDetail.sizes[0],
          selectedRate: 0,
          relatedProducts: relatedProduct,
        ),
      );
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

  void changeSelectedSize(String size) {
    if (state is ProductDetailLoaded) {
      final loadedState = state as ProductDetailLoaded;
      emit(loadedState.copyWith(selectedSize: size));
    }
  }

  void changeSelectedRate(int rate) {
    if (state is ProductDetailLoaded) {
      final loadedState = state as ProductDetailLoaded;
      emit(loadedState.copyWith(selectedRate: rate));
    }
  }
}
