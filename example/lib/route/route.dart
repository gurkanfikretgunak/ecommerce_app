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
        AutoRoute(page: CategoriesViewRoute.page),
        AutoRoute(page: CategorieProductsViewRoute.page),
        AutoRoute(page: ProductViewRoute.page),
        AutoRoute(page: PaymentViewRoute.page),
        AutoRoute(page: CheckoutRoute.page),
        AutoRoute(page: AddressesViewRoute.page),
        AutoRoute(page: NewAddressViewRoute.page),
        AutoRoute(page: PaymentMethodsViewRoute.page),
        AutoRoute(page: NewCardViewRoute.page),
        AutoRoute(page: FilterViewRoute.page),
        AutoRoute(page: SearchViewRoute.page),
        AutoRoute(page: AccountViewRoute.page),
        AutoRoute(page: ProfileViewRoute.page),
        AutoRoute(page: OrderwishlistViewRoute.page),
        AutoRoute(page: NotificationViewRoute.page),
      ];
}

final router = AppRouter();
