import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/cubits/validation/validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(ValidationInitial());

  void validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (email.isEmpty) {
      emit(ValidationError(error: "Email cannot be empty"));
    } else if (!emailRegex.hasMatch(email)) {
      emit(ValidationError(error: "Invalid email format"));
    } else {
      emit(EmailValid());
    }
  }

  // Şifre doğrulama işlemi
  void validatePassword(String password) {
    if (password.isEmpty || password.length < 6) {
      emit(PasswordInvalid());
    } else {
      emit(PasswordValid());
    }
  }
}
