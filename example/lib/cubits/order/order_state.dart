import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {}

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
