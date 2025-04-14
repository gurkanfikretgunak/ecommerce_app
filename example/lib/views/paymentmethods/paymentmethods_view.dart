import 'package:example/cubits/payment_method/payment_method_cubit.dart';
import 'package:example/cubits/payment_method/payment_method_state.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/newcard/newcard_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          text: "PAYMENT METHOD",
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: BlocListener<PaymentMethodCubit, PaymentMethodState>(
        listener: (context, state) {
          if (state is PaymentMethodError) {
            final toast = ToastMessageLabel(
              title: 'Failed to load payment methods',
              description: state.message,
              type: ToastType.error,
            );
            toast.show(context);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                builder: (context, state) {
                  if (state is PaymentMethodLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PaymentMethodLoaded) {
                    if (state.paymentMethods.isEmpty) {
                      return Center(
                        child: HeadText(
                          text: "No payment methods found",
                          color: ColorConstant.instance.neutral1,
                        ),
                      );
                    }

                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: PaymentCardColumnLayout(
                          paymentCardItems: state.paymentMethods.map((item) {
                            return PaymentCardModal(
                              name: item.name!,
                              cartNumber: ("**** **** **** ${item.card_last4}"),
                              expirationDate:
                                  "${item.card_expiry_month}/${item.card_expiry_year.toString().substring(2)}",
                              brand: CartBrand.mastercard,
                              color: ColorConstant.instance.neutral1,
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  } else if (state is PaymentMethodError) {
                    return const Center(
                      child: Text("Failed to load payment methods."),
                    );
                  }
                  return const Center(child: Text("Loading..."));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButton(
                onPressed: () {
                  AutoRouter.of(context).push(NewCardViewRoute());
                },
                height: 50,
                text: "Add New Card",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
