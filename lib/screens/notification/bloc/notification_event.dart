part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

final class NotificationStarted extends NotificationEvent {}

final class NotificationRefresh extends NotificationEvent {}

final class NotificationLoadMore extends NotificationEvent {}

final class NotificationMarkAsRead extends NotificationEvent {
  final int id;

  NotificationMarkAsRead(this.id);
}

