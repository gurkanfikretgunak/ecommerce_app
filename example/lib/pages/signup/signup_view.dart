import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/services/auth.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/cubits/auth/auth_cubit.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  Future<User?>? _signUpFuture;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppbar(
              text: "CREATE YOUR ACCOUNT",
              onPressed: () {
                Navigator.pop(context);
              },
              iconColor: ColorConstant.instance.neutral1,
            )),
        body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthAuthenticated) {
            AutoRouter.of(context).push(MainpageViewRoute());
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        }, builder: (context, state) {
          return Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 20, top: screenHeigth * 0.03)),
              const SignUpForm(),
              CustomButton(
                text: "SIGN UP",
                onPressed: () {
                  AutoRouter.of(context).push(const VerificationViewRoute());
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VerificationView())))*/
                },
              ),
              context.emptySizedHeightBoxLow,
              CustomButton(
                icon: FontAwesomeIcons.google,
                text: "SIGN UP WITH GOOGLE",
                color: ColorConstant.instance.neutral9,
                textColor: ColorConstant.instance.neutral1,
                iconColor: ColorConstant.instance.neutral1,
                onPressed: () {
                  setState(() {
                    _signUpFuture = AuthService().signUpWithGoogle();
                  });
                },
              ),
              context.emptySizedHeightBoxLow,
              CustomButton(
                icon: FontAwesomeIcons.facebook,
                text: "SIGN UP WITH FACEBOOK",
                color: ColorConstant.instance.neutral9,
                textColor: ColorConstant.instance.neutral1,
                iconColor: ColorConstant.instance.neutral1,
                onPressed: () {},
              ),
              if (_signUpFuture != null)
                FutureBuilder<User?>(
                    future: _signUpFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            AutoRouter.of(context)
                                .replaceAll([MainpageViewRoute()]);
                          });
                        }
                      }
                      return Container();
                    })
            ],
          );
        }),
      ),
    );
  }
}
