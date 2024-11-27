part of 'statistics_bloc.dart';

@immutable
sealed class StatisticsEvent {}

final class StatisticsInitialEvent extends StatisticsEvent {}

final class StatisticsGetInGroupEvent extends StatisticsEvent {
  final int pageNumber;

  StatisticsGetInGroupEvent({
    required this.pageNumber,
  });
}

final class StatisticsGetOutGroupEvent extends StatisticsEvent {
  final String groupId;

  StatisticsGetOutGroupEvent({required this.groupId});
}

final class StatisticsGetBorrowDetailByIdEvent extends StatisticsEvent {
  final String id;

  StatisticsGetBorrowDetailByIdEvent({required this.id});
}

final class StatisticsChangedTapEvent extends StatisticsEvent {
  final int currentTab;

  StatisticsChangedTapEvent({required this.currentTab});
}

final class StatisticsHistoryLoadMoreEvent extends StatisticsEvent {}

final class ReceiveMachineryEvent extends StatisticsEvent {
  final String id;
  final BuildContext context;
  final bool isFromNotification;

  ReceiveMachineryEvent({required this.id, required this.context, required this.isFromNotification});
}

final class ReturnMachineryEvent extends StatisticsEvent {
  final String id;
  final BuildContext context;
  final bool isFromNotification;
  final double rating;


  ReturnMachineryEvent({
    required this.id,
    required this.context,
    required this.isFromNotification,
    required this.rating,
  });
}
