import 'package:bloc/bloc.dart';
import 'package:example/core/network/repository/notification_respository/notifcation_respository.dart';
import 'package:example/cubits/notification/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  Future<void> getNotifications() async {
    try {
      emit(NotificationLoading());

      final notifications = await NotifcationRespository().getNotifications();
      emit(NotificationLoaded(notifications: notifications));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
