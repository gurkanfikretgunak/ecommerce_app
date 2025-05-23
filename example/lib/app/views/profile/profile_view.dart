import 'package:auto_route/auto_route.dart';
import 'package:example/core/cubits/auth/auth_cubit.dart';
import 'package:example/core/cubits/auth/auth_state.dart';
import 'package:example/core/cubits/profile_picture/profile_picture_cubit.dart';
import 'package:example/core/cubits/profile_picture/profile_picture_state.dart';
import 'package:example/app/l10n/app_l10n.dart';
import 'package:example/app/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late List<AccountInfoBoxLabel> accountBoxItems;

  void showToast(
      BuildContext context, String title, String description, ToastType type) {
    final toast = ToastMessageLabel(
      title: title,
      description: description,
      type: type,
    );
    toast.show(context);
  }

  void _showChangeProfilePictureDialog(String userId, String? imagePath) {
    final profileCubit = context.read<ProfilePictureCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return ChangeProfilePictureLabel(
          title: L10n.of(context)!.changeProfilePicture,
          imagePath: imagePath,
          description: L10n.of(context)!.selectNewProfilePicture,
          buttonText: L10n.of(context)!.save,
          onImageSelected: (newImagePath) {
            profileCubit.uploadProfilePicture(userId, newImagePath);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          text: L10n.of(context)!.profile,
          onPressed: () => Navigator.pop(context),
          iconColor: ColorConstant.instance.neutral1,
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          if (authState is AuthLoading) {
            return const Center(child: CircularProgressAnimation());
          } else if (authState is AuthAuthenticated) {
            final user = authState.user;
            return BlocConsumer<ProfilePictureCubit, ProfilePictureState>(
              listener: (context, state) {
                if (state is ProfilePictureUploaded) {
                  showToast(
                    context,
                    L10n.of(context)!.profilePictureChanged,
                    L10n.of(context)!.profilePictureUpdatedSuccessfully,
                    ToastType.success,
                  );
                  context.read<AuthCubit>().getCurrentUser();
                } else if (state is ProfilePictureError) {
                  showToast(
                    context,
                    "Error",
                    state.message,
                    ToastType.error,
                  );
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        AccountBoxLabel(
                          imagePath: user.profile_picture ?? "",
                          name: user.display_name ?? "",
                          username: user.email ?? "",
                          icon: Icons.edit,
                          onPicturePressed: () {
                            _showChangeProfilePictureDialog(
                                user.id, user.profile_picture);
                          },
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
                              onTap: () {
                                AutoRouter.of(context).push(
                                  const ChangePasswordViewRoute(),
                                );
                              },
                              title: L10n.of(context)!.password,
                              value: L10n.of(context)!.changePassword,
                              valueColor: ColorConstant.instance.primary_main,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (authState is AuthUnauthenticated) {
            AutoRouter.of(context).replace(const SignInViewRoute());
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
