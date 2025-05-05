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

  BillingDetailLoaded copyWith({
    List<BillingDetail>? billingDetail,
  }) {
    return BillingDetailLoaded(
      billingDetail: billingDetail ?? this.billingDetail,
    );
  }
}

class BillingDetailPatched extends BillingDetailState {}

class BillingDetailDeleted extends BillingDetailState {}

class BillingDetailSuccess extends BillingDetailState {
  final String message;

  BillingDetailSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class BillingDetailError extends BillingDetailState {
  final String message;

  BillingDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
