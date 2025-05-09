import 'package:bloc/bloc.dart';
import 'package:example/core/cubits/payment_step/payment_step_state.dart';
import 'package:flutter/material.dart';

class PaymentStepCubit extends Cubit<PaymentStepState> {
  PaymentStepCubit({int initialStep = 0}) : super(PaymentStepInitial());

  void changeStep(int step) {
    emit(PaymentStepChanged(step));
  }

  void nextStep() {
    if (state is PaymentStepChanged) {
      final currentStep = (state as PaymentStepChanged).currentStep;

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
