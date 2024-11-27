import 'package:agri/screens/home/pages/agricultural_information/models/group_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_information_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_member_model.dart';

class GroupDownloadModel {
  GroupDownloadModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final GroupDownloadModelData? data;

  factory GroupDownloadModel.fromJson(Map<String, dynamic> json){
    return GroupDownloadModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : GroupDownloadModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class GroupDownloadModelData {
  GroupDownloadModelData({
    required this.information,
    required this.machinesList,
    required this.memberList,
    required this.address,
  });

  final InformationModelData? information;
  final List<GroupMachineModelDataMachine> machinesList;
  final List<GroupMemberModelDataMember> memberList;
  final GroupAddressModelGroupData? address;

  factory GroupDownloadModelData.fromJson(Map<String, dynamic> json){
    return GroupDownloadModelData(
      information: json["information"] == null ? null : InformationModelData.fromJson(json["information"]),
      machinesList: json["machines_list"] == null ? [] : List<GroupMachineModelDataMachine>.from(json["machines_list"]!.map((x) => GroupMachineModelDataMachine.fromJson(x))),
      memberList: json["member_list"] == null ? [] : List<GroupMemberModelDataMember>.from(json["member_list"]!.map((x) => GroupMemberModelDataMember.fromJson(x))),
      address: json["address"] == null ? null : GroupAddressModelGroupData.fromJson(json["address"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "information": information?.toJson(),
    "machines_list": machinesList.map((x) => x.toJson()).toList(),
    "member_list": memberList.map((x) => x.toJson()).toList(),
    "address": address?.toJson(),
  };

}

