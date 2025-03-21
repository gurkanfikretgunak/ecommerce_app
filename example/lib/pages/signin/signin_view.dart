import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/cubits/validation/validation_state.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

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
              AutoRouter.of(context).push(MainpageViewRoute());
            } else if (state is AuthError) {
              showToast(
                context,
                'Error',
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
                          'Validation Error',
                          validationState.error,
                          ToastType.error,
                        );
                      }
                    },
                    child: BlocBuilder<ValidationCubit, ValidationState>(
                      builder: (context, validationState) {
                        bool isEmailValid = true;
                        bool isPasswordValid = true;

                        if (validationState is EmailInvalid) {
                          isEmailValid = false;
                        }

                        if (validationState is PasswordInvalid) {
                          isPasswordValid = false;
                        }

                        return SignInFormLabel(
                          emailController: emailController,
                          passwordController: passwordController,
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
                        text: "SIGN IN",
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
                              'Form Error',
                              'Please fix the errors in the form',
                              ToastType.error,
                            );
                          }
                        },
                      ),
                      context.emptySizedHeightBoxLow,
                      CustomButton(
                        icon: FontAwesomeIcons.google,
                        text: "SIGN IN WITH GOOGLE",
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
                        text: "SIGN IN WITH FACEBOOK",
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
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              AutoRouter.of(context)
                                  .push(const SignUpViewRoute());
                            },
                            child: Text(
                              "Register",
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
