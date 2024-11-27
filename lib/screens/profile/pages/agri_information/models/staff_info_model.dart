class StaffInfoModel {
  StaffInfoModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final Data? data;

  factory StaffInfoModel.fromJson(Map<String, dynamic> json){
    return StaffInfoModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class Data {
  Data({
    required this.interviewers,
  });

  final List<Interviewer> interviewers;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      interviewers: json["interviewers"] == null ? [] : List<Interviewer>.from(json["interviewers"]!.map((x) => Interviewer.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "interviewers": interviewers.map((x) => x?.toJson()).toList(),
  };

}

class Interviewer {
  Interviewer({
    required this.interviewerId,
    required this.interviewerName,
    required this.interviewerTel,
    required this.affiliation,
  });

  final int interviewerId;
  final String interviewerName;
  final String interviewerTel;
  final String affiliation;

  factory Interviewer.fromJson(Map<String, dynamic> json){
    return Interviewer(
      interviewerId: json["interviewer_id"] ?? 0,
      interviewerName: json["interviewer_name"] ?? "",
      interviewerTel: json["interviewer_tel"] ?? "",
      affiliation: json["affiliation"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "interviewer_id": interviewerId,
    "interviewer_name": interviewerName,
    "interviewer_tel": interviewerTel,
    "affiliation": affiliation,
  };

}
