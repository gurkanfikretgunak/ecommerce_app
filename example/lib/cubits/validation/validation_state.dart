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

class FirstNameValid extends ValidationState {}

class FirstNameInvalid extends ValidationState {
  final String error;

  FirstNameInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class LastNameValid extends ValidationState {}

class LastNameInvalid extends ValidationState {
  final String error;

  LastNameInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class PhoneValid extends ValidationState {}

class PhoneInvalid extends ValidationState {
  final String error;

  PhoneInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class ConfirmPasswordValid extends ValidationState {}

class ConfirmPasswordInvalid extends ValidationState {
  final String error;

  ConfirmPasswordInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class CardNumberValid extends ValidationState {}

class CardNumberInvalid extends ValidationState {
  final String error;

  CardNumberInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class ValidationSuccess extends ValidationState {
  final bool isEmailValid;
  final bool isPasswordValid;

  ValidationSuccess({
    required this.isEmailValid,
    required this.isPasswordValid,
  });

  @override
  List<Object?> get props => [isEmailValid, isPasswordValid];
}

class ExpMonthValid extends ValidationState {}

class ExpMonthInvalid extends ValidationState {
  final String error;

  ExpMonthInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class ExpYearValid extends ValidationState {}

class ExpYearInvalid extends ValidationState {
  final String error;

  ExpYearInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class CvvValid extends ValidationState {}

class CvvInvalid extends ValidationState {
  final String error;

  CvvInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class CardNameValid extends ValidationState {}

class CardNameInvalid extends ValidationState {
  final String error;

  CardNameInvalid(this.error);

  @override
  List<Object?> get props => [error];
}

class ValidationError extends ValidationState {
  final String error;

  ValidationError(this.error);

  @override
  List<Object?> get props => [error];
}
