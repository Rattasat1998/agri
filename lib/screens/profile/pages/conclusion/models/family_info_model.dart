class FamilyInfoModel {
  FamilyInfoModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final FamilyInfoModelData? data;

  factory FamilyInfoModel.fromJson(Map<String, dynamic> json){
    return FamilyInfoModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : FamilyInfoModelData.fromJson(json["data"]),
    );
  }

}

class FamilyInfoModelData {
  FamilyInfoModelData({
    required this.inerviw,
    required this.respon,
    required this.machineSummary,
    required this.totalMachines,
  });

  final InerviwModel? inerviw;
  final ResponModel? respon;
  final List<MachineSummaryModel> machineSummary;
  final int? totalMachines;

  factory FamilyInfoModelData.fromJson(Map<String, dynamic> json){
    return FamilyInfoModelData(
      inerviw: json["inerviw"] == null ? null : InerviwModel.fromJson(json["inerviw"]),
      respon: json["respon"] == null ? null : ResponModel.fromJson(json["respon"]),
      machineSummary: json["machine_summary"] == null ? [] : List<MachineSummaryModel>.from(json["machine_summary"]!.map((x) => MachineSummaryModel.fromJson(x))),
      totalMachines: json["total_machines"],
    );
  }

}

class InerviwModel {
  InerviwModel({
    required this.interviewerName,
    required this.interviewerTel,
    required this.affiliation,
    required this.date,
  });

  final String? interviewerName;
  final String? interviewerTel;
  final String? affiliation;
  final String? date;

  factory InerviwModel.fromJson(Map<String, dynamic> json){
    return InerviwModel(
      interviewerName: json["interviewer_name"],
      interviewerTel: json["interviewer_tel"],
      affiliation: json["affiliation"],
      date: json["date"],
    );
  }

}

class MachineSummaryModel {
  MachineSummaryModel({
    required this.machineType,
    required this.numberOfMachines,
  });

  final String? machineType;
  final int? numberOfMachines;

  factory MachineSummaryModel.fromJson(Map<String, dynamic> json){
    return MachineSummaryModel(
      machineType: json["machine_type"],
      numberOfMachines: json["number_of_machines"],
    );
  }

}

class ResponModel {
  ResponModel({
    required this.respondentName,
    required this.address,
    required this.tel,
  });

  final String? respondentName;
  final String? address;
  final String? tel;

  factory ResponModel.fromJson(Map<String, dynamic> json){
    return ResponModel(
      respondentName: json["respondent_name"],
      address: json["address"],
      tel: json["tel"],
    );
  }

}
