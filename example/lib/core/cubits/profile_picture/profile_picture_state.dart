import 'package:equatable/equatable.dart';

abstract class ProfilePictureState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfilePictureInitial extends ProfilePictureState {}

class ProfilePictureUploading extends ProfilePictureState {}

class ProfilePictureUploaded extends ProfilePictureState {}

class ProfilePictureError extends ProfilePictureState {
  final String message;

  ProfilePictureError(this.message);

  @override
  List<Object?> get props => [message];
}
