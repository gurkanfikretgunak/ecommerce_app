import 'package:example/core/network/models/billing_detail_model/billing_detail_model.dart';

import 'package:example/cubits/billing_detail/billing_detail_cubit.dart';
import 'package:example/views/addresses/addresses_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthAuthenticated) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppbar(
                text: "NEW ADDRESS",
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
                    AddressFormLabel(
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      countryController: countryController,
                      streetAddressController: streetAddressController,
                      cityController: cityController,
                      phoneController: phoneController,
                      emailController: emailController,
                      isDefault: isDefault,
                      onDefaultChanged: (value) {
                        setState(() {
                          isDefault = value;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomButton(
                        onPressed: () async {
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
                                ),
                              );
                          AutoRouter.of(context).push(AddressesViewRoute());
                        },
                        height: 50,
                        text: "Confirm",
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
    );
  }
}
