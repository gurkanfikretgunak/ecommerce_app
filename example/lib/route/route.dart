import 'package:auto_route/auto_route.dart';
import 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Page')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashViewRoute.page, initial: true),
        AutoRoute(page: SignInViewRoute.page),
        AutoRoute(page: OnboardingViewRoute.page),
        AutoRoute(page: SignUpViewRoute.page),
        AutoRoute(page: VerificationViewRoute.page),
        AutoRoute(page: MainpageViewRoute.page),
      ];
}

final router = AppRouter();
