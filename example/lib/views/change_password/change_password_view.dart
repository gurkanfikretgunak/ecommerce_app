import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/cubits/validation/validation_state.dart';
import 'package:example/l10n/app_l10n.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';

@RoutePage()
class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newConfirmPasswordController =
      TextEditingController();

  void showToast(
      BuildContext context, String title, String description, ToastType type) {
    final toast = ToastMessageLabel(
      title: title,
      description: description,
      type: type,
    );
    toast.show(context);
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    newConfirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ValidationCubit()),
      ],
      child: Scaffold(
        appBar: CustomAppbar(
          text: L10n.of(context)!.changePassword,
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: ColorConstant.instance.neutral1,
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthUnauthenticated) {
              AutoRouter.of(context).replaceAll([const SignInViewRoute()]);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Icon(
                    Icons.lock_reset,
                    size: 70,
                    color: ColorConstant.instance.neutral4,
                  ),
                  context.emptySizedHeightBoxNormal,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ContentText(
                      color: ColorConstant.instance.neutral1,
                      textAlign: TextAlign.start,
                      softWrap: true,
                      text: L10n.of(context)!.changePasswordInstruction,
                    ),
                  ),
                  context.emptySizedHeightBoxNormal,
                  BlocConsumer<ValidationCubit, ValidationState>(
                    listener: (context, state) {},
                    builder: (context, validationState) {
                      bool isCurrentPasswordValid = true;
                      bool isNewPasswordValid = true;
                      bool isNewConfirmPasswordValid = true;
                      String? currentPasswordErrorMessage;
                      String? newPasswordErrorMessage;
                      String? newConfirmPasswordErrorMessage;

                      if (validationState is CurrentPasswordInvalid) {
                        isCurrentPasswordValid = false;
                        currentPasswordErrorMessage = validationState.error;
                      }

                      if (validationState is PasswordInvalid) {
                        isNewPasswordValid = false;
                        newPasswordErrorMessage = validationState.error;
                      }

                      if (validationState is ConfirmPasswordInvalid) {
                        isNewConfirmPasswordValid = false;
                        newConfirmPasswordErrorMessage = validationState.error;
                      }

                      return ChangePasswordFormLabel(
                        currentPasswordController: currentPasswordController,
                        newPasswordController: newPasswordController,
                        newConfirmPasswordController:
                            newConfirmPasswordController,
                        onChangedcurrentPassword: (currentPassword) {
                          context
                              .read<ValidationCubit>()
                              .validateCurrentPassword(currentPassword);
                        },
                        onChangedNewPassword: (password) {
                          context
                              .read<ValidationCubit>()
                              .validatePassword(password);
                        },
                        onChangedNewConfirmPassword: (confirmPassword) {
                          context
                              .read<ValidationCubit>()
                              .validateConfirmPassword(
                                  confirmPassword, newPasswordController.text);
                        },
                        currentPasswordHintText:
                            L10n.of(context)!.currentPasswordHint,
                        newPasswordHintText: L10n.of(context)!.newPasswordHint,
                        newConfirmPasswordHintText:
                            L10n.of(context)!.confirmNewPasswordHint,
                        newPasswordErrorMessage: newPasswordErrorMessage,
                        newConfirmPasswordErrorMessage:
                            newConfirmPasswordErrorMessage,
                        iscurrentPasswordValid: isCurrentPasswordValid,
                        isNewPasswordValid: isNewPasswordValid,
                        isNewConfirmPasswordValid: isNewConfirmPasswordValid,
                        currentPasswordErrorMessage:
                            currentPasswordErrorMessage,
                      );
                    },
                  ),
                  context.emptySizedHeightBoxNormal,
                  BlocBuilder<ValidationCubit, ValidationState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: L10n.of(context)!.resetPassword,
                        onPressed: () {
                          if (context
                              .read<ValidationCubit>()
                              .isChangePasswordFormValid()) {
                            context
                                .read<AuthCubit>()
                                .updatePassword(newPasswordController.text);
                            showToast(
                              context,
                              L10n.of(context)!.passwordChangedTitle,
                              L10n.of(context)!.passwordChangedDescription,
                              ToastType.success,
                            );
                          } else {
                            showToast(
                              context,
                              L10n.of(context)!.formError,
                              L10n.of(context)!.pleaseFixErrors,
                              ToastType.error,
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
