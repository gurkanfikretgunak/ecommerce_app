// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:example/core/network/models/categorie_model/categorie_model.dart'
    as _i25;
import 'package:example/core/widgets/checkout.dart' as _i5;
import 'package:example/views/account/account_view.dart' as _i1;
import 'package:example/views/addresses/addresses_view.dart' as _i2;
import 'package:example/views/auth/signin/signin_view.dart' as _i19;
import 'package:example/views/auth/signup/signup_view.dart' as _i20;
import 'package:example/views/categorie_products/categorie_products_view.dart'
    as _i3;
import 'package:example/views/categories/categories_view.dart' as _i4;
import 'package:example/views/filter/filter_view.dart' as _i6;
import 'package:example/views/home/home_view.dart' as _i7;
import 'package:example/views/mainpage/mainpage_view.dart' as _i8;
import 'package:example/views/newaddress/newaddress_view.dart' as _i9;
import 'package:example/views/newcard/newcard_view.dart' as _i10;
import 'package:example/views/notification/notification_view.dart' as _i11;
import 'package:example/views/onboarding/onboarding_view.dart' as _i12;
import 'package:example/views/orderwishlist/orderwishlist_view.dart' as _i13;
import 'package:example/views/payment/payment_view.dart' as _i15;
import 'package:example/views/paymentmethods/paymentmethods_view.dart' as _i14;
import 'package:example/views/product/product_view.dart' as _i16;
import 'package:example/views/profile/profile_view.dart' as _i17;
import 'package:example/views/search/search_view.dart' as _i18;
import 'package:example/views/splash/splash_view.dart' as _i21;
import 'package:example/views/verifiticion/verification_view.dart' as _i22;
import 'package:flutter/material.dart' as _i24;

/// generated route for
/// [_i1.AccountView]
class AccountViewRoute extends _i23.PageRouteInfo<void> {
  const AccountViewRoute({List<_i23.PageRouteInfo>? children})
    : super(AccountViewRoute.name, initialChildren: children);

  static const String name = 'AccountViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountView();
    },
  );
}

/// generated route for
/// [_i2.AddressesView]
class AddressesViewRoute extends _i23.PageRouteInfo<void> {
  const AddressesViewRoute({List<_i23.PageRouteInfo>? children})
    : super(AddressesViewRoute.name, initialChildren: children);

  static const String name = 'AddressesViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddressesView();
    },
  );
}

/// generated route for
/// [_i3.CategorieProductsView]
class CategorieProductsViewRoute
    extends _i23.PageRouteInfo<CategorieProductsViewRouteArgs> {
  CategorieProductsViewRoute({
    _i24.Key? key,
    required _i25.Categorie categorie,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         CategorieProductsViewRoute.name,
         args: CategorieProductsViewRouteArgs(key: key, categorie: categorie),
         initialChildren: children,
       );

  static const String name = 'CategorieProductsViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategorieProductsViewRouteArgs>();
      return _i3.CategorieProductsView(
        key: args.key,
        categorie: args.categorie,
      );
    },
  );
}

class CategorieProductsViewRouteArgs {
  const CategorieProductsViewRouteArgs({this.key, required this.categorie});

  final _i24.Key? key;

  final _i25.Categorie categorie;

  @override
  String toString() {
    return 'CategorieProductsViewRouteArgs{key: $key, categorie: $categorie}';
  }
}

/// generated route for
/// [_i4.CategoriesView]
class CategoriesViewRoute extends _i23.PageRouteInfo<void> {
  const CategoriesViewRoute({List<_i23.PageRouteInfo>? children})
    : super(CategoriesViewRoute.name, initialChildren: children);

  static const String name = 'CategoriesViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i4.CategoriesView();
    },
  );
}

/// generated route for
/// [_i5.Checkout]
class CheckoutRoute extends _i23.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i24.Key? key,
    _i24.VoidCallback? buttonCallBack,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         CheckoutRoute.name,
         args: CheckoutRouteArgs(key: key, buttonCallBack: buttonCallBack),
         initialChildren: children,
       );

  static const String name = 'CheckoutRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CheckoutRouteArgs>(
        orElse: () => const CheckoutRouteArgs(),
      );
      return _i5.Checkout(key: args.key, buttonCallBack: args.buttonCallBack);
    },
  );
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({this.key, this.buttonCallBack});

  final _i24.Key? key;

  final _i24.VoidCallback? buttonCallBack;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, buttonCallBack: $buttonCallBack}';
  }
}

