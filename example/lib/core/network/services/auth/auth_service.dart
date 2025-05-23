import 'package:example/core/network/services/auth/supabase_initialize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class AuthService {
  final auth = SupabaseInitialize.client.auth;

  Future<User?> getCurrentUser() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final response = await auth.signUp(email: email, password: password);
      return response.user;
    } catch (e) {
      throw Exception("SignUp unsuccessful: $e");
    }
  }

  Future<bool> verifyCurrentPassword(String password) async {
    try {
      final User? user = await getCurrentUser();
      final response =
          await auth.signInWithPassword(email: user?.email, password: password);
      return response.session != null;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateUserPassword(String password) async {
    try {
      final User? user = await getCurrentUser();
      if (user != null) {
        await auth.updateUser(UserAttributes(password: password));
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      throw Exception("Update Password unsuccessful: $e");
    }
  }

  Future<User?> signIn(email, password) async {
    try {
      final response =
          await auth.signInWithPassword(email: email, password: password);

      final User? user = response.user;

      return user;
    } catch (e) {
      throw Exception("SignIn unsuccessful: $e");
    }
  }

  Future<User?> getSessionFromUrl(Uri uri) async {
    try {
      final response = await auth.getSessionFromUrl(uri);
      if (response.session != null) {
        return response.session.user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void>? resetPassword(email) async {
    try {
      auth.resetPasswordForEmail(email);
    } catch (e) {
      throw Exception("Reset Password unsuccessful:$e");
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final redirectUrl = kIsWeb
          ? '${dotenv.env['SUPABASE_WEB_CLIENT_ID']}/auth/v1/callback'
          : 'com.example.example://login-callback';

      final success = await auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: redirectUrl,
        authScreenLaunchMode: kIsWeb
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );

      if (success) {
        final user = await getCurrentUser();

        if (user != null) {
          return user;
        } else {
          throw 'User not found after Facebook sign in';
        }
      } else {
        throw 'Facebook sign in failed';
      }
    } catch (e) {
      return null;
    }
  }

  Future<User?> signUpWithGoogle() async {
    final webClientId = dotenv.env['SUPABASE_WEB_CLIENT_ID'];
    final iosClientId = dotenv.env['SUPABASE_IOS_CLIENT_ID'];

    final GoogleSignIn googleSignIn;

    if (kIsWeb) {
      googleSignIn = GoogleSignIn(
        clientId: webClientId,
      );
    } else {
      googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
    }

    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw 'Google Sign-In failed or was cancelled.';
      }

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      final authResponse = await auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      return authResponse.user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await auth.signOut();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
