// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

import 'package:example/core/network/models/user_model/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthSignUpSuccess extends AuthState {
  final User user;

  AuthSignUpSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);

  @override
  List<Object?> get props => [error];
}
