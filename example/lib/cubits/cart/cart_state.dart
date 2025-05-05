import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/cart_model/cart_model.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> cart;

  CartLoaded({required this.cart});

  @override
  List<Object?> get props => [cart];
}

class CartSucces extends CartState {
  final String message;

  CartSucces(this.message);

  @override
  List<Object?> get props => [message];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object?> get props => [message];
}
