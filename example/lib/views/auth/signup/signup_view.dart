import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/cubits/validation/validation_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/core/network/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ValidationCubit()),
      ],
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            text: L10n.of(context)!.createYourAccount,
            onPressed: () {
              Navigator.pop(context);
            },
            iconColor: ColorConstant.instance.neutral1,
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              AutoRouter.of(context).push(MainpageViewRoute());
            } else if (state is AuthSignUpSuccess) {
              AutoRouter.of(context).push(const SignInViewRoute());
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                  BlocBuilder<ValidationCubit, ValidationState>(
                    builder: (context, validationState) {
                      bool isFirstNameValid = true;
                      bool isLastNameValid = true;
                      bool isEmailValid = true;
                      bool isPhoneValid = true;
                      bool isPasswordValid = true;
                      bool isConfirmPasswordValid = true;
                      String? firstNameErrorMessage;
                      String? lastNameErrorMessage;
                      String? emailErrorMessage;
                      String? phoneErrorMessage;
                      String? passwordErrorMessage;
                      String? confirmPasswordErrorMessage;

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
                      if (validationState is PasswordInvalid) {
                        isPasswordValid = false;
                        passwordErrorMessage = validationState.error;
                      }
                      if (validationState is ConfirmPasswordInvalid) {
                        isConfirmPasswordValid = false;
                        confirmPasswordErrorMessage = validationState.error;
                      }
                      return SignUpForm(
                        firstNameHintText: L10n.of(context)!.firstName,
                        lastNameHintText: L10n.of(context)!.lastName,
                        emailHintText: L10n.of(context)!.email,
                        phoneHintText: L10n.of(context)!.phoneNumber,
                        passwordHintText: L10n.of(context)!.password,
                        confirmPasswordHintText:
                            L10n.of(context)!.confirmPassword,
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        emailController: emailController,
                        phoneController: phoneController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        firstNameErrorMessage: firstNameErrorMessage,
                        lastNameErrorMessage: lastNameErrorMessage,
                        emailErrorMessage: emailErrorMessage,
                        phoneErrorMessage: phoneErrorMessage,
                        passwordErrorMessage: passwordErrorMessage,
                        confirmPasswordErrorMessage:
                            confirmPasswordErrorMessage,
                        onChangedFirstName: (value) {
                          context
                              .read<ValidationCubit>()
                              .validateFirstName(value);
                        },
                        onChangedLastName: (value) {
                          context
                              .read<ValidationCubit>()
                              .validateLastName(value);
                        },
                        onChangedEmail: (value) {
                          context.read<ValidationCubit>().validateEmail(value);
                        },
                        onChangedPhone: (value) {
                          context.read<ValidationCubit>().validatePhone(value);
                        },
                        onChangedPassword: (value) {
                          context
                              .read<ValidationCubit>()
                              .validatePassword(value);
                        },
                        onChangedConfirmPassword: (value) {
                          context
                              .read<ValidationCubit>()
                              .validateConfirmPassword(
                                  value, passwordController.text);
                        },
                        isFirstNameValid: isFirstNameValid,
                        isLastNameValid: isLastNameValid,
                        isEmailValid: isEmailValid,
                        isPhoneValid: isPhoneValid,
                        isPasswordValid: isPasswordValid,
                        isConfirmPasswordValid: isConfirmPasswordValid,
                      );
                    },
                  ),
                  CustomButton(
                    text: L10n.of(context)!.signUp,
                    onPressed: () {
                      if (context.read<ValidationCubit>().isSignUpFormValid()) {
                        context.read<AuthCubit>().signUp(
                              firstNameController.text,
                              lastNameController.text,
                              emailController.text,
                              phoneController.text,
                              passwordController.text,
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(L10n.of(context)!.pleaseFixErrors)),
                        );
                      }
                    },
                  ),
                  context.emptySizedHeightBoxLow,
                  CustomButton(
                    icon: FontAwesomeIcons.google,
                    text: L10n.of(context)!.signInWithGoogle,
                    color: ColorConstant.instance.neutral9,
                    textColor: ColorConstant.instance.neutral1,
                    iconColor: ColorConstant.instance.neutral1,
                    onPressed: () {
                      AuthService().signUpWithGoogle();
                    },
                  ),
                  context.emptySizedHeightBoxLow,
                  CustomButton(
                    icon: FontAwesomeIcons.facebook,
                    text: L10n.of(context)!.signInWithFacebook,
                    color: ColorConstant.instance.neutral9,
                    textColor: ColorConstant.instance.neutral1,
                    iconColor: ColorConstant.instance.neutral1,
                    onPressed: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
