import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/notification/notification_view.dart';
import 'package:example/pages/profile/profile_view.dart';
import 'package:example/pages/signin/signin_view.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:auto_route/auto_route.dart';

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
            /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileView()));*/
          },
          suffixIcon: Icons.arrow_forward_ios),
      SettingsBoxLabel(
          icon: Icons.notifications_outlined,
          text: 'Noficiation',
          onTap: () {
            AutoRouter.of(context).push(const NotificationViewRoute());
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationView()));*/
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
          if (await AuthService().signOut()) {
            AutoRouter.of(context).push(const SignInViewRoute());
            /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInView()));*/
          }
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
            setState(() {
              Navigator.pop(context);
            });
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              FutureBuilder<User?>(
                future: AuthService().getCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    User? user = snapshot.data;
                    return AccountBoxLabel(
                      imagePath:
                          user?.photoURL ?? Assets.images.profilepicture.path,
                      name: user?.displayName ?? "",
                      username: user?.email ?? "",
                      icon: Icons.photo_camera,
                    );
                  } else {
                    return const Text('No user data');
                  }
                },
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
                      AutoRouter.of(context)
                          .push(OrderwishlistViewRoute(showOrder: true));
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
                      AutoRouter.of(context).push(OrderwishlistViewRoute());
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
      ),
    );
  }
}
