import 'package:bloc/bloc.dart';
import 'package:example/views/payment/models/payment_step_state.dart';
import 'package:flutter/material.dart';

class PaymentStepCubit extends Cubit<PaymentStepState> {
  PaymentStepCubit() : super(PaymentStepInitial());

  void changeStep(int step) {
    emit(PaymentStepChanged(step));
  }

  void nextStep() {
    if (state is PaymentStepChanged) {
      final currentStep = (state as PaymentStepChanged).currentStep;
      debugPrint("Next Step Called: $currentStep -> ${currentStep + 1}");

      emit(PaymentStepChanged(currentStep + 1));
    } else {
      emit(PaymentStepChanged(1));
    }
  }

  void previousStep() {
    if (state is PaymentStepChanged) {
      final currentStep = (state as PaymentStepChanged).currentStep;
      emit(PaymentStepChanged(currentStep - 1));
    } else {
      emit(PaymentStepChanged(0));
    }
  }
}
