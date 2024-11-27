import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroupMachineModel {
  GroupMachineModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final GroupMachineModelData? data;

  factory GroupMachineModel.fromJson(Map<String, dynamic> json) {
    return GroupMachineModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : GroupMachineModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data?.toJson(),
      };
}

class GroupMachineModelData {
  GroupMachineModelData({
    required this.machines,
  });

  final List<GroupMachineModelDataMachine> machines;

  factory GroupMachineModelData.fromJson(Map<String, dynamic> json) {
    return GroupMachineModelData(
      machines: json["machines"] == null
          ? List<GroupMachineModelDataMachine>.from(
              json["machine_list"]!.map(
                (x) => GroupMachineModelDataMachine.fromJson(x),
              ),
            )
          : List<GroupMachineModelDataMachine>.from(
              json["machines"]!.map(
                (x) => GroupMachineModelDataMachine.fromJson(x),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        "machines": machines.map((x) => x.toJson()).toList(),
      };
}

class GroupMachineModelDataMachine {
  GroupMachineModelDataMachine({
    required this.machineId,
    required this.machineImg,
    required this.machineName,
    required this.groupName,
    required this.user,
    required this.lat,
    required this.lng,
    required this.rating,
  });

  final int? machineId;
  final String? machineImg;
  final String? machineName;
  final String? groupName;
  final String? user;
  final String? lat;
  final String? lng;
  final double? rating;

  factory GroupMachineModelDataMachine.fromJson(Map<String, dynamic> json) {
    return GroupMachineModelDataMachine(
      machineId: json["machine_id"],
      // machineImg: json["machine_img"] ?? "",
      machineImg: json["machine_img"] != null
          ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}'
          : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg",
      machineName: json["machine_name"],
      groupName: json["group_name"],
      user: json["user"],
      lat: json["lat"] ?? '',
      lng: json["lng"] ?? '',
      rating: json["rating"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        "machine_id": machineId,
        "machine_img": machineImg,
        "machine_name": machineName,
        "group_name": groupName,
        "user": user,
        "lat": lat,
        "lng": lng,
        "rating": rating,
      };
}
