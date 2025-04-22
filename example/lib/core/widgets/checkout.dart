import 'package:auto_route/auto_route.dart';
import 'package:example/core/gen/assets.gen.dart';
import 'package:example/core/network/models/order_detail_model/order_detail_model.dart';
import 'package:example/core/network/models/order_model/order_model.dart';
import 'package:example/cubits/billing_detail/billing_detail_cubit.dart';
import 'package:example/cubits/billing_detail/billing_detail_state.dart';
import 'package:example/cubits/order/order_cubit.dart';
import 'package:example/cubits/order/order_state.dart';
import 'package:example/cubits/payment_method/payment_method_cubit.dart';
import 'package:example/cubits/payment_method/payment_method_state.dart';
import 'package:example/cubits/payment_step/payment_step_cubit.dart';
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/cubits/auth/auth_cubit.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/cart/cart_state.dart';
import 'package:example/l10n/app_l10n.dart';

@RoutePage()
class Checkout extends StatefulWidget {
  final VoidCallback? buttonCallBack;
  const Checkout({super.key, this.buttonCallBack});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late final userState;

  @override
  void initState() {
    super.initState();
    userState = context.read<AuthCubit>().state;

    if (userState is AuthAuthenticated) {
      final userId = userState.user!.id;
      context
          .read<BillingDetailCubit>()
          .getBillingDetail(userId: userId, isDefault: true);
      context
          .read<PaymentMethodCubit>()
          .getPaymentMethod(userId: userId, isDefault: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, orderState) {
        if (orderState is OrderSucces) {
          context.read<PaymentStepCubit>().nextStep();
        } else if (orderState is OrderError) {
          final toast = ToastMessageLabel(
            title: L10n.of(context)!.orderFailed,
            description: orderState.message,
            type: ToastType.error,
          );
          toast.show(context);
        }
      },
      child: BlocProvider(
        create: (_) => BillingDetailCubit(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            Widget checkoutContent;

            if (cartState is CartLoading) {
              checkoutContent =
                  const Center(child: CircularProgressIndicator());
            } else if (cartState is CartLoaded) {
              context.read<BillingDetailCubit>().getBillingDetail(
                  userId: userState.user!.id, isDefault: true);
              checkoutContent = Column(
                children: [
                  context.emptySizedHeightBoxNormal,
                  BlocBuilder<BillingDetailCubit, BillingDetailState>(
                    builder: (context, billingDetailState) {
                      if (billingDetailState is BillingDetailLoading) {
                        context.read<BillingDetailCubit>().getBillingDetail(
                            userId: userState.user!.id, isDefault: true);
                        return const Center(child: CircularProgressIndicator());
                      } else if (billingDetailState is BillingDetailLoaded) {
                        final billingDetail = billingDetailState.billingDetail;

                        return AddressBoxModal(
                          name: billingDetail.first.city ?? "N/A",
                          address: billingDetail.first.address ?? "N/A",
                          email: billingDetail.first.emailAddress ?? "N/A",
                          phone: billingDetail.first.phoneNumber ?? "N/A",
                          onTap: () {
                            AutoRouter.of(context)
                                .push(const AddressesViewRoute());
                          },
                        );
                      } else if (billingDetailState is BillingDetailPatched) {
                        context
                            .read<BillingDetailCubit>()
                            .getBillingDetail(userId: userState.user!.id);
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return AddressBoxModal(
                          name: L10n.of(context)!.noData,
                          address: L10n.of(context)!.pleaseUpdateAddress,
                          email: L10n.of(context)!.noEmail,
                          phone: L10n.of(context)!.noPhone,
                          onTap: () {
                            AutoRouter.of(context)
                                .push(const AddressesViewRoute());
                          },
                        );
                      }
                    },
                  ),
                  context.emptySizedHeightBoxNormal,
                  BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
                    builder: (context, paymentMethodState) {
                      if (paymentMethodState is PaymentMethodLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (paymentMethodState is PaymentMethodSuccess) {
                        context
                            .read<PaymentMethodCubit>()
                            .getPaymentMethod(userId: userState.user!.id);
                        return const Center(child: CircularProgressIndicator());
                      } else if (paymentMethodState is PaymentMethodPatched) {
                        context
                            .read<PaymentMethodCubit>()
                            .getPaymentMethod(userId: userState.user!.id);
                        return const Center(child: CircularProgressIndicator());
                      } else if (paymentMethodState is PaymentMethodLoaded) {
                        final card = paymentMethodState.paymentMethods.first;

                        return PaymentMethodBoxModal(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(const PaymentMethodsViewRoute());
                          },
                          brand: card.card_brand,
                          text:
                              "${card.card_brand} Ending *****${card.card_last4}",
                        );
                      } else {
                        return PaymentMethodBoxModal(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(const PaymentMethodsViewRoute());
                          },
                          text: L10n.of(context)!.noPaymentMethodFound,
                        );
                      }
                    },
                  ),
                  context.emptySizedHeightBoxNormal,
                  CheckoutListLayout(
                    items: cartState.cart.map((item) {
                      return ProductBoxModal(
                        imagePath: item.product!.image,
                        name: item.product!.name,
                        price: item.product!.price,
                        quantity: item.quantity,
                        size: item.size,
                        onTap: () {
                          context
                              .read<ProductCubit>()
                              .changeProduct(item.product!);
                          AutoRouter.of(context).push(const ProductViewRoute());
                        },
                      );
                    }).toList(),
                  ),
                  context.emptySizedHeightBoxNormal,
                  CustomButton(
                    onPressed: widget.buttonCallBack ??
                        () async {
                          final cartState = context.read<CartCubit>().state;
                          final billingState =
                              context.read<BillingDetailCubit>().state;
                          final paymentState =
                              context.read<PaymentMethodCubit>().state;

                          if (cartState is CartLoaded &&
                              userState is AuthAuthenticated) {
                            final cartItems = cartState.cart;

                            if (cartItems.isNotEmpty) {
                              if (billingState is! BillingDetailLoaded ||
                                  billingState.billingDetail.isEmpty ||
                                  (paymentState is! PaymentMethodLoaded ||
                                      paymentState.paymentMethods.isEmpty)) {
                                ToastMessageLabel(
                                  title: L10n.of(context)!
                                      .noAddressOrPaymentMethod,
                                  description: L10n.of(context)!
                                      .addAddressAndPaymentMethod,
                                  type: ToastType.warning,
                                ).show(context);

                                return;
                              }

                              final billingDetail =
                                  billingState.billingDetail.first;
                              final paymentMethod =
                                  paymentState.paymentMethods.first;

                              final order = Order(
                                user_id: userState.user!.id,
                                billing_name:
                                    ' ${billingDetail.firstName} ${billingDetail.lastName}',
                                billing_address: billingDetail.address,
                                billing_email: billingDetail.emailAddress,
                                billing_phone: billingDetail.phoneNumber,
                                payment_method_name: paymentMethod.name,
                                payment_method_token: paymentMethod.token,
                                total_price: await context
                                    .read<CartCubit>()
                                    .getCartTotal(userState.user.id),
                              );
                              final orderDetails = cartItems.map((item) {
                                return OrderDetail(
                                  product_id: item.productId,
                                  quantity: item.quantity,
                                  unit_price: item.unitPrice,
                                  color: item.color,
                                  size: item.size,
                                  image: item.product!.image,
                                  name: item.product!.name,
                                );
                              }).toList();

                              context
                                  .read<OrderCubit>()
                                  .postOrder(order, orderDetails);
                            }
                          }
                        },
                    height: 50,
                    text: L10n.of(context)!.orderNow,
                  ),
                ],
              );
            } else {
              checkoutContent = SizedBox(
                height: 100,
                child: Center(
                  child: HeadText(
                    text: L10n.of(context)!.cartIsEmpty,
                    color: ColorConstant.instance.neutral1,
                  ),
                ),
              );
            }

            return SingleChildScrollView(child: checkoutContent);
          },
        ),
      ),
    );
  }
}
