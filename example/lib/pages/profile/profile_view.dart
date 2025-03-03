import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final List<AccountInfoBoxLabel> accountBoxItems = [
    const AccountInfoBoxLabel(
      title: "Name",
      value: "Savannah",
    ),
    const AccountInfoBoxLabel(
      title: "Date of birth",
      value: "Aug 21,1992",
    ),
    const AccountInfoBoxLabel(
      title: "Phone Number",
      value: "(214) 429 0123",
    ),
    const AccountInfoBoxLabel(
      title: "Gender",
      value: "Female",
    ),
    const AccountInfoBoxLabel(
      title: "Email",
      value: "Bill.sanders@example.com",
    ),
    const AccountInfoBoxLabel(
      title: "Region",
      value: "United States",
    ),
    AccountInfoBoxLabel(
      title: "Password",
      value: "Change Password",
      valueColor: ColorConstant.instance.primary_main,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.instance.neutral9,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: "Profile",
          onPressed: () {
            Navigator.pop(context);
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
              context.emptySizedHeightBoxNormal,
              AccountInfoBoxColumnLayout(items: accountBoxItems),
            ],
          ),
        ),
      ),
    );
  }
}
