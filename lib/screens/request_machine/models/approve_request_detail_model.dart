import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApproveRequestDetailModel {
  ApproveRequestDetailModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final ApproveRequestDetailModelData? data;

  factory ApproveRequestDetailModel.fromJson(Map<String, dynamic> json){
    return ApproveRequestDetailModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : ApproveRequestDetailModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class ApproveRequestDetailModelData {
  ApproveRequestDetailModelData({
    required this.detailApproval,
  });

  final DetailApproval? detailApproval;

  factory ApproveRequestDetailModelData.fromJson(Map<String, dynamic> json){
    return ApproveRequestDetailModelData(
      detailApproval: json["detail_approval"] == null ? DetailApproval.fromJson(json["detail_approval_outgroup"]) : DetailApproval.fromJson(json["detail_approval"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "detail_approval": detailApproval?.toJson(),
  };

}

class DetailApproval {
  DetailApproval({
    required this.borrowId,
    required this.machineId,
    required this.machineImg,
    required this.machineName,
    required this.startDate,
    required this.endDate,
    required this.objectiveTitle,
    required this.numberFields,
    required this.description,
    required this.profileImg,
    required this.firstname,
    required this.lastname,
    required this.tel,
    required this.status,
    required this.message,
  });

  final int borrowId;
  final int machineId;
  final String? machineImg;
  final String machineName;
  final DateTime? startDate;
  final DateTime? endDate;
  final String objectiveTitle;
  final int numberFields;
  final String description;
  final String? profileImg;
  final String firstname;
  final String lastname;
  final String tel;
  final int status;
  final String message;

  factory DetailApproval.fromJson(Map<String, dynamic> json){
    return DetailApproval(
      borrowId: json["borrow_id"] ?? 0,
      machineName: json["machine_name"] ?? '',
      machineId: json["machine_id"] ?? 0,
      // machineImg: json["machine_img"] ?? "",
      machineImg: json["machine_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}' : null,
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      objectiveTitle: json["objective_title"] ?? "",
      numberFields: json["number_fields"] ?? 0,
      description: json["description"] ?? "",
      // profileImg: json["profile_img"] ?? "",
      profileImg: json["profile_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['profile_img']}' : null,
      firstname: json["firstname"] ?? "",
      lastname: json["lastname"] ?? "",
      tel: json["tel"] ?? "",
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "borrow_id": borrowId,
    "machine_id": machineId,
    "machine_img": machineImg,
    "machine_name": machineName,
    "start_date": startDate,
    "end_date": endDate,
    "objective_title": objectiveTitle,
    "number_fields": numberFields,
    "description": description,
    "profile_img": profileImg,
    "firstname": firstname,
    "lastname": lastname,
    "tel": tel,
    "status": status,
    "message": message,
  };

}
