import 'package:bloc/bloc.dart';
import 'package:example/cubits/validation/validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationInitial());

  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  void validateEmail(String email) {
    if (email.isEmpty) {
      _isEmailValid = false;
      emit(EmailInvalid('Email cannot be empty'));
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _isEmailValid = false;
      emit(EmailInvalid('Invalid email format'));
    } else {
      _isEmailValid = true;
      emit(ValidationSuccess(
          isEmailValid: _isEmailValid, isPasswordValid: _isPasswordValid));
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      _isPasswordValid = false;
      emit(PasswordInvalid('Password cannot be empty'));
    } else if (password.length < 8) {
      _isPasswordValid = false;
      emit(PasswordInvalid('Password must be at least 8 characters long'));
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(password)) {
      _isPasswordValid = false;
      emit(PasswordInvalid(
          'Password must contain at least one uppercase letter, one lowercase letter, and one number'));
    } else {
      _isPasswordValid = true;
      emit(ValidationSuccess(
          isEmailValid: _isEmailValid, isPasswordValid: _isPasswordValid));
    }
  }

  bool isFormValid() {
    return _isEmailValid && _isPasswordValid;
  }
}
