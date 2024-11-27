part of 'request_history_bloc.dart';

@immutable
sealed class RequestHistoryEvent {}

final class RequestHistoryChangedTabEvent extends RequestHistoryEvent {
  final int tab;

  RequestHistoryChangedTabEvent(this.tab);
}

final class RequestHistoryRefreshEvent extends RequestHistoryEvent {}

final class RequestHistoryLoadMoreEvent extends RequestHistoryEvent {}