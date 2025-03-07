// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:example/pages/addresses/addresses_view.dart' as _i1;
import 'package:example/pages/categorie_products/categorie_products_view.dart'
    as _i2;
import 'package:example/pages/categories/categories_view.dart' as _i3;
import 'package:example/pages/home/home_view.dart' as _i5;
import 'package:example/pages/mainpage/mainpage_view.dart' as _i6;
import 'package:example/pages/newaddress/newaddress_view.dart' as _i7;
import 'package:example/pages/newcard/newcard_view.dart' as _i8;
import 'package:example/pages/onboarding/onboarding_view.dart' as _i9;
import 'package:example/pages/payment/payment_view.dart' as _i11;
import 'package:example/pages/paymentmethods/paymentmethods_view.dart' as _i10;
import 'package:example/pages/product/product_view.dart' as _i12;
import 'package:example/pages/signin/signin_view.dart' as _i13;
import 'package:example/pages/signup/signup_view.dart' as _i14;
import 'package:example/pages/splash/splash_view.dart' as _i15;
import 'package:example/pages/verifiticion/verification_view.dart' as _i16;
import 'package:example/widgets/checkout.dart' as _i4;
import 'package:flutter/material.dart' as _i18;
import 'package:shopapp_widgets/shoapp_ui_kit.dart' as _i19;

/// generated route for
/// [_i1.AddressesView]
class AddressesViewRoute extends _i17.PageRouteInfo<AddressesViewRouteArgs> {
  AddressesViewRoute({
    _i18.Key? key,
    List<_i19.AddressBoxModal>? addressItems,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         AddressesViewRoute.name,
         args: AddressesViewRouteArgs(key: key, addressItems: addressItems),
         initialChildren: children,
       );

  static const String name = 'AddressesViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddressesViewRouteArgs>(
        orElse: () => const AddressesViewRouteArgs(),
      );
      return _i1.AddressesView(key: args.key, addressItems: args.addressItems);
    },
  );
}

class AddressesViewRouteArgs {
  const AddressesViewRouteArgs({this.key, this.addressItems});

  final _i18.Key? key;

  final List<_i19.AddressBoxModal>? addressItems;

  @override
  String toString() {
    return 'AddressesViewRouteArgs{key: $key, addressItems: $addressItems}';
  }
}

/// generated route for
/// [_i2.CategorieProductsView]
class CategorieProductsViewRoute extends _i17.PageRouteInfo<void> {
  const CategorieProductsViewRoute({List<_i17.PageRouteInfo>? children})
    : super(CategorieProductsViewRoute.name, initialChildren: children);

  static const String name = 'CategorieProductsViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i2.CategorieProductsView();
    },
  );
}

/// generated route for
/// [_i3.CategoriesView]
class CategoriesViewRoute extends _i17.PageRouteInfo<void> {
  const CategoriesViewRoute({List<_i17.PageRouteInfo>? children})
    : super(CategoriesViewRoute.name, initialChildren: children);

  static const String name = 'CategoriesViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i3.CategoriesView();
    },
  );
}

/// generated route for
/// [_i4.Checkout]
class CheckoutRoute extends _i17.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i18.Key? key,
    _i18.VoidCallback? buttonCallBack,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         CheckoutRoute.name,
         args: CheckoutRouteArgs(key: key, buttonCallBack: buttonCallBack),
         initialChildren: children,
       );

  static const String name = 'CheckoutRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckoutRouteArgs>(
        orElse: () => const CheckoutRouteArgs(),
      );
      return _i4.Checkout(key: args.key, buttonCallBack: args.buttonCallBack);
    },
  );
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({this.key, this.buttonCallBack});

  final _i18.Key? key;

  final _i18.VoidCallback? buttonCallBack;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, buttonCallBack: $buttonCallBack}';
  }
}

/// generated route for
/// [_i5.HomeView]
class HomeViewRoute extends _i17.PageRouteInfo<void> {
  const HomeViewRoute({List<_i17.PageRouteInfo>? children})
    : super(HomeViewRoute.name, initialChildren: children);

  static const String name = 'HomeViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeView();
    },
  );
}

/// generated route for
/// [_i6.MainpageView]
class MainpageViewRoute extends _i17.PageRouteInfo<MainpageViewRouteArgs> {
  MainpageViewRoute({
    _i18.Key? key,
    int? pageNo,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         MainpageViewRoute.name,
         args: MainpageViewRouteArgs(key: key, pageNo: pageNo),
         initialChildren: children,
       );

  static const String name = 'MainpageViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainpageViewRouteArgs>(
        orElse: () => const MainpageViewRouteArgs(),
      );
      return _i6.MainpageView(key: args.key, pageNo: args.pageNo);
    },
  );
}

