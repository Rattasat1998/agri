import 'package:flutter_dotenv/flutter_dotenv.dart';

class MachineryModel {
  MachineryModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final MachineryModelData? data;

  factory MachineryModel.fromJson(Map<String, dynamic> json){
    return MachineryModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : MachineryModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class MachineryModelData {
  MachineryModelData({
    required this.machineList,
  });

  final List<MachineList> machineList;

  factory MachineryModelData.fromJson(Map<String, dynamic> json){
    return MachineryModelData(
      machineList: json["machine_list"] == null ? [] : List<MachineList>.from(json["machine_list"]!.map((x) => MachineList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine_list": machineList.map((x) => x.toJson()).toList(),
  };

}

class MachineList {
  MachineList({
    required this.machineId,
    required this.machineImg,
    required this.machineName,
    required this.machineStatus,
    required this.message,
    required this.groupName,
    required this.user,
    required this.borrowingCount,
    required this.numberFields,
    required this.rating,
    required this.lat,
    required this.lng,
  });

  final int? machineId;
  final String? machineImg;
  final String? machineName;
  final int? machineStatus;
  final String? message;
  final String? groupName;
  final String? user;
  final int? borrowingCount;
  final int? numberFields;
  final double? rating;
  final String? lat;
  final String? lng;

  factory MachineList.fromJson(Map<String, dynamic> json){
    return MachineList(
      machineId: json["machine_id"],
      // machineImg: json["machine_img"],
      machineImg: json["machine_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}' : "https://cdn.pixabay.com/photo/2022/07/02/17/57/tractor-7297718_640.jpg",
      machineName: json["machine_name"],
      machineStatus: json["machine_status"],
      message: json["message"],
      groupName: json["group_name"] ?? '',
      user: json["user"] ?? '',
      borrowingCount: json["borrowing_count"],
      numberFields: json["number_fields"],
      rating: json["rating"] == null ? 0.0 : double.parse(json["rating"].toString()),
      lat: json["lat"] == null ? '0.0' : json["lat"].toString(),
      lng: json["lng"] == null ? '0.0' : json["lng"].toString(),

    );
  }

  Map<String, dynamic> toJson() => {
    "machine_id": machineId,
    "machine_img": machineImg,
    "machine_name": machineName,
    "machine_status": machineStatus,
    "message": message,
    "group_name": groupName,
    "user": user,
    "borrowing_count": borrowingCount,
    "number_fields": numberFields,
    "rating": rating,
    "lat": lat,
    "lng": lng,
  };

}
