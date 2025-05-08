import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:example/core/network/repository/user_repository/user_repository.dart';
import 'package:example/cubits/profile_picture/profile_picture_state.dart';

class ProfilePictureCubit extends Cubit<ProfilePictureState> {
  ProfilePictureCubit() : super(ProfilePictureInitial());

  Future<void> uploadProfilePicture(String userId, String imagePath) async {
    emit(ProfilePictureUploading());
    try {
      await UserRepository().uploadProfilePhoto(userId, File(imagePath));
      emit(ProfilePictureUploaded());
    } catch (e) {
      emit(ProfilePictureError(e.toString()));
    }
  }
}
