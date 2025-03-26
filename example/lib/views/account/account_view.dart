import 'package:auto_route/auto_route.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/mainpage/models/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/core/network/models/user_model/user_model.dart';

@RoutePage()
class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    final List<SettingsBoxLabel> settingsBoxItem = [
      SettingsBoxLabel(
          icon: Icons.person_outlined,
          text: 'Account',
          onTap: () {
            AutoRouter.of(context).push(ProfileViewRoute());
          },
          suffixIcon: Icons.arrow_forward_ios),
      SettingsBoxLabel(
          icon: Icons.notifications_outlined,
          text: 'Notification',
          onTap: () {
            AutoRouter.of(context).push(const NotificationViewRoute());
          },
          suffixIcon: Icons.arrow_forward_ios),
      const SettingsBoxLabel(
          icon: Icons.payment,
          text: 'Payment Information',
          suffixIcon: Icons.arrow_forward_ios),
      const SettingsBoxLabel(
          icon: Icons.lock_outline,
          text: 'Privacy Setting',
          suffixIcon: Icons.arrow_forward_ios),
      const SettingsBoxLabel(
          icon: Icons.settings,
          text: 'General Setting',
          suffixIcon: Icons.arrow_forward_ios),
      const SettingsBoxLabel(
          icon: Icons.language,
          text: 'Language',
          suffixIcon: Icons.arrow_forward_ios),
      const SettingsBoxLabel(
          icon: Icons.person,
          text: 'Change Account',
          suffixIcon: Icons.arrow_forward_ios),
      SettingsBoxLabel(
        icon: Icons.logout,
        text: 'Sign Out',
        onTap: () async {
          context.read<AuthCubit>().signOut();
        },
        iconColor: ColorConstant.instance.secondary2,
        textColor: ColorConstant.instance.secondary2,
      ),
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "ACCOUNT",
          onPressed: () {
            context.read<BottomNavigationCubit>().setPage(0);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
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
                      icon: Icons.photo_camera,
                    ),
                    context.emptySizedHeightBoxNormal,
                    Column(
                      children: [
                        CustomButton(
                          width: buttonWidth,
                          radius: 0,
                          height: 40,
                          color: ColorConstant.instance.neutral9,
                          onPressed: () {
                            context.read<BottomNavigationCubit>().setPage(1);
                          },
                          text: "My Order",
                          iconColor: ColorConstant.instance.neutral1,
                          textColor: ColorConstant.instance.neutral1,
                          icon: Icons.local_mall,
                        ),
                        context.emptySizedHeightBoxLow,
                        CustomButton(
                          width: buttonWidth,
                          radius: 0,
                          height: 40,
                          color: ColorConstant.instance.neutral9,
                          onPressed: () {
                            context.read<BottomNavigationCubit>().setPage(1);
                          },
                          text: "Wishlist",
                          iconColor: ColorConstant.instance.neutral1,
                          textColor: ColorConstant.instance.neutral1,
                          icon: Icons.favorite,
                        ),
                      ],
                    ),
                    context.emptySizedHeightBoxNormal,
                    SettingsBoxColumnLayout(
                      items: settingsBoxItem,
                    ),
                  ],
                ),
              ),
            );
          } else if (state is AuthUnauthenticated) {
            AutoRouter.of(context).replace(const SignInViewRoute());
            return const SizedBox.shrink();
          } else {
            AutoRouter.of(context).replace(const SignInViewRoute());
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
