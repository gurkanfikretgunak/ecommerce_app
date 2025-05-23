import 'package:bloc/bloc.dart';
import 'package:example/core/network/repository/notification_repository/notifcation_repository.dart';
import 'package:example/core/cubits/notification/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  Future<void> getNotifications() async {
    try {
      emit(NotificationLoading());

      final notifications = await NotifcationRepository().getNotifications();
      emit(NotificationLoaded(notifications: notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
