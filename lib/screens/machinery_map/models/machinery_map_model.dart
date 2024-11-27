import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MachineryMapModel {
  MachineryMapModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final MachineryMapModelData? data;

  factory MachineryMapModel.fromJson(Map<String, dynamic> json){
    return MachineryMapModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : MachineryMapModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class MachineryMapModelData {
  MachineryMapModelData({
    required this.machineListMaps,
  });

  final List<MachineList> machineListMaps;

  factory MachineryMapModelData.fromJson(Map<String, dynamic> json){
    return MachineryMapModelData(
      machineListMaps: json["machine_list"] == null ? [] : List<MachineList>.from(json["machine_list"]!.map((x) => MachineList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine_list_maps": machineListMaps.map((x) => x.toJson()).toList(),
  };

}

class MachineListMap {
  MachineListMap({
    required this.machineId,
    required this.machineImg,
    required this.machineName,
    required this.machineStatus,
    required this.lat,
    required this.lng,
    required this.message,
    required this.groupName,
    required this.user,
    required this.rating,
  });

  final int machineId;
  final String machineImg;
  final String machineName;
  final int machineStatus;
  final String lat;
  final String lng;
  final String message;
  final String groupName;
  final String user;
  final double rating;

  factory MachineListMap.fromJson(Map<String, dynamic> json){
    return MachineListMap(
      machineId: json["machine_id"] ?? 0,
      // machineImg: json["machine_img"] ?? "",
      machineImg: json["machine_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}' : "",
      machineName: json["machine_name"] ?? "",
      machineStatus: json["machine_status"] ?? 0,
      lat: json["lat"] ?? "0.0",
      lng: json["lng"] ?? "0.0",
      message: json["message"] ?? "",
      groupName: json["group_name"] ?? "",
      user: json["user"] ?? "",
      rating: double.parse(json["rating"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine_id": machineId,
    "machine_img": machineImg,

    "machine_name": machineName,
    "machine_status": machineStatus,
    "lat": lat,
    "lng": lng,
    "message": message,
    "group_name": groupName,
    "user": user,
    "rating": rating,
  };

}
