import 'package:equatable/equatable.dart';
import 'package:example/models/product_detail_model/product_detail_model.dart';
import 'package:flutter/material.dart';

abstract class ProductDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDetail productDetail;
  final Color selectedColor;

  ProductDetailLoaded(
      {required this.selectedColor, required this.productDetail});

  @override
  List<Object?> get props => [productDetail, selectedColor];

  ProductDetailLoaded copyWith({
    ProductDetail? productDetail,
    Color? selectedColor,
  }) {
    return ProductDetailLoaded(
      productDetail: productDetail ?? this.productDetail,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}

class ProductDetailError extends ProductDetailState {
  final String message;
  ProductDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
