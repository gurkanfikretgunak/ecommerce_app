import 'package:bloc/bloc.dart';
import 'package:example/core/network/models/payment_method_model/payment_method_model.dart';
import 'package:example/core/network/repository/payment_method_repository/payment_method_repository.dart';
import 'package:example/cubits/payment_method/payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit() : super(PaymentMethodInitial());

  Future<void> getPaymentMethod(
      {required String userId, bool? isDefault}) async {
    emit(PaymentMethodLoading());
    try {
      final paymentMethods = await PaymentMethodRepository()
          .getPaymentMethod(userId: userId, isDefault: isDefault);
      emit(PaymentMethodLoaded(paymentMethods: paymentMethods));
    } catch (e) {
      emit(PaymentMethodError('Failed to load payment methods'));
    }
  }

  Future<void> postPaymentMethod(PaymentMethod paymentMethod) async {
    try {
      await PaymentMethodRepository().postPaymentMethod(paymentMethod);
      emit(PaymentMethodSuccess('Payment method added successfully'));
    } catch (e) {
      emit(PaymentMethodError('Failed to post payment method'));
    }
  }

  Future<void> patchPaymentMethod(int id) async {
    try {
      await PaymentMethodRepository().patchPaymentMethod(id);
      emit(PaymentMethodPatched());
    } catch (e) {
      emit(PaymentMethodError('Failed to patch payment method'));
    }
  }

  Future<void> deletePaymentMethod(int id) async {
    try {
      await PaymentMethodRepository().deletePaymentMethod(id);
      emit(PaymentMethodDeleted());
    } catch (e) {
      emit(PaymentMethodError('Failed to delete payment method'));
    }
  }

  String getCardType(String cardFirstDigits) {
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
