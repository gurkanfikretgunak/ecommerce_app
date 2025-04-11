import 'package:bloc/bloc.dart';
import 'package:example/core/network/respository/payment_method_respository/payment_method_respository.dart';
import 'package:example/cubits/payment_method/payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(PaymentMethodInitial());

  Future<void> getPaymentMethod(
      {required String userId, bool? isDefault}) async {
    emit(PaymentMethodLoading());
    try {
      final paymentMethods = await PaymentMethodRespository()
          .getPaymentMethod(userId: userId, isDefault: isDefault);
      emit(PaymentMethodLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(PaymentMethodError('Failed to load payment methods'));
    }
  }
}
