class StatisticsModel {
  StatisticsModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final StatisticsModelData? data;

  factory StatisticsModel.fromJson(Map<String, dynamic> json){
    return StatisticsModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : StatisticsModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class StatisticsModelData {
  StatisticsModelData({
    required this.statistics,
  });

  final Statistics? statistics;

  factory StatisticsModelData.fromJson(Map<String, dynamic> json){
    return StatisticsModelData(
      statistics: json["statistics"] == null ? null : Statistics.fromJson(json["statistics"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "statistics": statistics?.toJson(),
  };

}

class Statistics {
  Statistics({
    required this.borrowTotal,
    required this.borrowInGroup,
    required this.borrowOutGroup,
    required this.numberFields,
  });

  final int? borrowTotal;
  final int? borrowInGroup;
  final int? borrowOutGroup;
  final int? numberFields;

  factory Statistics.fromJson(Map<String, dynamic> json){
    return Statistics(
      borrowTotal: json["borrow_total"] ?? 0,
      borrowInGroup: json["borrow_in_group"] ?? 0,
      borrowOutGroup: json["borrow_out_group"] ?? 0,
      numberFields: json["number_fields"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "borrow_total": borrowTotal,
    "borrow_in_group": borrowInGroup,
    "borrow_out_group": borrowOutGroup,
    "number_fields": numberFields,
  };

}
