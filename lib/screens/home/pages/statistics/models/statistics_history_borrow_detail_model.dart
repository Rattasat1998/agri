import 'package:flutter_dotenv/flutter_dotenv.dart';

class StatisticsHistoryBorrowDetailModel {
  StatisticsHistoryBorrowDetailModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final StatisticsHistoryBorrowDetailModelData? data;

  factory StatisticsHistoryBorrowDetailModel.fromJson(Map<String, dynamic> json){
    return StatisticsHistoryBorrowDetailModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : StatisticsHistoryBorrowDetailModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class StatisticsHistoryBorrowDetailModelData {
  StatisticsHistoryBorrowDetailModelData({
    required this.borrowDetail,
  });

  final BorrowDetail? borrowDetail;

  factory StatisticsHistoryBorrowDetailModelData.fromJson(Map<String, dynamic> json){
    return StatisticsHistoryBorrowDetailModelData(
      borrowDetail: json["borrow_detail"] == null ? BorrowDetail.fromJson(json["detail_approval"]) : BorrowDetail.fromJson(json["borrow_detail"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "borrow_detail": borrowDetail?.toJson(),
  };

}

class BorrowDetail {
  BorrowDetail({
    required this.borrowId,
    required this.machineId,
    required this.machineImg,
    required this.machineName,
    required this.groupName,
    required this.startDate,
    required this.endDate,
    required this.objectiveTitle,
    required this.numberFields,
    required this.description,
    required this.status,
    required this.message,
  });

  final int? borrowId;
  final int? machineId;
  final String? machineImg;
  final String? machineName;
  final String? groupName;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? objectiveTitle;
  final int? numberFields;
  final String? description;
  final int? status;
  final String? message;

  factory BorrowDetail.fromJson(Map<String, dynamic> json){
    return BorrowDetail(
      borrowId: json["borrow_id"],
      machineId: json["machine_id"],
      machineImg: json["machine_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}' : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg",
      machineName: json["machine_name"],
      groupName: json["group_name"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      objectiveTitle: json["objective_title"],
      numberFields: json["number_fields"],
      description: json["description"],
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "borrow_id": borrowId,
    "machine_id": machineId,
    "machine_img": machineImg,
    "machine_name": machineName,
    "group_name": groupName,
    "start_date": startDate,
    "end_date": endDate,
    "objective_title": objectiveTitle,
    "number_fields": numberFields,
    "description": description,
    "status": status,
    "message": message,
  };

}
