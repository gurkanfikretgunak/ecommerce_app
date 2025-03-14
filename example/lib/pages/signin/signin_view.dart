import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/services/auth/auth_service.dart';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/cubits/auth/auth_cubit.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              AutoRouter.of(context).push(MainpageViewRoute());
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
                  SignInHeader(
                    imagePath: Assets.images.signinheader.path,
                    onPressed: () {
                      AutoRouter.of(context).push(const OnboardingViewRoute());
                    },
                  ),
                  context.emptySizedHeightBoxNormal,
                  SignInForm(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  context.emptySizedHeightBoxNormal,
                  Column(
                    children: [
                      CustomButton(
                        text: "SIGN IN",
                        onPressed: () {
                          context.read<AuthCubit>().signIn(
                              emailController.text, passwordController.text);
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

                          // SupabaseAuthService().supabasesignUpWithGoogle();
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
                          const Text("Don’t have an account?"),
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
