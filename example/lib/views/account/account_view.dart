import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:example/cubits/locale/locale_cubit.dart';
import 'package:example/cubits/orderwishlist/orderwishlist_cubit.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/core/network/models/user_model/user_model.dart';
import 'package:example/l10n/app_l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          text: L10n.of(context)!.account,
          onTap: () {
            AutoRouter.of(context).push(ProfileViewRoute());
          },
          suffixIcon: Icons.arrow_forward_ios),
      SettingsBoxLabel(
          icon: Icons.notifications_outlined,
          text: L10n.of(context)!.notification,
          onTap: () {
            AutoRouter.of(context).push(const NotificationViewRoute());
          },
          suffixIcon: Icons.arrow_forward_ios),
      SettingsBoxLabel(
        icon: Icons.payment,
        text: L10n.of(context)!.paymentInformation,
        suffixIcon: Icons.arrow_forward_ios,
        onTap: () {
          AutoRouter.of(context).push(const PaymentMethodsViewRoute());
        },
      ),
      SettingsBoxLabel(
          icon: Icons.language,
          text: L10n.of(context)!.language,
          onTap: () {
            AutoRouter.of(context).push(const LanguageViewRoute());
          },
          suffixIcon: Icons.arrow_forward_ios),
      /*SettingsBoxLabel(
          icon: Icons.lock_outline,
          text: L10n.of(context)!.privacySetting,
          suffixIcon: Icons.arrow_forward_ios),
      SettingsBoxLabel(
          icon: Icons.settings,
          text: L10n.of(context)!.generalSetting,
          suffixIcon: Icons.arrow_forward_ios),
    
      SettingsBoxLabel(
          icon: Icons.person,
          text: L10n.of(context)!.changeAccount,
          suffixIcon: Icons.arrow_forward_ios),*/
      SettingsBoxLabel(
        icon: Icons.logout,
        text: L10n.of(context)!.signOut,
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
          text: L10n.of(context)!.account,
          onPressed: () {
            context.read<BottomNavigationCubit>().setPage(0);
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
                      //icon: Icons.photo_camera,
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
                            context.read<OrderwishlistCubit>().showOrder(true);
                            context.read<BottomNavigationCubit>().setPage(1);
                          },
                          text: L10n.of(context)!.myOrder,
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
                            context.read<OrderwishlistCubit>().showOrder(false);
                            context.read<BottomNavigationCubit>().setPage(1);
                          },
                          text: L10n.of(context)!.wishlist,
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
