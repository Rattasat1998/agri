class ObjectivesModel {
  ObjectivesModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final ObjectivesModelData? data;

  factory ObjectivesModel.fromJson(Map<String, dynamic> json){
    return ObjectivesModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : ObjectivesModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class ObjectivesModelData {
  ObjectivesModelData({
    required this.objectives,
  });

  final List<Objective> objectives;

  factory ObjectivesModelData.fromJson(Map<String, dynamic> json){
    return ObjectivesModelData(
      objectives: json["objectives"] == null ? [] : List<Objective>.from(json["objectives"]!.map((x) => Objective.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "objectives": objectives.map((x) => x?.toJson()).toList(),
  };

}

class Objective {
  Objective({
    required this.objectiveId,
    required this.objectiveNo,
    required this.objectiveTitle,
  });

  final int? objectiveId;
  final int? objectiveNo;
  final String? objectiveTitle;

  factory Objective.fromJson(Map<String, dynamic> json){
    return Objective(
      objectiveId: json["objective_id"],
      objectiveNo: json["objective_no"],
      objectiveTitle: json["objective_title"],
    );
  }

  Map<String, dynamic> toJson() => {
    "objective_id": objectiveId,
    "objective_no": objectiveNo,
    "objective_title": objectiveTitle,
  };

}
