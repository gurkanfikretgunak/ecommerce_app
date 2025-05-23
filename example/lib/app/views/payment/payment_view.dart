import 'package:auto_route/auto_route.dart';
import 'package:example/core/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/core/cubits/cart/cart_cubit.dart';
import 'package:example/core/cubits/order/order_cubit.dart';
import 'package:example/core/cubits/auth/auth_cubit.dart';
import 'package:example/core/cubits/auth/auth_state.dart';
import 'package:example/core/cubits/payment_step/payment_step_cubit.dart';
import 'package:example/core/cubits/payment_step/payment_step_state.dart';
import 'package:example/app/route/route.gr.dart';
import 'package:example/app/views/cart/cart_view.dart';
import 'package:example/app/views/checkout/checkout_view.dart';
import 'package:example/app/views/ordersuccess/ordersuccess_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/app/l10n/app_l10n.dart';

@RoutePage()
class PaymentView extends StatelessWidget {
  final int? initialStep;

  PaymentView({super.key, this.initialStep = 0});

  List<Widget> getStepContents(
      BuildContext context, AuthAuthenticated authState) {
    return [
      CartView(
        buttonCallBack: () {
          context.read<PaymentStepCubit>().nextStep();
        },
        userId: authState.user.id,
      ),
      const CheckoutView(
          /* buttonCallBack: () {
          context.read<PaymentStepCubit>().nextStep();
        },*/
          ),
      OrderSuccessView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> stepTitles = [
      L10n.of(context)!.cart,
      L10n.of(context)!.checkout,
      L10n.of(context)!.successfully
    ];

    return BlocProvider(
      create: (context) {
        final cubit = PaymentStepCubit(initialStep: initialStep ?? 0);
        if (initialStep != null) {
          cubit.changeStep(initialStep!);
        }
        return cubit;
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          if (authState is! AuthAuthenticated) {
            return Scaffold(
              appBar: AppBar(title: const Text("")),
              body: const Center(child: Text("Please login to continue.")),
            );
          }

          return BlocBuilder<PaymentStepCubit, PaymentStepState>(
            builder: (context, state) {
              int currentStep = state is PaymentStepChanged
                  ? state.currentStep
                  : initialStep!;

              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: CustomAppbar(
                    text: stepTitles[currentStep],
                    onPressed: () {
                      if (currentStep == 0 || currentStep == 2) {
                        context.read<BottomNavigationCubit>().setPage(0);
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
                        StepperLabel(
                            steps: stepTitles, currentStep: currentStep),
                        Center(
                            child: getStepContents(
                                context, authState)[currentStep]),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: currentStep == 0
                    ? CustomFloatingActionButton(
                        icon: Icons.delete,
                        onPressed: () {
                          context
                              .read<CartCubit>()
                              .clearCart(authState.user.id);
                        },
                      )
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
