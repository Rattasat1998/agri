import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroupHeadAddressModel {
  GroupHeadAddressModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final GroupHeadAddressModelData? data;

  factory GroupHeadAddressModel.fromJson(Map<String, dynamic> json){
    return GroupHeadAddressModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : GroupHeadAddressModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class GroupHeadAddressModelData {
  GroupHeadAddressModelData({
    required this.group,
  });

  final Group? group;

  factory GroupHeadAddressModelData.fromJson(Map<String, dynamic> json){
    return GroupHeadAddressModelData(
      group: json["group"] == null ? null : Group.fromJson(json["group"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "group": group?.toJson(),
  };

}

class Group {
  Group({
    required this.groupId,
    required this.groupName,
    required this.groupImg,
    required this.groupAddress,
    required this.groupTel,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  final int? groupId;
  final String? groupName;
  final String? groupImg;
  final String? groupAddress;
  final String? groupTel;
  final String? description;
  final double? latitude;
  final double? longitude;

  factory Group.fromJson(Map<String, dynamic> json){
    return Group(
      groupId: json["group_id"],
      groupName: json["group_name"],
      // groupImg: json["group_img"],
      groupImg: json["group_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['group_img']}' : "",
      groupAddress: json["group_address"],
      groupTel: json["group_tel"],
      description: json["description"],
      latitude: double.parse(json["latitude"].toString()),
      longitude: double.parse(json["longitude"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    "group_id": groupId,
    "group_name": groupName,
    "group_img": groupImg,
    "group_address": groupAddress,
    "group_tel": groupTel,
    "description": description,
    "latitude": latitude,
    "longitude": longitude,
  };

}
