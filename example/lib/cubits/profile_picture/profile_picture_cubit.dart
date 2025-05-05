import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:example/core/network/repository/user_respository/user_respository.dart';

class ChangeProfilePictureCubit extends Cubit<String> {
  ChangeProfilePictureCubit(String? imagePath) : super(imagePath ?? "");

  void changeProfilePicture(String imagePath) {
    emit(imagePath);
  }

  void uploadProfilePicture(String userId, String imagePath) {
    changeProfilePicture(imagePath);
    UserRespository().uploadProfilePhoto(userId, File(imagePath));
  }
}
