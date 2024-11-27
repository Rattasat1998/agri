import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdminModel {
  AdminModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final AdminModelData? data;

  factory AdminModel.fromJson(Map<String, dynamic> json){
    return AdminModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : AdminModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class AdminModelData {
  AdminModelData({
    required this.adminList,
  });

  final List<AdminList> adminList;

  factory AdminModelData.fromJson(Map<String, dynamic> json){
    return AdminModelData(
      adminList: json["admin_list"] == null ? [] : List<AdminList>.from(json["admin_list"]!.map((x) => AdminList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "admin_list": adminList.map((x) => x?.toJson()).toList(),
  };

}

class AdminList {
  AdminList({
    required this.adminId,
    required this.profileImg,
    required this.firstname,
    required this.lastname,
  });

  final int? adminId;
  final String? profileImg;
  final String? firstname;
  final String? lastname;

  factory AdminList.fromJson(Map<String, dynamic> json){
    return AdminList(
      adminId: json["admin_id"],
      // profileImg: json["profile_img"],
      profileImg: json["profile_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['profile_img']}' : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg",
      firstname: json["firstname"],
      lastname: json["lastname"],
    );
  }

  Map<String, dynamic> toJson() => {
    "admin_id": adminId,
    "profile_img": profileImg,
    "firstname": firstname,
    "lastname": lastname,
  };

}
