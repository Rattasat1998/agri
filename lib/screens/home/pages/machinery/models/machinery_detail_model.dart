import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MachineryDetailModel {
  MachineryDetailModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final MachineryDetailModelData? data;

  factory MachineryDetailModel.fromJson(Map<String, dynamic> json){
    return MachineryDetailModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : MachineryDetailModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class MachineryDetailModelData {
  MachineryDetailModelData({
    required this.machine,
    required this.workCalendar,
    required this.history,
  });

  final MachineList? machine;
  final List<WorkCalendar> workCalendar;
  final List<History> history;

  factory MachineryDetailModelData.fromJson(Map<String, dynamic> json){
    return MachineryDetailModelData(
      machine: json["machine"] == null ? null : MachineList.fromJson(json["machine"]),
      workCalendar: json["work_calendar"] == null ? [] : List<WorkCalendar>.from(json["work_calendar"]!.map((x) => WorkCalendar.fromJson(x))),
      history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine": machine?.toJson(),
    "work_calendar": workCalendar.map((x) => x.toJson()).toList(),
    "history": history.map((x) => x.toJson()).toList(),
  };

}

class History {
  History({
    required this.profileImg,
    required this.objectiveId,
    required this.startDate,
    required this.endDate,
  });

  final String profileImg;
  final int? objectiveId;
  final DateTime? startDate;
  final DateTime? endDate;

  factory History.fromJson(Map<String, dynamic> json){
    return History(
      // profileImg: json["profile_img"],
      profileImg: json["profile_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['profile_img']}' : "https://cdn.pixabay.com/photo/2022/07/02/17/57/tractor-7297718_640.jpg",
      objectiveId: json["objective_id"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "profile_img": profileImg,
    "objective_id": objectiveId,
    "start_date": startDate,
    "end_date": endDate,
  };

}

class WorkCalendar {
  WorkCalendar({
    required this.machineId,
    required this.startDate,
    required this.endDate,
  });

  final int? machineId;
  final DateTime? startDate;
  final DateTime? endDate;

  factory WorkCalendar.fromJson(Map<String, dynamic> json){
    return WorkCalendar(
      machineId: json["machine_id"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine_id": machineId,
    "start_date": startDate,
    "end_date": endDate,
  };

}
