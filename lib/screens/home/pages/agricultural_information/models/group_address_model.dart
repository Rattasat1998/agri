class GroupAddressModel {
  GroupAddressModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final GroupAddressModelData? data;

  factory GroupAddressModel.fromJson(Map<String, dynamic> json){
    return GroupAddressModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : GroupAddressModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class GroupAddressModelData {
  GroupAddressModelData({
    required this.groupData,
  });

  final GroupAddressModelGroupData? groupData;

  factory GroupAddressModelData.fromJson(Map<String, dynamic> json){
    return GroupAddressModelData(
      groupData: json["group_data"] == null ? null : GroupAddressModelGroupData.fromJson(json["group_data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "group_data": groupData?.toJson(),
  };

}

class GroupAddressModelGroupData {
  GroupAddressModelGroupData({
    required this.groupName,
    required this.description,
    required this.groupAddress,
    required this.groupTel,
    required this.latitude,
    required this.longitude,
  });

  final String? groupName;
  final String? description;
  final String? groupAddress;
  final String? groupTel;
  final double? latitude;
  final double? longitude;

  factory GroupAddressModelGroupData.fromJson(Map<String, dynamic> json){
    return GroupAddressModelGroupData(
      groupName: json["group_name"],
      description: json["description"],
      groupAddress: json["group_address"],
      groupTel: json["group_tel"],
      latitude: json["latitude"] == null  ? 0.0  : double.parse(json["latitude"].toString()),
      longitude: json["longitude"] == null  ? 0.0  : double.parse(json["longitude"].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
    "group_name": groupName,
    "description": description,
    "group_address": groupAddress,
    "group_tel": groupTel,
    "latitude": latitude,
    "longitude": longitude,
  };

}
