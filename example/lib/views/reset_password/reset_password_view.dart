import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/validation/validation_cubit.dart';
import 'package:example/cubits/validation/validation_state.dart';
import 'package:example/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController emailController = TextEditingController();

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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ValidationCubit(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            text: L10n.of(context)!.resetPassword,
            onPressed: () {
              AutoRouter.of(context).push(const SignInViewRoute());
            },
            iconColor: ColorConstant.instance.neutral1,
          ),
        ),
        body: SafeArea(
          child: BlocListener<ValidationCubit, ValidationState>(
            listener: (context, state) {
              if (state is ValidationError) {
                showToast(
                  context,
                  L10n.of(context)!.validationError,
                  state.error,
                  ToastType.error,
                );
              }
            },
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
                      text: L10n.of(context)!.resetPasswordDescription,
                    ),
                  ),
                  context.emptySizedHeightBoxNormal,
                  BlocBuilder<ValidationCubit, ValidationState>(
                    builder: (context, validationState) {
                      bool isEmailValid = true;
                      String? emailErrorMessage;

                      if (validationState is EmailInvalid) {
                        isEmailValid = false;
                        emailErrorMessage = validationState.error;
                      }

                      return ResetPasswordFormLabel(
                        emailController: emailController,
                        emailLabelText: L10n.of(context)!.email,
                        emailHintText: L10n.of(context)!.enterEmail,
                        emailErrorMessage: emailErrorMessage,
                        onChangedEmail: (email) {
                          context.read<ValidationCubit>().validateEmail(email);
                        },
                        isEmailValid: isEmailValid,
                      );
                    },
                  ),
                  context.emptySizedHeightBoxNormal,
                  CustomButton(
                    text: L10n.of(context)!.resetPassword,
                    onPressed: () {
                      context
                          .read<ValidationCubit>()
                          .validateEmail(emailController.text);
                      if (context
                          .read<ValidationCubit>()
                          .isResetPasswordFormValid()) {
                        context
                            .read<AuthCubit>()
                            .resetPassword(emailController.text);
                        showToast(
                          context,
                          L10n.of(context)!.resetPasswordMailSent,
                          L10n.of(context)!.checkYourInbox,
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