class MainpageViewRouteArgs {
  const MainpageViewRouteArgs({this.key, this.pageNo});

  final _i18.Key? key;

  final int? pageNo;

  @override
  String toString() {
    return 'MainpageViewRouteArgs{key: $key, pageNo: $pageNo}';
  }
}

/// generated route for
/// [_i7.NewAddressView]
class NewAddressViewRoute extends _i17.PageRouteInfo<void> {
  const NewAddressViewRoute({List<_i17.PageRouteInfo>? children})
    : super(NewAddressViewRoute.name, initialChildren: children);

  static const String name = 'NewAddressViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i7.NewAddressView();
    },
  );
}

/// generated route for
/// [_i8.NewCardView]
class NewCardViewRoute extends _i17.PageRouteInfo<void> {
  const NewCardViewRoute({List<_i17.PageRouteInfo>? children})
    : super(NewCardViewRoute.name, initialChildren: children);

  static const String name = 'NewCardViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i8.NewCardView();
    },
  );
}

/// generated route for
/// [_i9.OnboardingView]
class OnboardingViewRoute extends _i17.PageRouteInfo<void> {
  const OnboardingViewRoute({List<_i17.PageRouteInfo>? children})
    : super(OnboardingViewRoute.name, initialChildren: children);

  static const String name = 'OnboardingViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnboardingView();
    },
  );
}

/// generated route for
/// [_i10.PaymentMethodsView]
class PaymentMethodsViewRoute extends _i17.PageRouteInfo<void> {
  const PaymentMethodsViewRoute({List<_i17.PageRouteInfo>? children})
    : super(PaymentMethodsViewRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodsViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i10.PaymentMethodsView();
    },
  );
}

/// generated route for
/// [_i11.PaymentView]
class PaymentViewRoute extends _i17.PageRouteInfo<void> {
  const PaymentViewRoute({List<_i17.PageRouteInfo>? children})
    : super(PaymentViewRoute.name, initialChildren: children);

  static const String name = 'PaymentViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i11.PaymentView();
    },
  );
}

/// generated route for
/// [_i12.ProductView]
class ProductViewRoute extends _i17.PageRouteInfo<void> {
  const ProductViewRoute({List<_i17.PageRouteInfo>? children})
    : super(ProductViewRoute.name, initialChildren: children);

  static const String name = 'ProductViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i12.ProductView();
    },
  );
}

/// generated route for
/// [_i13.SignInView]
class SignInViewRoute extends _i17.PageRouteInfo<void> {
  const SignInViewRoute({List<_i17.PageRouteInfo>? children})
    : super(SignInViewRoute.name, initialChildren: children);

  static const String name = 'SignInViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i13.SignInView();
    },
  );
}

/// generated route for
/// [_i14.SignUpView]
class SignUpViewRoute extends _i17.PageRouteInfo<void> {
  const SignUpViewRoute({List<_i17.PageRouteInfo>? children})
    : super(SignUpViewRoute.name, initialChildren: children);

  static const String name = 'SignUpViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i14.SignUpView();
    },
  );
}

/// generated route for
/// [_i15.SplashView]
class SplashViewRoute extends _i17.PageRouteInfo<SplashViewRouteArgs> {
  SplashViewRoute({
    _i18.Key? key,
    String? logoPath,
    String? splashText,
    List<_i17.PageRouteInfo>? children,
  }) : super(
         SplashViewRoute.name,
         args: SplashViewRouteArgs(
           key: key,
           logoPath: logoPath,
           splashText: splashText,
         ),
         initialChildren: children,
       );

  static const String name = 'SplashViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashViewRouteArgs>(
        orElse: () => const SplashViewRouteArgs(),
      );
      return _i15.SplashView(
        key: args.key,
        logoPath: args.logoPath,
        splashText: args.splashText,
      );
    },
  );
}

class SplashViewRouteArgs {
  const SplashViewRouteArgs({this.key, this.logoPath, this.splashText});

  final _i18.Key? key;

  final String? logoPath;

  final String? splashText;

  @override
  String toString() {
    return 'SplashViewRouteArgs{key: $key, logoPath: $logoPath, splashText: $splashText}';
  }
}

/// generated route for
/// [_i16.VerificationView]
class VerificationViewRoute extends _i17.PageRouteInfo<void> {
  const VerificationViewRoute({List<_i17.PageRouteInfo>? children})
    : super(VerificationViewRoute.name, initialChildren: children);

  static const String name = 'VerificationViewRoute';

  static _i17.PageInfo page = _i17.PageInfo(
    name,
    builder: (data) {
      return const _i16.VerificationView();
    },
  );
}
