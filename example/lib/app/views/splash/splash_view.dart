import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/core/network/services/deeplink/deeplink_service.dart';
import 'package:example/app/route/route.gr.dart';
import 'package:example/core/cubits/auth/auth_cubit.dart';
import 'package:example/core/cubits/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:example/core/cubits/locale/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:shopapp_widgets/shoapp_ui_kit.dart';

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
    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;
      loadLanguage();
      _checkForInitialDeeplink();
    });
  }

  Future<void> _checkForInitialDeeplink() async {
    try {
      final initialUri = await DeeplinkService().getInitialLink();

      if (initialUri != null) {
        DeeplinkService().handleDeeplink(initialUri);
      } else {
        context.read<AuthCubit>().checkToken();
      }
    } catch (e) {}
    context.read<AuthCubit>().checkToken();
  }

  Future<void> loadLanguage() async {
    var box = await Hive.openBox('settings');
    String languageCode = box.get('language', defaultValue: 'en');

    context.read<LocaleCubit>().changeLocale(Locale(languageCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.primary_main,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            AutoRouter.of(context).replaceAll([MainpageViewRoute()]);
          } else if (state is AuthUnauthenticated) {
            if (kIsWeb) {
              AutoRouter.of(context).replaceAll([const SignInViewRoute()]);
            } else {
              AutoRouter.of(context).replaceAll([const OnboardingViewRoute()]);
            }
          } else {
            AutoRouter.of(context).replaceAll([const SignUpViewRoute()]);
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
