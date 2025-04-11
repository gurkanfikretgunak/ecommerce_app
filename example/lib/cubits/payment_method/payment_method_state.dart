import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/payment_method_model/payment_method_model.dart';
import 'package:flutter/material.dart';

abstract class PaymentMethodState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodLoaded extends PaymentMethodState {
  final List<PaymentMethod> paymentMethods;

  PaymentMethodLoaded({required this.paymentMethods});

  @override
  List<Object?> get props => [paymentMethods];
}

class PaymentMethodPatched extends PaymentMethodState {}

class PaymentMethodSuccess extends PaymentMethodState {
  final String message;

  PaymentMethodSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class PaymentMethodError extends PaymentMethodState {
  final String message;

  PaymentMethodError(this.message);

  @override
  List<Object?> get props => [message];
}
