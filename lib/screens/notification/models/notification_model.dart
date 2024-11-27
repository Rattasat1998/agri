class NotificationModel {
  NotificationModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final NotificationModelData? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : NotificationModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class NotificationModelData {
  NotificationModelData({
    required this.currentPage,
    required this.notifications,
  });

  final int currentPage;
  final List<NotificationData> notifications;

  factory NotificationModelData.fromJson(Map<String, dynamic> json){
    return NotificationModelData(
      currentPage: json["current_page"] ?? 0,
      notifications: json["notifications"] == null ? [] : List<NotificationData>.from(json["notifications"]!.map((x) => NotificationData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "notifications": notifications.map((x) => x?.toJson()).toList(),
  };

}

class NotificationData {
  NotificationData({
    required this.notiId,
    required this.notiType,
    required this.notiTitle,
    required this.notiSub,
    required this.notiIsreaded,
    required this.borrowId,
    required this.createdAt,
  });

  final int notiId;
  final int notiType;
  final String notiTitle;
  final String notiSub;
   int notiIsreaded;
  final int borrowId;
  final DateTime? createdAt;

  factory NotificationData.fromJson(Map<String, dynamic> json){
    return NotificationData(
      notiId: json["noti_id"] ?? 0,
      notiType: json["noti_type"] ?? 0,
      notiTitle: json["noti_title"] ?? "",
      notiSub: json["noti_sub"] ?? "",
      notiIsreaded: json["noti_isreaded"] ?? 0,
      borrowId: json["borrow_id"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "noti_id": notiId,
    "noti_type": notiType,
    "noti_title": notiTitle,
    "noti_sub": notiSub,
    "noti_isreaded": notiIsreaded,
    "borrow_id": borrowId,
    "created_at": createdAt?.toIso8601String(),
  };

}
