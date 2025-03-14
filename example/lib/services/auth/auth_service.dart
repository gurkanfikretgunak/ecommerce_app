//import 'package:example/services/auth/supabase_auth_service.dart';
import 'package:example/services/auth/supabase_initialize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Future<User?> signInWithFacebook() async {
    try {
      final success = await auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: '${dotenv.env['SUPABASE_WEB_CLIENT_ID']}/auth/v1/callback',
        authScreenLaunchMode: kIsWeb
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );

      if (success) {
        final user = getCurrentUser();

        if (user != null) {
          return user;
        } else {
          throw 'User not found after Facebook sign in';
        }
      } else {
        throw 'Facebook sign in failed';
      }
    } catch (e) {
      print('Error during Facebook sign in: $e');
      return null;
    }
  }

  Future<User?> signUpWithGoogle() async {
    final webClientId = dotenv.env['SUPABASE_WEB_CLIENT_ID'];
    final iosClientId = dotenv.env['SUPABASE_IOS_CLIENT_ID'];

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

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
      if (kDebugMode) {
        print("Error during Google Sign-In: $e");
      }
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
