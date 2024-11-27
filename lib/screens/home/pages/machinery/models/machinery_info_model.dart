import 'package:flutter_dotenv/flutter_dotenv.dart';

class MachineryInfoModel {
  MachineryInfoModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final MachineryInfoModelData? data;

  factory MachineryInfoModel.fromJson(Map<String, dynamic> json){
    return MachineryInfoModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : MachineryInfoModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class MachineryInfoModelData {
  MachineryInfoModelData({
    required this.machineInformation,
  });

  final MachineInformation? machineInformation;

  factory MachineryInfoModelData.fromJson(Map<String, dynamic> json){
    return MachineryInfoModelData(
      machineInformation: json["machine_information"] == null ? null : MachineInformation.fromJson(json["machine_information"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine_information": machineInformation?.toJson(),
  };

}

class MachineInformation {
  MachineInformation({
    required this.machineId,
    required this.machineImg,
    required this.machineName,
    required this.description,
    required this.groupName,
    required this.user,
    required this.tel,
    required this.borrowingCount,
    required this.numberFields,
    required this.rating,
  });

  final int? machineId;
  final String? machineImg;
  final String? machineName;
  final String? description;
  final String? groupName;
  final String? user;
  final String? tel;
  final int? borrowingCount;
  final int? numberFields;
  final double? rating;

  factory MachineInformation.fromJson(Map<String, dynamic> json){
    return MachineInformation(
      machineId: json["machine_id"],
      // machineImg: json["machine_img"],
      machineImg: json["machine_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}' : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg",
      machineName: json["machine_name"],
      description: json["description"] ?? '',
      groupName: json["group_name"] ?? '',
      user: json["user"] ?? '',
      tel: json["tel"],
      borrowingCount: json["borrowing_count"],
      numberFields: json["number_fields"],
      rating: json["rating"] == null ? 0.0 : double.parse(json["rating"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine_id": machineId,
    "machine_img": machineImg,
    "machine_name": machineName,
    "description": description,
    "group_name": groupName,
    "user": user,
    "tel": tel,
    "borrowing_count": borrowingCount,
    "number_fields": numberFields,
    "rating": rating,
  };

}
