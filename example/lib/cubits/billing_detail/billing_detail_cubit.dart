import 'package:bloc/bloc.dart';
import 'package:example/core/network/respository/billing_detail_respository/billing_detail_respository.dart';
import 'package:example/cubits/billing_detail/billing_detail_state.dart';

class BillingDetailCubit extends Cubit<BillingDetailState> {
  BillingDetailCubit() : super(BillingDetailInitial());

  Future<void> getBillingDetail(
      {required String userId, bool? isDefault}) async {
    emit(BillingDetailLoading());
    try {
      final billingDetail = await BillingDetailRespository()
          .getBillingDetail(userId: userId, isDefault: isDefault ?? null);
      emit(BillingDetailLoaded(
        billingDetail: billingDetail,
      ));
    } catch (e) {
      emit(BillingDetailError("Failed to get billing detail:${e.toString()}"));
    }
  }

  Future<void> patchBillingDetail(int id) async {
    try {
      await BillingDetailRespository().patchBillingDetail(id);
      emit(BillingDetailPatched());
    } catch (e) {
      emit(
          BillingDetailError("Failed to patch billing detail:${e.toString()}"));
    }
  }
}
