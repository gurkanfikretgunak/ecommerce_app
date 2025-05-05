import 'package:example/core/network/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {}

class ProductChanged extends ProductState {
  final Product product;

  ProductChanged({
    required this.product,
  });

  @override
  List<Object?> get props => [product];

  ProductChanged copyWith({
    Product? product,
  }) {
    return ProductChanged(product: product ?? this.product);
  }
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
