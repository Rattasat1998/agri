import 'package:agri/screens/notification/models/notification_model.dart';
import 'package:agri/screens/notification/repository/notification_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  final NotificationRepository _notificationRepository = NotificationRepository();

  NotificationBloc() : super(NotificationLoading()) {
    on<NotificationStarted>(_onNotificationStarted);
    on<NotificationRefresh>(_onNotificationRefresh);
    on<NotificationLoadMore>(_onNotificationLoadMore);
    on<NotificationMarkAsRead>(_onNotificationMarkAsRead);
  }

  void _onNotificationStarted(NotificationStarted event, Emitter<NotificationState> emit) async {
    print('NotificationStarted');
    emit(NotificationLoading());
    final notifications = await _notificationRepository.getNotifications(pageNumber: 1);
    final count = await _notificationRepository.getNotificationCount();
    final notiList = notifications.data!.notifications;
    emit(NotificationLoaded(notifications: notiList, currentPage: 1, count: count));
  }

  void _onNotificationRefresh(NotificationRefresh event, Emitter<NotificationState> emit) async {
    final state = this.state;

    if (state is NotificationLoaded) {
      final notifications = await _notificationRepository.getNotifications(pageNumber: 1);
      final count = await _notificationRepository.getNotificationCount();
      final notiList = notifications.data!.notifications;
      emit(state.copyWith(notifications: notiList, currentPage: 1, count: count));
    }
  }

  void _onNotificationLoadMore(NotificationLoadMore event, Emitter<NotificationState> emit) async {
    final state = this.state;

    if (state is NotificationLoaded) {

    final notifications = await  _notificationRepository.getNotifications(pageNumber: state.currentPage + 1);

      final notiList = notifications.data!.notifications;
      if (notiList.isNotEmpty) {
        final currentPage = state.currentPage + 1;
        emit(state.copyWith(notifications: [...state.notifications, ...notiList], currentPage: currentPage));
      } else {
        final currentPage = state.currentPage;
        emit(state.copyWith(notifications: state.notifications, currentPage: currentPage));

      }
    }
  }

  void _onNotificationMarkAsRead(NotificationMarkAsRead event, Emitter<NotificationState> emit) {
    final state = this.state;

    if (state is NotificationLoaded) {
      final notifications = <NotificationData>[];
      _notificationRepository.readedNotification(id: event.id);
      for (var element in state.notifications) {
        if (element.notiId == event.id) {
          if(element.notiIsreaded == 0){
            state.count = state.count - 1;
          }
          element.notiIsreaded = 1;
          notifications.add(element);
        } else {
          notifications.add(element);
        }
      }
      emit(state.copyWith(notifications: notifications, count: state.count));
    }
  }

}
