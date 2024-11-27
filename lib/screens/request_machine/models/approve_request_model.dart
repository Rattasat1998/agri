class ApproveRequestModel {
  ApproveRequestModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final ApproveRequestModelData? data;

  factory ApproveRequestModel.fromJson(Map<String, dynamic> json){
    return ApproveRequestModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : ApproveRequestModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class ApproveRequestModelData {
  ApproveRequestModelData({
    required this.requestList,
  });

  final List<RequestList> requestList;

  factory ApproveRequestModelData.fromJson(Map<String, dynamic> json){
    return ApproveRequestModelData(
      requestList: json["request_list"] == null ?  List<RequestList>.from(json["request_outgroup_list"]!.map((x) => RequestList.fromJson(x))) : List<RequestList>.from(json["request_list"]!.map((x) => RequestList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "request_list": requestList.map((x) => x?.toJson()).toList(),
  };

}

class RequestList {
  RequestList({
    required this.borrowId,
    required this.groupName,
    required this.machineName,
    required this.status,
    required this.message,
  });

  final int borrowId;
  final String groupName;
  final String machineName;
  final int status;
  final String message;

  factory RequestList.fromJson(Map<String, dynamic> json){
    return RequestList(
      borrowId: json["borrow_id"] ?? 0,
      groupName: json["group_name"] ?? "",
      machineName: json["machine_name"] ?? "",
      status: json["status"] ?? 0,
      message: json["message"] ?? "",

    );
  }

  Map<String, dynamic> toJson() => {
    "borrow_id": borrowId,
    "group_name": groupName,
    "machine_name": machineName,
    "status": status,
    "message": message,
  };

}
