// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:example/pages/categorie_products/categorie_products_view.dart'
    as _i1;
import 'package:example/pages/categories/categories_view.dart' as _i2;
import 'package:example/pages/home/home_view.dart' as _i3;
import 'package:example/pages/mainpage/mainpage_view.dart' as _i4;
import 'package:example/pages/onboarding/onboarding_view.dart' as _i5;
import 'package:example/pages/product/product_view.dart' as _i6;
import 'package:example/pages/signin/signin_view.dart' as _i7;
import 'package:example/pages/signup/signup_view.dart' as _i8;
import 'package:example/pages/splash/splash_view.dart' as _i9;
import 'package:example/pages/verifiticion/verification_view.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.CategorieProductsView]
class CategorieProductsViewRoute extends _i11.PageRouteInfo<void> {
  const CategorieProductsViewRoute({List<_i11.PageRouteInfo>? children})
    : super(CategorieProductsViewRoute.name, initialChildren: children);

  static const String name = 'CategorieProductsViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.CategorieProductsView();
    },
  );
}

/// generated route for
/// [_i2.CategoriesView]
class CategoriesViewRoute extends _i11.PageRouteInfo<void> {
  const CategoriesViewRoute({List<_i11.PageRouteInfo>? children})
    : super(CategoriesViewRoute.name, initialChildren: children);

  static const String name = 'CategoriesViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.CategoriesView();
    },
  );
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<void> {
  const HomeViewRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeViewRoute.name, initialChildren: children);

  static const String name = 'HomeViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeView();
    },
  );
}

/// generated route for
/// [_i4.MainpageView]
class MainpageViewRoute extends _i11.PageRouteInfo<MainpageViewRouteArgs> {
  MainpageViewRoute({
    _i12.Key? key,
    int? pageNo,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         MainpageViewRoute.name,
         args: MainpageViewRouteArgs(key: key, pageNo: pageNo),
         initialChildren: children,
       );

  static const String name = 'MainpageViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainpageViewRouteArgs>(
        orElse: () => const MainpageViewRouteArgs(),
      );
      return _i4.MainpageView(key: args.key, pageNo: args.pageNo);
    },
  );
}

class MainpageViewRouteArgs {
  const MainpageViewRouteArgs({this.key, this.pageNo});

  final _i12.Key? key;

  final int? pageNo;

  @override
  String toString() {
    return 'MainpageViewRouteArgs{key: $key, pageNo: $pageNo}';
  }
}

/// generated route for
/// [_i5.OnboardingView]
class OnboardingViewRoute extends _i11.PageRouteInfo<void> {
  const OnboardingViewRoute({List<_i11.PageRouteInfo>? children})
    : super(OnboardingViewRoute.name, initialChildren: children);

  static const String name = 'OnboardingViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingView();
    },
  );
}

/// generated route for
/// [_i6.ProductView]
class ProductViewRoute extends _i11.PageRouteInfo<void> {
  const ProductViewRoute({List<_i11.PageRouteInfo>? children})
    : super(ProductViewRoute.name, initialChildren: children);

  static const String name = 'ProductViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProductView();
    },
  );
}

/// generated route for
/// [_i7.SignInView]
class SignInViewRoute extends _i11.PageRouteInfo<void> {
  const SignInViewRoute({List<_i11.PageRouteInfo>? children})
    : super(SignInViewRoute.name, initialChildren: children);

  static const String name = 'SignInViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignInView();
    },
  );
}

/// generated route for
/// [_i8.SignUpView]
class SignUpViewRoute extends _i11.PageRouteInfo<void> {
  const SignUpViewRoute({List<_i11.PageRouteInfo>? children})
    : super(SignUpViewRoute.name, initialChildren: children);

  static const String name = 'SignUpViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignUpView();
    },
  );
}

/// generated route for
/// [_i9.SplashView]
class SplashViewRoute extends _i11.PageRouteInfo<SplashViewRouteArgs> {
  SplashViewRoute({
    _i12.Key? key,
    String? logoPath,
    String? splashText,
    List<_i11.PageRouteInfo>? children,
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

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashViewRouteArgs>(
        orElse: () => const SplashViewRouteArgs(),
      );
      return _i9.SplashView(
        key: args.key,
        logoPath: args.logoPath,
        splashText: args.splashText,
      );
    },
  );
}

class SplashViewRouteArgs {
  const SplashViewRouteArgs({this.key, this.logoPath, this.splashText});

  final _i12.Key? key;

  final String? logoPath;

  final String? splashText;

  @override
  String toString() {
    return 'SplashViewRouteArgs{key: $key, logoPath: $logoPath, splashText: $splashText}';
  }
}

/// generated route for
/// [_i10.VerificationView]
class VerificationViewRoute extends _i11.PageRouteInfo<void> {
  const VerificationViewRoute({List<_i11.PageRouteInfo>? children})
    : super(VerificationViewRoute.name, initialChildren: children);

  static const String name = 'VerificationViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.VerificationView();
    },
  );
}
