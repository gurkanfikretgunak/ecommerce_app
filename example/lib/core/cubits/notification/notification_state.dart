import 'package:equatable/equatable.dart';
import 'package:example/core/network/models/notification_model/notification_model.dart';

abstract class NotificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<Notification> notifications;

  NotificationLoaded({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class NotificationError extends NotificationState {
  final String error;

  NotificationError(this.error);

  @override
  List<Object?> get props => [error];
}
