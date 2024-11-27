import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroupInformationModel {
  GroupInformationModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final GroupInformationModelData? data;

  factory GroupInformationModel.fromJson(Map<String, dynamic> json){
    return GroupInformationModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : GroupInformationModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class GroupInformationModelData {
  GroupInformationModelData({
    required this.role,
    required this.information,
  });

  final String? role;
  final InformationModelData? information;

  factory GroupInformationModelData.fromJson(Map<String, dynamic> json){
    return GroupInformationModelData(
      role: json["role"],
      information: json["information"] == null ? null : InformationModelData.fromJson(json["information"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "role": role,
    "information": information?.toJson(),
  };

}

class InformationModelData {
  InformationModelData({
    required this.groupId,
    required this.groupImg,
    required this.groupName,
    required this.machineCount,
    required this.usersCount,
    required this.machineStatus1,
    required this.machineStatus2,
    required this.machineStatus3,
    required this.groupFields,
    required this.myFields,
  });

  final int? groupId;
  final dynamic groupImg;
  final String? groupName;
  final int? machineCount;
  final int? usersCount;
  final int? machineStatus1;
  final int? machineStatus2;
  final int? machineStatus3;
  final String? groupFields;
  final int? myFields;

  factory InformationModelData.fromJson(Map<String, dynamic> json){
    return InformationModelData(
      groupId: json["group_id"],
     //  groupImg: json["group_img"] ?? 'https://cdn.pixabay.com/photo/2015/12/07/14/18/drone-1080844_640.jpg',
      groupImg: json["group_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['group_img']}' : "https://cdn.pixabay.com/photo/2015/12/07/14/18/drone-1080844_640.jpg",
      groupName: json["group_name"],
      machineCount: json["machine_count"],
      usersCount: json["users_count"],
      machineStatus1: json["machine_status_1"],
      machineStatus2: json["machine_status_2"],
      machineStatus3: json["machine_status_3"],
      groupFields: json["group_fields"].toString(),
      myFields: json["my_fields"],
    );
  }

  Map<String, dynamic> toJson() => {
    "group_id": groupId,
    "group_img": groupImg,
    "group_name": groupName,
    "machine_count": machineCount,
    "users_count": usersCount,
    "machine_status_1": machineStatus1,
    "machine_status_2": machineStatus2,
    "machine_status_3": machineStatus3,
    "group_fields": groupFields,
    "my_fields": myFields,
  };

}
