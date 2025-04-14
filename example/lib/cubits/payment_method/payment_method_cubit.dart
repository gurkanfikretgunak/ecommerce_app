import 'package:bloc/bloc.dart';
import 'package:example/core/network/models/payment_method_model/payment_method_model.dart';
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

  Future<void> postPaymentMethod(PaymentMethod paymentMethod) async {
    try {
      await PaymentMethodRespository().postPaymentMethod(paymentMethod);
      emit(PaymentMethodSuccess('Payment method added successfully'));
    } catch (e) {
      emit(PaymentMethodError('Failed to post payment method'));
    }
  }

  String getCardType(String cardFirstDigits) {
    print(cardFirstDigits);
    switch (cardFirstDigits) {
      case '3':
        return 'American Express';
      case '5':
        return 'MasterCard';
      case '4':
        return 'Visa';
      default:
        return 'Unknown';
    }
  }
}
