import 'package:example/core/network/models/billing_detail_model/billing_detail_model.dart';
import 'package:example/cubits/billing_detail/billing_detail_cubit.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/cubits/validation/validation_state.dart';
import 'package:example/views/addresses/addresses_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class NewAddressView extends StatefulWidget {
  const NewAddressView({super.key});

  @override
  State<NewAddressView> createState() => _NewAddressViewState();
}

class _NewAddressViewState extends State<NewAddressView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isDefault = false;

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
    firstNameController.dispose();
    lastNameController.dispose();
    countryController.dispose();
    streetAddressController.dispose();
    cityController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ValidationCubit()),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: CustomAppbar(
                  text: L10n.of(context)!.newAddress,
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
                        listener: (context, validationState) {
                          if (validationState is ValidationError) {
                            showToast(
                              context,
                              L10n.of(context)!.validationError,
                              validationState.error,
                              ToastType.error,
                            );
                          }
                        },
                        child: BlocBuilder<ValidationCubit, ValidationState>(
                          builder: (context, validationState) {
                            bool isFirstNameValid = true;
                            bool isLastNameValid = true;
                            bool isEmailValid = true;
                            bool isPhoneValid = true;

                            String? firstNameErrorMessage;
                            String? lastNameErrorMessage;
                            String? emailErrorMessage;
                            String? phoneErrorMessage;

                            if (validationState is FirstNameInvalid) {
                              isFirstNameValid = false;
                              firstNameErrorMessage = validationState.error;
                            }
                            if (validationState is LastNameInvalid) {
                              isLastNameValid = false;
                              lastNameErrorMessage = validationState.error;
                            }
                            if (validationState is EmailInvalid) {
                              isEmailValid = false;
                              emailErrorMessage = validationState.error;
                            }
                            if (validationState is PhoneInvalid) {
                              isPhoneValid = false;
                              phoneErrorMessage = validationState.error;
                            }

                            return AddressFormLabel(
                              firstNameController: firstNameController,
                              lastNameController: lastNameController,
                              countryController: countryController,
                              streetAddressController: streetAddressController,
                              cityController: cityController,
                              phoneController: phoneController,
                              emailController: emailController,
                              titleText: L10n.of(context)!.billingDetails,
                              firstNameHintText: L10n.of(context)!.firstName,
                              lastNameHintText: L10n.of(context)!.lastName,
                              countryHintText: L10n.of(context)!.country,
                              streetAddressHintText:
                                  L10n.of(context)!.streetAddress,
                              cityHintText: L10n.of(context)!.townCity,
                              phoneHintText: L10n.of(context)!.phoneNumber,
                              emailHintText: L10n.of(context)!.email,
                              setDefaultAddressText:
                                  L10n.of(context)!.setDefaultAddress,
                              isDefault: isDefault,
                              onDefaultChanged: (value) {
                                setState(() {
                                  isDefault = value;
                                });
                              },
                              onChangedEmail: (email) {
                                context
                                    .read<ValidationCubit>()
                                    .validateEmail(email);
                              },
                              onChangedPhone: (phone) {
                                context
                                    .read<ValidationCubit>()
                                    .validatePhone(phone);
                              },
                              isEmailValid: isEmailValid,
                              isPhoneValid: isPhoneValid,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: CustomButton(
                          onPressed: () async {
                            final validationCubit =
                                context.read<ValidationCubit>();

                            if (validationCubit.isAddressFormValid()) {
                              await context
                                  .read<BillingDetailCubit>()
                                  .postBillingDetail(
                                    BillingDetail(
                                      userId: state.user.id,
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      country: countryController.text,
                                      address: streetAddressController.text,
                                      city: cityController.text,
                                      phoneNumber: phoneController.text,
                                      emailAddress: emailController.text,
                                      isDefault: isDefault,
                                    ),
                                  );
                              AutoRouter.of(context)
                                  .push(const AddressesViewRoute());
                            } else {
                              showToast(
                                context,
                                L10n.of(context)!.formError,
                                L10n.of(context)!.confirm,
                                ToastType.error,
                              );
                            }
                          },
                          height: 50,
                          text: L10n.of(context)!.confirm,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
