import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/order_model/order_model.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final List<Order> orders;

  OrderLoaded(this.orders);

  @override
  List<Object?> get props => [orders];
}

class OrderSucces extends OrderState {
  final String message;

  OrderSucces(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);

  @override
  List<Object?> get props => [message];
}
