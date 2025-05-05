// lib/core/network/services/deeplink/deeplink_service.dart

import 'package:app_links/app_links.dart';
import 'package:example/flavors/main_dev.dart';
import 'package:example/route/route.gr.dart';
import 'package:example/core/network/services/auth/auth_service.dart';
import 'package:example/main.dart';

class DeeplinkService {
  static final DeeplinkService _instance = DeeplinkService._internal();
  factory DeeplinkService() => _instance;
  DeeplinkService._internal();

  final _appLinks = AppLinks();
  final _authService = AuthService();

  Future<void> initialize() async {
    _appLinks.uriLinkStream.listen((uri) {
      handleDeeplink(uri);
    });
  }

  Future<Uri?> getInitialLink() async {
    return await _appLinks.getInitialAppLink();
  }

  Future<void> handleDeeplink(Uri uri) async {
    if (uri.toString().contains('login-callback')) {
      await _handleAuthCallback(uri);
    }
  }

  Future<void> _handleAuthCallback(Uri uri) async {
    try {
      final user = await _authService.getSessionFromUrl(uri);

      if (user != null) {
        _navigateToMainPage();
      } else {
        _navigateToOnboarding();
      }
    } catch (e) {
      _navigateToOnboarding();
    }
  }

  void _navigateToMainPage() {
    appRouter.replaceAll([MainpageViewRoute()]);
  }

  void _navigateToOnboarding() {
    appRouter.replace(const OnboardingViewRoute());
  }
}
