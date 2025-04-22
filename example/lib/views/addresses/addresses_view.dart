import 'package:auto_route/auto_route.dart';
import 'package:example/cubits/billing_detail/billing_detail_cubit.dart';
import 'package:example/cubits/billing_detail/billing_detail_state.dart';
import 'package:example/l10n/app_l10n.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AddressesView extends StatefulWidget {
  const AddressesView({super.key});

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  late final userState;

  @override
  void initState() {
    super.initState();
    userState = context.read<AuthCubit>().state;
    context
        .read<BillingDetailCubit>()
        .getBillingDetail(userId: userState.user!.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            text: L10n.of(context)!.address,
            onPressed: () {
              AutoRouter.of(context).push(PaymentViewRoute(initialStep: 1));
            },
            iconColor: ColorConstant.instance.neutral1,
          ),
        ),
        body: BlocListener<BillingDetailCubit, BillingDetailState>(
          listener: (context, state) {},
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<BillingDetailCubit, BillingDetailState>(
                  builder: (context, state) {
                    if (state is BillingDetailLoading) {
                      context
                          .read<BillingDetailCubit>()
                          .getBillingDetail(userId: userState.user!.id);
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is BillingDetailPatched) {
                      context
                          .read<BillingDetailCubit>()
                          .getBillingDetail(userId: userState.user!.id);
                    } else if (state is BillingDetailLoaded) {
                      if (state.billingDetail.isEmpty) {
                        return Center(
                          child: HeadText(
                            text: "No Address Found",
                            color: ColorConstant.instance.neutral1,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: AddressesColumnLayout(
                          deleteBillingDetailCallBack: (index) {
                            context
                                .read<BillingDetailCubit>()
                                .deleteBillingDetail(
                                    state.billingDetail[index].id!);
                          },
                          addressItems: state.billingDetail
                              .map((item) {
                                return AddressBoxModal(
                                  name: item.city!,
                                  address: item.address!,
                                  email: item.emailAddress!,
                                  phone: item.phoneNumber!,
                                  isSelected: item.isDefault!,
                                  onTap: () {
                                    context
                                        .read<BillingDetailCubit>()
                                        .patchBillingDetail(item.id!);
                                  },
                                );
                              })
                              .toList()
                              .reversed
                              .toList(),
                        ),
                      );
                    } else if (state is BillingDetailError) {
                      return Center(
                        child: ContentText(
                            text: "Failed to load billing details.",
                            color: ColorConstant.instance.neutral1),
                      );
                    }
                    return const Center(
                      child: ContentText(text: "Unexpected state."),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: CustomButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const NewAddressViewRoute());
                    },
                    height: 50,
                    text: L10n.of(context)!.addNewAddress),
              ),
            ],
          ),
        ));
  }
}
