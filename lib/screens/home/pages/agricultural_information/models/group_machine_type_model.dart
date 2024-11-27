class MachineTypeModel {
  MachineTypeModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final MachineTypeModelData? data;

  factory MachineTypeModel.fromJson(Map<String, dynamic> json){
    return MachineTypeModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : MachineTypeModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class MachineTypeModelData {
  MachineTypeModelData({
    required this.machineType,
  });

  final List<MachineType> machineType;

  factory MachineTypeModelData.fromJson(Map<String, dynamic> json){
    return MachineTypeModelData(
      machineType: json["machine_type"] == null ? [] : List<MachineType>.from(json["machine_type"]!.map((x) => MachineType.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "machine_type": machineType.map((x) => x?.toJson()).toList(),
  };

}

class MachineType {
  MachineType({
    required this.typeId,
    required this.typeName,
  });

  final int typeId;
  final String typeName;

  factory MachineType.fromJson(Map<String, dynamic> json){
    return MachineType(
      typeId: json["type_id"] ?? 0,
      typeName: json["type_name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "type_id": typeId,
    "type_name": typeName,
  };

}
