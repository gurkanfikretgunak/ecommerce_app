import 'package:equatable/equatable.dart';
import 'package:example/models/product_detail_model/product_detail_model.dart';
import 'package:example/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

abstract class ProductDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDetail productDetail;
  final Color selectedColor;
  final String? selectedSize;
  final int? selectedRate;
  final List<Product>? relatedProducts;

  ProductDetailLoaded(
      {this.relatedProducts,
      this.selectedRate,
      this.selectedSize,
      required this.selectedColor,
      required this.productDetail});

  @override
  List<Object?> get props =>
      [productDetail, selectedColor, selectedSize, selectedRate];

  ProductDetailLoaded copyWith(
      {ProductDetail? productDetail,
      Color? selectedColor,
      String? selectedSize,
      int? selectedRate,
      List<Product>? relatedProducts}) {
    return ProductDetailLoaded(
      productDetail: productDetail ?? this.productDetail,
      selectedColor: selectedColor ?? this.selectedColor,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedRate: selectedRate ?? this.selectedRate,
      relatedProducts: relatedProducts ?? this.relatedProducts,
    );
  }
}

class ProductDetailError extends ProductDetailState {
  final String message;
  ProductDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
