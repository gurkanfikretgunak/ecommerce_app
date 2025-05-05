import 'package:example/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/cubits/payment_method/payment_method_cubit.dart';
import 'package:example/cubits/payment_method/payment_method_state.dart';
import 'dart:math';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/views/newcard/newcard_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class PaymentMethodsView extends StatefulWidget {
  const PaymentMethodsView({super.key});

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  late final userState;

  @override
  void initState() {
    super.initState();
    userState = context.read<AuthCubit>().state;
    context
        .read<PaymentMethodCubit>()
        .getPaymentMethod(userId: userState.user!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: L10n.of(context)!.paymentMethod,
          onPressed: () {
            if (AutoRouter.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              AutoRouter.of(context).push(PaymentViewRoute(initialStep: 1));
            }
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: BlocListener<PaymentMethodCubit, PaymentMethodState>(
        listener: (context, state) {},
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                builder: (context, state) {
                  if (state is PaymentMethodLoading) {
                    return const Center(child: CircularProgressAnimation());
                  } else if (state is PaymentMethodSuccess) {
                    context
                        .read<PaymentMethodCubit>()
                        .getPaymentMethod(userId: userState.user!.id);
                    return const Center(child: CircularProgressAnimation());
                  } else if (state is PaymentMethodPatched) {
                    context
                        .read<PaymentMethodCubit>()
                        .getPaymentMethod(userId: userState.user!.id);
                    return const Center(child: CircularProgressAnimation());
                  } else if (state is PaymentMethodDeleted) {
                    context
                        .read<PaymentMethodCubit>()
                        .getPaymentMethod(userId: userState.user!.id);
                    return const Center(child: CircularProgressAnimation());
                  } else if (state is PaymentMethodLoaded) {
                    if (state.paymentMethods.isEmpty) {
                      return Center(
                        child: HeadText(
                          text: L10n.of(context)!.noPaymentMethodFound,
                          color: ColorConstant.instance.neutral1,
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: PaymentCardColumnLayout(
                          deletePaymentCardCallBack: (index) {
                            context
                                .read<PaymentMethodCubit>()
                                .deletePaymentMethod(
                                    state.paymentMethods[index].id!);
                          },
                          paymentCardItems: state.paymentMethods
                              .map((item) {
                                return PaymentCardModal(
                                  name: item.name,
                                  isSelected: item.is_default ?? false,
                                  cartNumber:
                                      ("**** **** **** ${item.card_last4}"),
                                  expirationDate:
                                      "${item.card_expiry_month}/${item.card_expiry_year.toString().substring(2)}",
                                  brand: item.card_brand,
                                  color: ColorConstant.instance.neutral4,
                                  onTap: () {
                                    context
                                        .read<PaymentMethodCubit>()
                                        .patchPaymentMethod(item.id!);
                                  },
                                );
                              })
                              .toList()
                              .reversed
                              .toList(),
                        ),
                      ),
                    );
                  } else if (state is PaymentMethodError) {
                    return Center(
                      child: ContentText(
                          text: L10n.of(context)!.failedToLoadPaymentMethods,
                          color: ColorConstant.instance.neutral1),
                    );
                  }
                  return Center(child: Text(L10n.of(context)!.loading));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButton(
                onPressed: () {
                  AutoRouter.of(context).push(const NewCardViewRoute());
                },
                height: 50,
                text: L10n.of(context)!.addNewCard,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Color> cardColors = [
    Colors.blueGrey.shade700,
    Colors.indigo.shade700,
    Colors.deepPurple.shade600,
    Colors.teal.shade700,
    Colors.green.shade700,
    Colors.brown.shade600,
    Colors.grey.shade800,
    Colors.deepOrange.shade700,
    Colors.cyan.shade700,
    Colors.purple.shade700,
  ];
}
