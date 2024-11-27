abstract class BaseMachineryRepository {
  Future getMachineryList() async {
    throw UnimplementedError();
  }

  Future getMachineryById({
    required String machineryId,
  }) async {
    throw UnimplementedError();
  }

  Future getMachineryInformationById({
    required String machineryId,
  }) async {
    throw UnimplementedError();
  }

  Future getMachineryHistoryListByPageId({
    required String machineryId,
    required String page,
  }) async {
    throw UnimplementedError();
  }

  Future getMachineryWorkCalendarList() async {
    throw UnimplementedError();
  }

  Future getObjectiveList() async {
    throw UnimplementedError();
  }

  Future createBorrowMachinery({
    required String machineryId,
    required String objectiveId,
    required String startDate,
    required String endDate,
    required String numberOfFields,
    required String description,
  }) async {
    throw UnimplementedError();
  }
}