/// generated route for
/// [_i6.FilterView]
class FilterViewRoute extends _i23.PageRouteInfo<void> {
  const FilterViewRoute({List<_i23.PageRouteInfo>? children})
    : super(FilterViewRoute.name, initialChildren: children);

  static const String name = 'FilterViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i6.FilterView();
    },
  );
}

/// generated route for
/// [_i7.HomeView]
class HomeViewRoute extends _i23.PageRouteInfo<void> {
  const HomeViewRoute({List<_i23.PageRouteInfo>? children})
    : super(HomeViewRoute.name, initialChildren: children);

  static const String name = 'HomeViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeView();
    },
  );
}

/// generated route for
/// [_i8.MainpageView]
class MainpageViewRoute extends _i23.PageRouteInfo<MainpageViewRouteArgs> {
  MainpageViewRoute({
    _i24.Key? key,
    int? pageNo,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         MainpageViewRoute.name,
         args: MainpageViewRouteArgs(key: key, pageNo: pageNo),
         initialChildren: children,
       );

  static const String name = 'MainpageViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainpageViewRouteArgs>(
        orElse: () => const MainpageViewRouteArgs(),
      );
      return _i8.MainpageView(key: args.key, pageNo: args.pageNo);
    },
  );
}

class MainpageViewRouteArgs {
  const MainpageViewRouteArgs({this.key, this.pageNo});

  final _i24.Key? key;

  final int? pageNo;

  @override
  String toString() {
    return 'MainpageViewRouteArgs{key: $key, pageNo: $pageNo}';
  }
}

/// generated route for
/// [_i9.NewAddressView]
class NewAddressViewRoute extends _i23.PageRouteInfo<void> {
  const NewAddressViewRoute({List<_i23.PageRouteInfo>? children})
    : super(NewAddressViewRoute.name, initialChildren: children);

  static const String name = 'NewAddressViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i9.NewAddressView();
    },
  );
}

/// generated route for
/// [_i10.NewCardView]
class NewCardViewRoute extends _i23.PageRouteInfo<void> {
  const NewCardViewRoute({List<_i23.PageRouteInfo>? children})
    : super(NewCardViewRoute.name, initialChildren: children);

  static const String name = 'NewCardViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i10.NewCardView();
    },
  );
}

/// generated route for
/// [_i11.NotificationView]
class NotificationViewRoute extends _i23.PageRouteInfo<void> {
  const NotificationViewRoute({List<_i23.PageRouteInfo>? children})
    : super(NotificationViewRoute.name, initialChildren: children);

  static const String name = 'NotificationViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i11.NotificationView();
    },
  );
}

/// generated route for
/// [_i12.OnboardingView]
class OnboardingViewRoute extends _i23.PageRouteInfo<void> {
  const OnboardingViewRoute({List<_i23.PageRouteInfo>? children})
    : super(OnboardingViewRoute.name, initialChildren: children);

  static const String name = 'OnboardingViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i12.OnboardingView();
    },
  );
}

/// generated route for
/// [_i13.OrderwishlistView]
class OrderwishlistViewRoute
    extends _i23.PageRouteInfo<OrderwishlistViewRouteArgs> {
  OrderwishlistViewRoute({
    _i24.Key? key,
    bool? showOrder,
    List<_i23.PageRouteInfo>? children,
  }) : super(
         OrderwishlistViewRoute.name,
         args: OrderwishlistViewRouteArgs(key: key, showOrder: showOrder),
         initialChildren: children,
       );

  static const String name = 'OrderwishlistViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderwishlistViewRouteArgs>(
        orElse: () => const OrderwishlistViewRouteArgs(),
      );
      return _i13.OrderwishlistView(key: args.key, showOrder: args.showOrder);
    },
  );
}

class OrderwishlistViewRouteArgs {
  const OrderwishlistViewRouteArgs({this.key, this.showOrder});

  final _i24.Key? key;

  final bool? showOrder;

  @override
  String toString() {
    return 'OrderwishlistViewRouteArgs{key: $key, showOrder: $showOrder}';
  }
}

