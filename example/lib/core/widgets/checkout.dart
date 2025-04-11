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
import 'package:example/cubits/product/product_cubit.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/views/auth/models/auth_cubit.dart';
import 'package:example/views/auth/models/auth_state.dart';
import 'package:example/views/payment/models/payment_step_cubit.dart';
import 'package:flutter/material.dart';
import 'package:shopapp_widgets/shoapp_ui_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:example/cubits/cart/cart_cubit.dart';
import 'package:example/cubits/cart/cart_state.dart';

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
            title: 'Order Failed',
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
                      } else if (billingDetailState is BillingDetailError) {
                        return Text('Error: ${billingDetailState.message}');
                      } else {
                        return AddressBoxModal(
                          name: "No Data",
                          address: "Please update your address",
                          email: "No Email",
                          phone: "No Phone",
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
                      } else if (paymentMethodState is PaymentMethodLoaded) {
                        final card = paymentMethodState.paymentMethods.first;

                        return PaymentMethodBoxModal(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(const PaymentMethodsViewRoute());
                          },
                          text:
                              "${card.card_brand} Ending *****${card.card_last4}",
                        );
                      } else if (paymentMethodState is PaymentMethodError) {
                        return Text(
                            "Payment Method Error: ${paymentMethodState.message}");
                      } else {
                        return PaymentMethodBoxModal(
                          onTap: () {
                            AutoRouter.of(context)
                                .push(const PaymentMethodsViewRoute());
                          },
                          text: "No Payment Method Found",
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
                          if (cartState is CartLoaded &&
                              userState is AuthAuthenticated) {
                            final cartItems = cartState.cart;
                            if (cartItems.isNotEmpty) {
                              final order = Order(
                                user_id: userState.user!.id,
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
                                );
                              }).toList();

                              context
                                  .read<OrderCubit>()
                                  .postOrder(order, orderDetails);
                            }
                          }
                        },
                    height: 50,
                    text: "Order Now",
                  ),
                ],
              );
            } else {
              checkoutContent = SizedBox(
                height: 100,
                child: Center(
                  child: HeadText(
                    text: "Cart is Empty",
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
