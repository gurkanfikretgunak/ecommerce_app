import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/views/onboarding/onboarding_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/cubits/auth/auth_cubit.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  final String? logoPath;
  final String? splashText;

  const SplashView({super.key, this.logoPath, this.splashText});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthCubit>().checkToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.primary_main,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            print("Authenticated");
            AutoRouter.of(context).replace(MainpageViewRoute());
          } else if (state is AuthUnauthenticated) {
            AutoRouter.of(context).replace(const OnboardingViewRoute());
          } else {
            AutoRouter.of(context).replace(const OnboardingViewRoute());
          }
        },
        builder: (context, state) {
          return SplashLabel(
            logoPath: widget.logoPath ?? Assets.icons.logo.path,
            background: Assets.images.splashtexture.path,
          );
        },
      ),
    );
  }
}
