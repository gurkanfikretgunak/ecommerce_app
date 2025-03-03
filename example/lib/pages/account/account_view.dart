import 'package:example/gen/assets.gen.dart';
import 'package:example/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          },
          suffixIcon: Icons.arrow_forward_ios),
      const SettingsBoxLabel(
          icon: Icons.notifications_outlined,
          text: 'Noficiation',
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
        iconColor: ColorConstant.instance.secondary2,
        textColor: ColorConstant.instance.secondary2,
      ),
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.9;

    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
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
              AccountBoxLabel(
                imagePath: Assets.images.profilepicture.path,
                name: "Savannah Robertson",
                username: "@alexander02",
                icon: Icons.photo_camera,
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  CustomButton(
                    width: buttonWidth,
                    radius: 0,
                    height: 40,
                    color: ColorConstant.instance.neutral9,
                    onPressed: () {},
                    text: "My Order",
                    iconColor: ColorConstant.instance.neutral1,
                    textColor: ColorConstant.instance.neutral1,
                    icon: Icons.local_mall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    width: buttonWidth,
                    radius: 0,
                    height: 40,
                    color: ColorConstant.instance.neutral9,
                    onPressed: () {},
                    text: "Wishlist",
                    iconColor: ColorConstant.instance.neutral1,
                    textColor: ColorConstant.instance.neutral1,
                    icon: Icons.favorite,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
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
