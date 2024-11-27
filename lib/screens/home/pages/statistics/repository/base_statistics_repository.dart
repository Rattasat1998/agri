abstract class BaseStatisticsRepository {
  Future getBorrowDetailById({required String id});
  Future getHistoryOutGroup({required int pageNumber});
  Future getHistoryInGroup({required int pageNumber});
  Future getStatistics();
  Future receiveMachinery({required String id});
  Future returnMachinery({required String id, required double rating});
}