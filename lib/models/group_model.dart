class GroupModel {
  GroupModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final List<GroupModelDatum> data;

  factory GroupModel.fromJson(Map<String, dynamic> json){
    return GroupModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? [] : List<GroupModelDatum>.from(json["data"]!.map((x) => GroupModelDatum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class GroupModelDatum {
  GroupModelDatum({
    required this.groupId,
    required this.groupName,
  });

  final int? groupId;
  final String? groupName;

  factory GroupModelDatum.fromJson(Map<String, dynamic> json){
    return GroupModelDatum(
      groupId: json["group_id"],
      groupName: json["group_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "group_id": groupId,
    "group_name": groupName,
  };

}
