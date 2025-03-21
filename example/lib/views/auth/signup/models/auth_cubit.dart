// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:example/views/auth/signup/models/auth_state.dart';
import 'package:example/core/network/models/user_model/user_model.dart';
import 'package:example/core/network/respository/user_respository/user_respository.dart';
import 'package:example/core/network/services/auth/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthInitial());

  Future<void> getCurrentUser() async {
    try {
      supabase.User? user = await _authService.getCurrentUser();
      if (user != null) {
        final userModel = await UserRespository().getUser(user.id);

        emit(AuthAuthenticated(userModel));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> checkToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('user_id');

      if (userId != null) {
        final userModel = await UserRespository().getUser(userId);
        emit(AuthAuthenticated(userModel));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUp(String firstName, String lastName, String email,
      String phone, String password) async {
    try {
      supabase.User? user = await _authService.signUp(email, password);

      if (user != null) {
        final userModel = User(
            id: user.id,
            email: email,
            phone_number: phone,
            created_at: user.createdAt,
            profile_picture: user.userMetadata?['avatar_url'] ?? '',
            display_name: "$firstName $lastName",
            first_name: firstName,
            last_name: lastName);
        await UserRespository().postUser(userModel);
        emit(AuthSignUpSuccess(userModel));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signIn(String email, String password, bool rememberMe) async {
    try {
      supabase.User? user = await _authService.signIn(email, password);
      if (user != null) {
        final userModel = await UserRespository().getUser(user.id);

        if (rememberMe) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('user_id', user.id);
        }

        emit(AuthAuthenticated(userModel));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUpWithFacebook() async {
    try {
      supabase.User? user = await _authService.signInWithFacebook();

      if (user != null) {
        final userModel = User(
          id: user.id,
          email: user.email!,
          phone_number: user.userMetadata?['phone'] ?? '',
          created_at: user.createdAt,
          profile_picture: user.userMetadata?['avatar_url'] ?? '',
          display_name: user.userMetadata?['full_name'] ?? '',
          first_name: user.userMetadata?['first_name'] ?? '',
          last_name: user.userMetadata?['last_name'] ?? '',
        );

        if (!await UserRespository().isUUIDExist(user.id)) {
          await UserRespository().postUser(userModel);
        }

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', user.id);

        emit(AuthAuthenticated(userModel));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUpWithGoogle() async {
    try {
      supabase.User? user = await _authService.signUpWithGoogle();

      if (user != null) {
        final userModel = User(
          id: user.id,
          email: user.email!,
          phone_number: user.userMetadata?['phone'] ?? '',
          created_at: user.createdAt,
          profile_picture: user.userMetadata?['avatar_url'] ?? '',
          display_name: user.userMetadata?['full_name'] ?? '',
          first_name: user.userMetadata?['first_name'] ?? '',
          last_name: user.userMetadata?['last_name'] ?? '',
        );

        if (!await UserRespository().isUUIDExist(user.id)) {
          await UserRespository().postUser(userModel);
        }

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', user.id);

        emit(AuthAuthenticated(userModel));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_id');
      await _authService.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
