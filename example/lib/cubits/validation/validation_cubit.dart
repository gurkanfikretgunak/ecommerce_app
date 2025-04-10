import 'package:bloc/bloc.dart';
import 'package:example/cubits/validation/validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationInitial());

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isFirstNameValid = false;
  bool _isLastNameValid = false;
  bool _isPhoneValid = false;
  bool _isConfirmPasswordValid = false;

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

  void validateFirstName(String firstName) {
    if (firstName.isEmpty) {
      _isFirstNameValid = false;
      emit(FirstNameInvalid('First name cannot be empty'));
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(firstName)) {
      _isFirstNameValid = false;
      emit(FirstNameInvalid(
          'First name cannot contain special characters or numbers'));
    } else {
      _isFirstNameValid = true;
      emit(FirstNameValid());
    }
  }

  void validateLastName(String lastName) {
    if (lastName.isEmpty) {
      _isLastNameValid = false;
      emit(LastNameInvalid('Last name cannot be empty'));
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(lastName)) {
      _isLastNameValid = false;
      emit(LastNameInvalid(
          'Last name cannot contain special characters or numbers'));
    } else {
      _isLastNameValid = true;
      emit(LastNameValid());
    }
  }

  void validatePhone(String phone) {
    if (phone.isEmpty) {
      _isPhoneValid = false;
      emit(PhoneInvalid('Phone number cannot be empty'));
    } else if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phone)) {
      _isPhoneValid = false;
      emit(PhoneInvalid('Invalid phone number format'));
    } else {
      _isPhoneValid = true;
      emit(PhoneValid());
    }
  }

  void validateConfirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      _isConfirmPasswordValid = false;
      emit(ConfirmPasswordInvalid('Confirm password cannot be empty'));
    } else if (confirmPassword != password) {
      _isConfirmPasswordValid = false;
      emit(ConfirmPasswordInvalid('Passwords do not match'));
    } else {
      _isConfirmPasswordValid = true;
      emit(ConfirmPasswordValid());
    }
  }

  bool isSignInFormValid() {
    return _isEmailValid && _isPasswordValid;
  }

  bool isSignUpFormValid() {
    return _isFirstNameValid &&
        _isLastNameValid &&
        _isEmailValid &&
        _isPasswordValid &&
        _isConfirmPasswordValid;
  }

  bool isAddressFormValid() {
    return _isFirstNameValid &&
        _isLastNameValid &&
        _isEmailValid &&
        _isPhoneValid;
  }
}