/// generated route for
/// [_i14.PaymentMethodsView]
class PaymentMethodsViewRoute extends _i23.PageRouteInfo<void> {
  const PaymentMethodsViewRoute({List<_i23.PageRouteInfo>? children})
    : super(PaymentMethodsViewRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodsViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i14.PaymentMethodsView();
    },
  );
}

/// generated route for
/// [_i15.PaymentView]
class PaymentViewRoute extends _i23.PageRouteInfo<PaymentViewRouteArgs> {
  PaymentViewRoute({_i24.Key? key, List<_i23.PageRouteInfo>? children})
    : super(
        PaymentViewRoute.name,
        args: PaymentViewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'PaymentViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentViewRouteArgs>(
        orElse: () => const PaymentViewRouteArgs(),
      );
      return _i15.PaymentView(key: args.key);
    },
  );
}

class PaymentViewRouteArgs {
  const PaymentViewRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'PaymentViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.ProductView]
class ProductViewRoute extends _i23.PageRouteInfo<void> {
  const ProductViewRoute({List<_i23.PageRouteInfo>? children})
    : super(ProductViewRoute.name, initialChildren: children);

  static const String name = 'ProductViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProductView();
    },
  );
}

/// generated route for
/// [_i17.ProfileView]
class ProfileViewRoute extends _i23.PageRouteInfo<ProfileViewRouteArgs> {
  ProfileViewRoute({_i24.Key? key, List<_i23.PageRouteInfo>? children})
    : super(
        ProfileViewRoute.name,
        args: ProfileViewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ProfileViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileViewRouteArgs>(
        orElse: () => const ProfileViewRouteArgs(),
      );
      return _i17.ProfileView(key: args.key);
    },
  );
}

class ProfileViewRouteArgs {
  const ProfileViewRouteArgs({this.key});

  final _i24.Key? key;

  @override
  String toString() {
    return 'ProfileViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.SearchView]
class SearchViewRoute extends _i23.PageRouteInfo<void> {
  const SearchViewRoute({List<_i23.PageRouteInfo>? children})
    : super(SearchViewRoute.name, initialChildren: children);

  static const String name = 'SearchViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i18.SearchView();
    },
  );
}

/// generated route for
/// [_i19.SignInView]
class SignInViewRoute extends _i23.PageRouteInfo<void> {
  const SignInViewRoute({List<_i23.PageRouteInfo>? children})
    : super(SignInViewRoute.name, initialChildren: children);

  static const String name = 'SignInViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i19.SignInView();
    },
  );
}

/// generated route for
/// [_i20.SignUpView]
class SignUpViewRoute extends _i23.PageRouteInfo<void> {
  const SignUpViewRoute({List<_i23.PageRouteInfo>? children})
    : super(SignUpViewRoute.name, initialChildren: children);

  static const String name = 'SignUpViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i20.SignUpView();
    },
  );
}

/// generated route for
/// [_i21.SplashView]
class SplashViewRoute extends _i23.PageRouteInfo<SplashViewRouteArgs> {
  SplashViewRoute({
    _i24.Key? key,
    String? logoPath,
    String? splashText,
    List<_i23.PageRouteInfo>? children,
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

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashViewRouteArgs>(
        orElse: () => const SplashViewRouteArgs(),
      );
      return _i21.SplashView(
        key: args.key,
        logoPath: args.logoPath,
        splashText: args.splashText,
      );
    },
  );
}

class SplashViewRouteArgs {
  const SplashViewRouteArgs({this.key, this.logoPath, this.splashText});

  final _i24.Key? key;

  final String? logoPath;

  final String? splashText;

  @override
  String toString() {
    return 'SplashViewRouteArgs{key: $key, logoPath: $logoPath, splashText: $splashText}';
  }
}

/// generated route for
/// [_i22.VerificationView]
class VerificationViewRoute extends _i23.PageRouteInfo<void> {
  const VerificationViewRoute({List<_i23.PageRouteInfo>? children})
    : super(VerificationViewRoute.name, initialChildren: children);

  static const String name = 'VerificationViewRoute';

  static _i23.PageInfo page = _i23.PageInfo(
    name,
    builder: (data) {
      return const _i22.VerificationView();
    },
  );
}
