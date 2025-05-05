import 'package:equatable/equatable.dart';

abstract class PaymentStepState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentStepInitial extends PaymentStepState {}

class PaymentStepChanged extends PaymentStepState {
  final int currentStep;

  PaymentStepChanged(this.currentStep);

  @override
  List<Object?> get props => [currentStep];
}
