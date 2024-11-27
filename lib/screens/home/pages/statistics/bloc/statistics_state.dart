part of 'statistics_bloc.dart';

@immutable
sealed class StatisticsState {}

final class StatisticsLoading extends StatisticsState {}

final class StatisticsLoaded extends StatisticsState {
  final StatisticsModel statisticsModel;
  final List<StatisticsHistoryGroupModelDataNews>? historyGroup;
  final bool isLoading;
  final bool isDetailLoading;
   int currentTab;
   int currentPage;
  final List<String> tabs;
  final StatisticsHistoryBorrowDetailModel? borrowDetail;

  StatisticsLoaded({
    required this.statisticsModel,
     this.historyGroup,
    this.isLoading = false,
    this.isDetailLoading = false,
    this.currentTab = 0,
    this.currentPage = 1,
    this.tabs = const ['ในกลุ่ม', 'นอกกลุ่ม'],
    this.borrowDetail,
  });

  StatisticsLoaded copyWith({
    StatisticsModel? statisticsModel,
    List<StatisticsHistoryGroupModelDataNews>? historyGroup,
    bool? isLoading,
    bool? isDetailLoading,
    int? currentTab,
    int? currentPage,
    StatisticsHistoryBorrowDetailModel? borrowDetail,
  }) {
    return StatisticsLoaded(
      statisticsModel: statisticsModel ?? this.statisticsModel,
      historyGroup: historyGroup ?? this.historyGroup,
      isLoading: isLoading ?? this.isLoading,
      currentTab: currentTab ?? this.currentTab,
      currentPage: currentPage ?? this.currentPage,
      isDetailLoading: isDetailLoading ?? this.isDetailLoading,
      borrowDetail: borrowDetail ?? this.borrowDetail,
    );
  }

}

final class StatisticsBorrowDetailLoading extends StatisticsState {}
final class StatisticsBorrowDetailLoaded extends StatisticsState {
  //final BorrowDetailModelData borrowDetail;
}
