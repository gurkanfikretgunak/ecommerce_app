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
  late final AuthState userState;
  String? userId;

  @override
  void initState() {
    super.initState();
    userState = context.read<AuthCubit>().state;
    if (userState is AuthAuthenticated) {
      userId = (userState as AuthAuthenticated).user!.id;
      _loadUserData();
    }
  }

  void _loadUserData() {
    if (userId != null) {
      context.read<BillingDetailCubit>().getBillingDetail(
            userId: userId!,
            isDefault: true,
          );
      context.read<PaymentMethodCubit>().getPaymentMethod(
            userId: userId!,
            isDefault: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: _handleOrderState,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, cartState) =>
            _buildCheckoutContent(context, cartState),
      ),
    );
  }

  void _handleOrderState(BuildContext context, OrderState orderState) {
    if (orderState is OrderSucces) {
      context.read<PaymentStepCubit>().nextStep();
    } else if (orderState is OrderError) {
      _showErrorToast(context, orderState.message);
    }
  }

  void _showErrorToast(BuildContext context, String message) {
    final toast = ToastMessageLabel(
      title: L10n.of(context)!.orderFailed,
      description: message,
      type: ToastType.error,
    );
    toast.show(context);
  }

  Widget _buildCheckoutContent(BuildContext context, CartState cartState) {
    if (cartState is CartLoading) {
      return const CircularProgressAnimation();
    } else if (cartState is CartLoaded) {
      return _buildCheckoutForm(context, cartState);
    } else {
      return _buildEmptyCart(context);
    }
  }

  Widget _buildEmptyCart(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: HeadText(
          text: L10n.of(context)!.cartIsEmpty,
          color: ColorConstant.instance.neutral1,
        ),
      ),
    );
  }

  Widget _buildCheckoutForm(BuildContext context, CartLoaded cartState) {
    return SingleChildScrollView(
      child: Column(
        children: [
          context.emptySizedHeightBoxNormal,
          _buildBillingAddressSection(),
          context.emptySizedHeightBoxNormal,
          _buildPaymentMethodSection(),
          context.emptySizedHeightBoxNormal,
          _buildProductList(context, cartState),
          context.emptySizedHeightBoxNormal,
          _buildOrderButton(context),
        ],
      ),
    );
  }

  Widget _buildBillingAddressSection() {
    return BlocBuilder<BillingDetailCubit, BillingDetailState>(
      builder: (context, billingDetailState) {
        if (billingDetailState is BillingDetailLoading) {
          return const Center(child: CircularProgressAnimation());
        } else if (billingDetailState is BillingDetailLoaded &&
            billingDetailState.billingDetail.isNotEmpty) {
          final billingDetail = billingDetailState.billingDetail.first;
          return AddressBoxModal(
            name: billingDetail.city ?? "N/A",
            address: billingDetail.address ?? "N/A",
            email: billingDetail.emailAddress ?? "N/A",
            phone: billingDetail.phoneNumber ?? "N/A",
            onTap: () => AutoRouter.of(context)
                .push(const AddressesViewRoute())
                .then((_) {
              if (userId != null) {
                context.read<BillingDetailCubit>().getBillingDetail(
                      userId: userId!,
                      isDefault: true,
                    );
              }
            }),
          );
        } else if (billingDetailState is BillingDetailSuccess ||
            billingDetailState is BillingDetailPatched) {
          _refreshBillingData();
          return const Center(child: CircularProgressAnimation());
        } else {
          return _buildNoAddressBox(context);
        }
      },
    );
  }

  void _refreshBillingData() {
    if (userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<BillingDetailCubit>().getBillingDetail(
              userId: userId!,
              isDefault: true,
            );
      });
    }
  }

  Widget _buildNoAddressBox(BuildContext context) {
    return AddressBoxModal(
      name: L10n.of(context)!.noData,
      address: L10n.of(context)!.pleaseUpdateAddress,
      email: L10n.of(context)!.noEmail,
      phone: L10n.of(context)!.noPhone,
      onTap: () =>
          AutoRouter.of(context).push(const AddressesViewRoute()).then((_) {
        if (userId != null) {
          context.read<BillingDetailCubit>().getBillingDetail(
                userId: userId!,
                isDefault: true,
              );
        }
      }),
    );
  }

  Widget _buildPaymentMethodSection() {
    return BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, paymentMethodState) {
        if (paymentMethodState is PaymentMethodLoading) {
          return const Center(child: CircularProgressAnimation());
        } else if (paymentMethodState is PaymentMethodLoaded &&
            paymentMethodState.paymentMethods.isNotEmpty) {
          final card = paymentMethodState.paymentMethods.first;
          return PaymentMethodBoxModal(
            onTap: () => AutoRouter.of(context)
                .push(const PaymentMethodsViewRoute())
                .then((_) {
              if (userId != null) {
                context.read<PaymentMethodCubit>().getPaymentMethod(
                      userId: userId!,
                      isDefault: true,
                    );
              }
            }),
            brand: card.card_brand,
            text: "${card.card_brand} Ending *****${card.card_last4}",
          );
        } else if (paymentMethodState is PaymentMethodSuccess ||
            paymentMethodState is PaymentMethodPatched) {
          _refreshPaymentData();
          return const Center(child: CircularProgressAnimation());
        } else {
          return _buildNoPaymentMethodBox(context);
        }
      },
    );
  }

  void _refreshPaymentData() {
    if (userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<PaymentMethodCubit>().getPaymentMethod(
              userId: userId!,
              isDefault: true,
            );
      });
    }
  }

  Widget _buildNoPaymentMethodBox(BuildContext context) {
    return PaymentMethodBoxModal(
      onTap: () => AutoRouter.of(context)
          .push(const PaymentMethodsViewRoute())
          .then((_) {
        if (userId != null) {
          context.read<PaymentMethodCubit>().getPaymentMethod(
                userId: userId!,
                isDefault: true,
              );
        }
      }),
      text: L10n.of(context)!.noPaymentMethodFound,
    );
  }

  Widget _buildProductList(BuildContext context, CartLoaded cartState) {
    return CheckoutListLayout(
      items: cartState.cart.map((item) {
        return ProductBoxModal(
          imagePath: item.product!.image,
          name: item.product!.name,
          price: item.product!.price,
          quantity: item.quantity,
          size: item.size,
          onTap: () {
            context.read<ProductCubit>().changeProduct(item.product!);
            AutoRouter.of(context).push(const ProductViewRoute());
          },
        );
      }).toList(),
    );
  }

  Widget _buildOrderButton(BuildContext context) {
    return CustomButton(
      onPressed: widget.buttonCallBack ?? _handleOrderPlacement,
      height: 50,
      text: L10n.of(context)!.orderNow,
    );
  }

  void _handleOrderPlacement() async {
    final cartState = context.read<CartCubit>().state;
    final billingState = context.read<BillingDetailCubit>().state;
    final paymentState = context.read<PaymentMethodCubit>().state;

    if (cartState is! CartLoaded || userId == null) {
      return;
    }

    final cartItems = cartState.cart;
    if (cartItems.isEmpty) {
      return;
    }

    if (billingState is! BillingDetailLoaded ||
        billingState.billingDetail.isEmpty ||
        paymentState is! PaymentMethodLoaded ||
        paymentState.paymentMethods.isEmpty) {
      _showMissingInfoToast(context);
      return;
    }

    await _createAndSubmitOrder(
      context,
      userId!,
      billingState.billingDetail.first,
      paymentState.paymentMethods.first,
      cartItems,
    );
  }

  void _showMissingInfoToast(BuildContext context) {
    ToastMessageLabel(
      title: L10n.of(context)!.noAddressOrPaymentMethod,
      description: L10n.of(context)!.addAddressAndPaymentMethod,
      type: ToastType.warning,
    ).show(context);
  }

  Future<void> _createAndSubmitOrder(
    BuildContext context,
    String userId,
    dynamic billingDetail,
    dynamic paymentMethod,
    List<dynamic> cartItems,
  ) async {
    final order = Order(
      user_id: userId,
      billing_name: '${billingDetail.firstName} ${billingDetail.lastName}',
      billing_address: billingDetail.address,
      billing_email: billingDetail.emailAddress,
      billing_phone: billingDetail.phoneNumber,
      payment_method_name: paymentMethod.name,
      payment_method_token: paymentMethod.token,
      total_price: await context.read<CartCubit>().getCartTotal(userId),
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

    context.read<OrderCubit>().postOrder(order, orderDetails);
  }
}
