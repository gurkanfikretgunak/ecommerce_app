import 'package:equatable/equatable.dart';

abstract class ValidationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ValidationInitial extends ValidationState {}

class EmailValid extends ValidationState {}

class EmailInvalid extends ValidationState {
  final String error;

  EmailInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class PasswordValid extends ValidationState {}

class PasswordInvalid extends ValidationState {
  final String error;

  PasswordInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class ValidationSuccess extends ValidationState {
  final bool isEmailValid;
  final bool isPasswordValid;

  ValidationSuccess(
      {required this.isEmailValid, required this.isPasswordValid});

  @override
  List<Object?> get props => [isEmailValid, isPasswordValid];
}

class ValidationError extends ValidationState {
  final String error;

  ValidationError(this.error);

  @override
  List<Object?> get props => [error];
}
