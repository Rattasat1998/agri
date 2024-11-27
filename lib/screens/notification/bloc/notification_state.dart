part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationLoaded extends NotificationState {
  final List<NotificationData> notifications;
  final int currentPage;
   int count;

  NotificationLoaded({
    this.notifications = const [],
    this.currentPage = 1,
    this.count = 0,
  });


  NotificationLoaded copyWith({
    List<NotificationData>? notifications,
    int? currentPage,
    int? count,
  }) {
    return NotificationLoaded(
      notifications: notifications ?? this.notifications,
      currentPage: currentPage ?? this.currentPage,
      count: count ?? this.count,
    );
  }


}
