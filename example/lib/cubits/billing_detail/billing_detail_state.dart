import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/billing_detail_model/billing_detail_model.dart';

abstract class BillingDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BillingDetailInitial extends BillingDetailState {}

class BillingDetailLoading extends BillingDetailState {}

class BillingDetailLoaded extends BillingDetailState {
  final List<BillingDetail> billingDetail;

  BillingDetailLoaded({required this.billingDetail});

  @override
  List<Object?> get props => [billingDetail];
}

class BillingSuccess extends BillingDetailState {
  final String message;

  BillingSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class BillingError extends BillingDetailState {
  final String message;

  BillingError(this.message);

  @override
  List<Object?> get props => [message];
}
