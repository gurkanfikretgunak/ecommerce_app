import 'package:example/core/network/models/payment_method_model/payment_method_model.dart';
import 'package:example/cubits/payment_method/payment_method_cubit.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/cubits/validation/validation_state.dart';
import 'package:example/views/paymentmethods/paymentmethods_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class NewCardView extends StatefulWidget {
  const NewCardView({super.key});

  @override
  State<NewCardView> createState() => _NewCardViewState();
}

class _NewCardViewState extends State<NewCardView> {
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expMonthController = TextEditingController();
  final TextEditingController expYearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  void showToast(
      BuildContext context, String title, String description, ToastType type) {
    final toast = ToastMessageLabel(
      title: title,
      description: description,
      type: type,
    );
    toast.show(context);
  }

  @override
  void dispose() {
    cardHolderController.dispose();
    cardNumberController.dispose();
    expMonthController.dispose();
    expYearController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ValidationCubit()),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          if (authState is! AuthAuthenticated) {
            return const Center(child: CircularProgressIndicator());
          }

          final userId = authState.user.id;

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppbar(
                text: L10n.of(context)!.addNewCard,
                onPressed: () {
                  Navigator.pop(context);
                },
                iconColor: ColorConstant.instance.neutral1,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    BlocListener<ValidationCubit, ValidationState>(
                      listener: (context, state) {
                        if (state is ValidationError) {
                          showToast(
                            context,
                            L10n.of(context)!.validationError,
                            state.error,
                            ToastType.error,
                          );
                        }
                      },
                      child: BlocBuilder<ValidationCubit, ValidationState>(
                        builder: (context, state) {
                          bool isCardNameValid = true;
                          bool isCardNumberValid = true;
                          bool isExpMonthValid = true;
                          bool isExpYearValid = true;
                          bool isCVVValid = true;

                          String? cardNameError;
                          String? cardNumberError;
                          String? expMonthError;
                          String? expYearError;
                          String? cvvError;

                          if (state is CardNameInvalid) {
                            isCardNameValid = false;
                            cardNameError = state.error;
                          }
                          if (state is CardNumberInvalid) {
                            isCardNumberValid = false;
                            cardNumberError = state.error;
                          }
                          if (state is ExpMonthInvalid) {
                            isExpMonthValid = false;
                            expMonthError = state.error;
                          }
                          if (state is ExpYearInvalid) {
                            isExpYearValid = false;
                            expYearError = state.error;
                          }
                          if (state is CvvInvalid) {
                            isCVVValid = false;
                            cvvError = state.error;
                          }

                          return CardFormLabel(
                            nameController: cardHolderController,
                            cardNumberController: cardNumberController,
                            expMonthController: expMonthController,
                            expDateController: expYearController,
                            cvvController: cvvController,
                            nameOnCardHintText: L10n.of(context)!.nameOnCard,
                            cardNumberHintText: L10n.of(context)!.cardNumber,
                            expMonthHintText: L10n.of(context)!.expMonth,
                            expDateHintText: L10n.of(context)!.expDate,
                            cvvHintText: L10n.of(context)!.cvv,
                            onNameChanged: (val) {
                              setState(() {
                                context
                                    .read<ValidationCubit>()
                                    .validateCardHolderName(val);
                              });
                            },
                            onCardNumberChanged: (val) {
                              setState(() {
                                context
                                    .read<ValidationCubit>()
                                    .validateCardNumber(val);
                              });
                            },
                            onExpMonthChanged: (val) {
                              setState(() {
                                context
                                    .read<ValidationCubit>()
                                    .validateExpMonth(val);
                              });
                            },
                            onExpDateChanged: (val) {
                              setState(() {
                                context
                                    .read<ValidationCubit>()
                                    .validateExpYear(val);
                              });
                            },
                            onCvvChanged: (val) {
                              setState(() {
                                context
                                    .read<ValidationCubit>()
                                    .validateCVV(val);
                              });
                            },
                            isNameValid: isCardNameValid,
                            isCardNumberValid: isCardNumberValid,
                            isExpMonthValid: isExpMonthValid,
                            isExpDateValid: isExpYearValid,
                            isCvvValid: isCVVValid,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 150),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        onPressed: () async {
                          final isValid =
                              context.read<ValidationCubit>().isCardFormValid();
                          if (isValid) {
                            await context
                                .read<PaymentMethodCubit>()
                                .postPaymentMethod(
                                  PaymentMethod(
                                    name: cardHolderController.text,
                                    card_last4: cardNumberController.text
                                        .substring(
                                            cardNumberController.text.length -
                                                4),
                                    card_brand: context
                                        .read<PaymentMethodCubit>()
                                        .getCardType(
                                            cardNumberController.text[0]),
                                    card_expiry_month: expMonthController.text,
                                    card_expiry_year: expYearController.text,
                                    user_id: userId,
                                  ),
                                );
                            AutoRouter.of(context)
                                .push(const PaymentMethodsViewRoute());
                          } else {
                            showToast(
                              context,
                              L10n.of(context)!.formError,
                              L10n.of(context)!.pleaseFixErrors,
                              ToastType.error,
                            );
                          }
                        },
                        height: 50,
                        text: L10n.of(context)!.addNewCard,
                      ),
                    ),
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
