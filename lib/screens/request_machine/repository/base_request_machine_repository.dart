import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class BaseRequestMachineRepository {


  Future getRequestApproveInGroupList();


  Future getApproveInGroupByRequestId(String borrowId);

  Future approveBorrowInGroup(int borrowId);

  Future refuseBorrowInGroup(int borrowId);

  Future getRequestApproveOutGroupList();

  Future getApproveOutGroupByRequestId(int borrowId);

  Future approveBorrowOutGroup(int borrowId);

  Future refuseBorrowOutGroup(int borrowId);

  Future getRequestHistoryInGroupList({required int pageNumber});

  Future getRequestHistoryOutGroupList({required int pageNumber});
}
