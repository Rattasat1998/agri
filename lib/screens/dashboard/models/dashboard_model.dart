class DashboardModel {
  DashboardModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final DashboardModelData? data;

  factory DashboardModel.fromJson(Map<String, dynamic> json){
    return DashboardModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : DashboardModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class DashboardModelData {
  DashboardModelData({
    required this.groupsLists,
  });

  final List<DashboardModelGroupsList> groupsLists;

  factory DashboardModelData.fromJson(Map<String, dynamic> json){
    return DashboardModelData(
      groupsLists: json["groups_lists"] == null ? [] : List<DashboardModelGroupsList>.from(json["groups_lists"]!.map((x) => DashboardModelGroupsList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "groups_lists": groupsLists.map((x) => x.toJson()).toList(),
  };

}

class DashboardModelGroupsList {
  DashboardModelGroupsList({
    required this.groupId,
    required this.groupImg,
    required this.groupName,
    required this.groupAddress,
    required this.machineCount,
    required this.usersCount,
    required this.numberFields,
  });

  final int? groupId;
  final String? groupImg;
  final String? groupName;
  final String? groupAddress;
  final int? machineCount;
  final int? usersCount;
  final int? numberFields;

  factory DashboardModelGroupsList.fromJson(Map<String, dynamic> json){
    return DashboardModelGroupsList(
      groupId: json["group_id"],
      //groupImg: json["group_img"],
      groupImg: json["group_img"] != null ? 'https://agri-app.extremesofts.com/${json['group_img']}' : null,
      groupName: json["group_name"],
      groupAddress: json["group_address"],
      machineCount: json["machine_count"],
      usersCount: json["users_count"],
      numberFields: json["number_fields"],
    );
  }

  Map<String, dynamic> toJson() => {
    "group_id": groupId,
    "group_img": groupImg,
    "group_name": groupName,
    "group_address": groupAddress,
    "machine_count": machineCount,
    "users_count": usersCount,
    "number_fields": numberFields,
  };

}
