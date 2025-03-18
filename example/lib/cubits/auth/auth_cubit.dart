// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:example/cubits/auth/auth_state.dart';
import 'package:example/models/user_model/user_model.dart';
import 'package:example/respository/user_respository/user_respository.dart';
import 'package:example/services/auth/auth_service.dart';
// ignore: depend_on_referenced_packages
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();

  AuthCubit() : super(AuthInitial());

  Future<void> getCurrentUser() async {
    try {
      supabase.User? user = await _authService.getCurrentUser();

      if (user != null) {
        emit(AuthAuthenticated(user));
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
            profile_picture: user.userMetadata?['profile_picture'] ?? '',
            display_name: "$firstName $lastName",
            first_name: firstName,
            last_name: lastName);
        await UserRespository().postUser(userModel);
        emit(AuthSignUpSuccess(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      supabase.User? user = await _authService.signIn(email, password);
      print(user);
      if (user != null) {
        emit(AuthAuthenticated(user));
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
        emit(AuthAuthenticated(user));
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
          profile_picture: user.userMetadata?['profile_picture'] ?? '',
          display_name: user.userMetadata?['display_name'] ?? '',
          first_name: user.userMetadata?['first_name'] ?? '',
          last_name: user.userMetadata?['last_name'] ?? '',
        );

        if (!await UserRespository().isUUIDExist(user.id)) {
          await UserRespository().postUser(userModel);
        }

        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
