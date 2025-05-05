import 'package:example/core/gen/assets.gen.dart';
import 'package:example/core/network/models/user_model/user_model.dart';
import 'package:example/core/network/services/auth/auth_service.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  late List<AccountInfoBoxLabel> accountBoxItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: L10n.of(context)!.profile,
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressAnimation());
          } else if (state is AuthAuthenticated) {
            User user = state.user;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    AccountBoxLabel(
                      imagePath: state.user.profile_picture!,
                      name: user.display_name ?? "",
                      username: user.email ?? "",
                      icon: Icons.edit,
                    ),
                    context.emptySizedHeightBoxNormal,
                    AccountInfoBoxColumnLayout(
                        items: accountBoxItems = [
                      AccountInfoBoxLabel(
                        title: L10n.of(context)!.name,
                        value: user.display_name ?? "",
                      ),
                      AccountInfoBoxLabel(
                        title: L10n.of(context)!.phoneNumber,
                        value: user.phone_number ?? "",
                      ),
                      AccountInfoBoxLabel(
                        title: L10n.of(context)!.email,
                        value: user.email ?? "",
                      ),
                      AccountInfoBoxLabel(
                        title: L10n.of(context)!.password,
                        value: L10n.of(context)!.changePassword,
                        valueColor: ColorConstant.instance.primary_main,
                      ),
                    ]),
                  ],
                ),
              ),
            );
          } else if (state is AuthUnauthenticated) {
            AutoRouter.of(context).replace(const SignInViewRoute());
            return const SizedBox.shrink();
          }
          AutoRouter.of(context).replace(const SignInViewRoute());
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
