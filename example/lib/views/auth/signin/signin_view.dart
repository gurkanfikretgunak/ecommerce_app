import 'package:auto_route/auto_route.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/cubits/validation/validation_state.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ValidationCubit()),
      ],
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              AutoRouter.of(context).replace(MainpageViewRoute());
            } else if (state is AuthError) {
              showToast(
                context,
                L10n.of(context)!.errorPrefix(''),
                state.error,
                ToastType.error,
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SignInHeader(
                    imagePath: Assets.images.signinheader.path,
                    onPressed: () {
                      AutoRouter.of(context).push(const OnboardingViewRoute());
                    },
                  ),
                  context.emptySizedHeightBoxNormal,
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
                        bool isEmailValid = true;
                        bool isPasswordValid = true;
                        String? emailErrorMessage;
                        String? passwordErrorMessage;

                        if (validationState is EmailInvalid) {
                          isEmailValid = false;
                          emailErrorMessage = validationState.error;
                        }

                        if (validationState is PasswordInvalid) {
                          isPasswordValid = false;
                          passwordErrorMessage = validationState.error;
                        }

                        if (validationState is EmailInvalid) {
                          isEmailValid = false;
                        }

                        if (validationState is PasswordInvalid) {
                          isPasswordValid = false;
                        }

                        return SignInFormLabel(
                          emailLabelText: L10n.of(context)!.email,
                          passwordLabelText: L10n.of(context)!.password,
                          emailHintText: L10n.of(context)!.enterEmail,
                          passwordHintText: L10n.of(context)!.enterPassword,
                          rememberMeText: L10n.of(context)!.rememberMe,
                          forgotPasswordText: L10n.of(context)!.forgotPassword,
                          emailController: emailController,
                          passwordController: passwordController,
                          emailErrorMessage: emailErrorMessage,
                          passwordErrorMessage: passwordErrorMessage,
                          rememberMe: rememberMe,
                          checkBoxOnChanged: (bool value) {
                            setState(() {
                              rememberMe = value;
                            });
                          },
                          onChangedEmail: (email) {
                            context
                                .read<ValidationCubit>()
                                .validateEmail(email);
                          },
                          onChangedPassword: (password) {
                            context
                                .read<ValidationCubit>()
                                .validatePassword(password);
                          },
                          isEmailValid: isEmailValid,
                          isPasswordValid: isPasswordValid,
                        );
                      },
                    ),
                  ),
                  context.emptySizedHeightBoxNormal,
                  Column(
                    children: [
                      CustomButton(
                        text: L10n.of(context)!.signIn,
                        onPressed: () {
                          if (context
                              .read<ValidationCubit>()
                              .isSignInFormValid()) {
                            context.read<AuthCubit>().signIn(
                                emailController.text,
                                passwordController.text,
                                rememberMe);
                          } else {
                            showToast(
                              context,
                              L10n.of(context)!.formError,
                              L10n.of(context)!.pleaseFixErrors,
                              ToastType.error,
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
                          context.read<AuthCubit>().signUpWithGoogle();
                        },
                      ),
                      context.emptySizedHeightBoxLow,
                      CustomButton(
                        icon: FontAwesomeIcons.facebook,
                        text: L10n.of(context)!.signInWithFacebook,
                        color: ColorConstant.instance.neutral9,
                        textColor: ColorConstant.instance.neutral1,
                        iconColor: ColorConstant.instance.neutral1,
                        onPressed: () {
                          context.read<AuthCubit>().signUpWithFacebook();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            L10n.of(context)!.haventAnAccount,
                          ),
                          TextButton(
                            onPressed: () {
                              AutoRouter.of(context)
                                  .push(const SignUpViewRoute());
                            },
                            child: Text(
                              L10n.of(context)!.register,
                              style: TextStyle(
                                color: ColorConstant.instance.primary_main,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (state is AuthLoading)
                        const CircularProgressIndicator(),
                    ],
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
