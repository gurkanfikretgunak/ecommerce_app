import 'package:auto_route/auto_route.dart';
import 'package:example/pages/account/account_view.dart';
import 'package:example/pages/mainpage/mainpage_view.dart';
import 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashViewRoute.page, initial: true),
      ];
}

final router = AppRouter();
