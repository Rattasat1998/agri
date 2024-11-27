import 'package:flutter_dotenv/flutter_dotenv.dart';

class StatisticsHistoryGroupModel {
  StatisticsHistoryGroupModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final StatisticsHistoryGroupModelData? data;

  factory StatisticsHistoryGroupModel.fromJson(Map<String, dynamic> json){
    return StatisticsHistoryGroupModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : StatisticsHistoryGroupModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class StatisticsHistoryGroupModelData {
  StatisticsHistoryGroupModelData({
    required this.currentPage,
    required this.news,
  });

  final int? currentPage;
  final List<StatisticsHistoryGroupModelDataNews> news;

  factory StatisticsHistoryGroupModelData.fromJson(Map<String, dynamic> json){
    return StatisticsHistoryGroupModelData(
      currentPage: json["current_page"],
      news: json["news"] == null ? [] : List<StatisticsHistoryGroupModelDataNews>.from(json["news"]!.map((x) => StatisticsHistoryGroupModelDataNews.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "news": news.map((x) => x.toJson()).toList(),
  };

}

class StatisticsHistoryGroupModelDataNews {
  StatisticsHistoryGroupModelDataNews({
    required this.borrowId,
    required this.machineImg,
    required this.machineName,
    required this.groupName,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.message,
  });

  final int? borrowId;
  final String? machineImg;
  final String? machineName;
  final String? groupName;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? status;
  final String? message;

  factory StatisticsHistoryGroupModelDataNews.fromJson(Map<String, dynamic> json){
    return StatisticsHistoryGroupModelDataNews(
      borrowId: json["borrow_id"],
      // machineImg: dotenv.env['BASE_IMAGE']! + json["machine_img"] ??  "",
      machineImg: json["machine_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['machine_img']}' : "https://cdn.pixabay.com/photo/2023/07/28/10/17/machinery-8154964_1280.jpg",
      machineName: json["machine_name"],
      groupName: json["group_name"],
      startDate: DateTime.tryParse(json["start_date"] ?? ""),
      endDate: DateTime.tryParse(json["end_date"] ?? ""),
      status: json["status"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "borrow_id": borrowId,
    "machine_img": machineImg,
    "machine_name": machineName,
    "group_name": groupName,
    "start_date": startDate,
    "end_date": endDate,
    "status": status,
    "message": message,
  };

}
