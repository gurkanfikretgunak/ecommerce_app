import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/services/auth/auth_service.dart';
// ignore: depend_on_referenced_packages
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
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
  Future<supabase.User?>? _signUpFuture;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                  // <-- Kaydırma ekleniyor
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            top: MediaQuery.of(context).size.height * 0.03),
                      ),
                      SignUpForm(
                        firstNameController: firstNameController,
                        lastNameController: lastNameController,
                        emailController: emailController,
                        phoneController: phoneController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                      ),
                      CustomButton(
                        text: "SIGN UP",
                        onPressed: () {
                          context.read<AuthCubit>().signUp(
                              emailController.text, passwordController.text);
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
                        FutureBuilder<supabase.User?>(
                          future: _signUpFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                AutoRouter.of(context)
                                    .replaceAll([MainpageViewRoute()]);
                              });
                            }
                            return Container();
                          },
                        )
                    ],
                  ),
                );
              },
            )));
  }
}
