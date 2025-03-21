import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {}

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
