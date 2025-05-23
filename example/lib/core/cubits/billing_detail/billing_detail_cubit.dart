import 'package:bloc/bloc.dart';
import 'package:example/core/network/models/billing_detail_model/billing_detail_model.dart';
import 'package:example/core/network/repository/billing_detail_repository/billing_detail_repository.dart';
import 'package:example/core/cubits/billing_detail/billing_detail_state.dart';

class BillingDetailCubit extends Cubit<BillingDetailState> {
  BillingDetailCubit() : super(BillingDetailInitial());

  Future<void> getBillingDetail(
      {required String userId, bool? isDefault}) async {
    emit(BillingDetailLoading());
    try {
      final billingDetail = await BillingDetailRepository()
          .getBillingDetail(userId: userId, isDefault: isDefault);

      if (state is BillingDetailLoaded) {
        final currentState = state as BillingDetailLoaded;
        emit(currentState.copyWith(billingDetail: billingDetail));
      } else {
        emit(BillingDetailLoaded(billingDetail: billingDetail));
      }
    } catch (e) {
      emit(BillingDetailError("Failed to get billing detail: ${e.toString()}"));
    }
  }

  Future<void> postBillingDetail(BillingDetail billingDetail) async {
    try {
      await BillingDetailRepository().postBillingDetail(billingDetail);
      emit(BillingDetailSuccess("Billing detail added successfully"));
    } catch (e) {
      emit(BillingDetailError("Failed to post billing detail:${e.toString()}"));
    }
  }

  Future<void> patchBillingDetail(int id) async {
    try {
      await BillingDetailRepository().patchBillingDetail(id);
      emit(BillingDetailPatched());
    } catch (e) {
      emit(
          BillingDetailError("Failed to patch billing detail:${e.toString()}"));
    }
  }

  Future<void> deleteBillingDetail(int id) async {
    try {
      await BillingDetailRepository().deleteBillingDetail(id);
      emit(BillingDetailDeleted());
    } catch (e) {
      emit(BillingDetailError(
          "Failed to delete billing detail:${e.toString()}"));
    }
  }
}
