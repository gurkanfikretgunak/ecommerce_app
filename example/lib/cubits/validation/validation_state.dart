import 'package:equatable/equatable.dart';

abstract class ValidationState extends Equatable {
  @override
  List<Object> get props => [];
}

class ValidationInitial extends ValidationState {}

class EmailValid extends ValidationState {}

class EmailInvalid extends ValidationState {}

class PasswordValid extends ValidationState {}

class PasswordInvalid extends ValidationState {}

class ValidationError extends ValidationState {
  final String error;

  ValidationError({required this.error});

  @override
  List<Object> get props => [error];
}
