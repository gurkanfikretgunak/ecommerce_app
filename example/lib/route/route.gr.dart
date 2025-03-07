// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:example/pages/home/home_view.dart' as _i1;
import 'package:example/pages/splash/splash_view.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i3.PageRouteInfo<void> {
  const HomeViewRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeViewRoute.name, initialChildren: children);

  static const String name = 'HomeViewRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeView();
    },
  );
}

/// generated route for
/// [_i2.SplashView]
class SplashViewRoute extends _i3.PageRouteInfo<SplashViewRouteArgs> {
  SplashViewRoute({
    _i4.Key? key,
    String? logoPath,
    String? splashText,
    List<_i3.PageRouteInfo>? children,
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

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashViewRouteArgs>(
        orElse: () => const SplashViewRouteArgs(),
      );
      return _i2.SplashView(
        key: args.key,
        logoPath: args.logoPath,
        splashText: args.splashText,
      );
    },
  );
}

class SplashViewRouteArgs {
  const SplashViewRouteArgs({this.key, this.logoPath, this.splashText});

  final _i4.Key? key;

  final String? logoPath;

  final String? splashText;

  @override
  String toString() {
    return 'SplashViewRouteArgs{key: $key, logoPath: $logoPath, splashText: $splashText}';
  }
}
