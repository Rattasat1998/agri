import 'package:flutter_dotenv/flutter_dotenv.dart';

class MachineDetailModel {
  MachineDetailModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final MachineDetailModelData? data;

  factory MachineDetailModel.fromJson(Map<String, dynamic> json){
    return MachineDetailModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : MachineDetailModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class MachineDetailModelData {
  MachineDetailModelData({
    required this.machine,
  });

  final Machine? machine;

  factory MachineDetailModelData.fromJson(Map<String, dynamic> json){
    return MachineDetailModelData(
      machine: json["machine"] == null ? null : Machine.fromJson(json["machine"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine": machine?.toJson(),
  };

}

class Machine {
  Machine({
    required this.groupId,
    required this.userId,
    required this.typeId,
    required this.machineName,
    required this.machineImg,
    required this.description,
    required this.lat,
    required this.lng,
    required this.rating,
  });

  final int groupId;
  final int userId;
  final int typeId;
  final String machineName;
  final String machineImg;
  final String description;
  final String lat;
  final String lng;
  final double rating;

  factory Machine.fromJson(Map<String, dynamic> json){
    return Machine(
      groupId: json["group_id"] ?? 0,
      userId: json["user_id"] ?? 0,
      typeId: json["type_id"] ?? 0,
      machineName: json["machine_name"] ?? "",
      // machineImg: json["machine_img"] ?? "",
      machineImg: json["machine_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}' : "",

      description: json["description"] ?? "",
      lat: json["lat"] ??'0.0',
      lng: json["lng"] ?? '0.0',
      rating: json["rating"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    "group_id": groupId,
    "user_id": userId,
    "type_id": typeId,
    "machine_name": machineName,
    "machine_img": machineImg,
    "description": description,
    "lat": lat,
    "lng": lng,
    "rating": rating,
  };

}
