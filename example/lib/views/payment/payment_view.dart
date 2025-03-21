import 'package:auto_route/auto_route.dart';
import 'package:example/views/payment/models/payment_step_cubit.dart';
import 'package:example/views/payment/models/payment_step_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/core/widgets/cart.dart';
import 'package:example/core/widgets/checkout.dart';
import 'package:example/core/widgets/ordersuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class PaymentView extends StatelessWidget {
  PaymentView({super.key});

  List<Widget> getStepContents(BuildContext context) {
    return [
      Cart(
        buttonCallBack: () {
          context.read<PaymentStepCubit>().nextStep();
        },
      ),
      Checkout(
        buttonCallBack: () {
          context.read<PaymentStepCubit>().nextStep();
        },
      ),
      OrderSuccess(
        onPrimaryButtonPressed: () {},
        onSecondaryButtonPressed: () {
          AutoRouter.of(context).push(MainpageViewRoute());
        },
      ),
    ];
  }

  final List<String> stepTitles = [
    "Cart",
    "Checkout",
    "Payment",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentStepCubit(),
      child: BlocBuilder<PaymentStepCubit, PaymentStepState>(
        builder: (context, state) {
          int currentStep = state is PaymentStepChanged ? state.currentStep : 0;

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppbar(
                text: stepTitles[currentStep],
                onPressed: () {
                  if (currentStep == 0) {
                    Navigator.pop(context);
                    return;
                  }
                  context.read<PaymentStepCubit>().previousStep();
                },
                iconColor: ColorConstant.instance.neutral1,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    StepperLabel(currentStep: currentStep),
                    Center(child: getStepContents(context)[currentStep]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
