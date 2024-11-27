class TrainUserModel {
  TrainUserModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool result;
  final String message;
  final TrainUserModelData? data;

  factory TrainUserModel.fromJson(Map<String, dynamic> json){
    return TrainUserModel(
      result: json["result"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : TrainUserModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class TrainUserModelData {
  TrainUserModelData({
    required this.informationTrain,
    required this.userLists,
    required this.userCount,
  });

  final InformationTrain? informationTrain;
  final List<UserList> userLists;
  final int userCount;

  factory TrainUserModelData.fromJson(Map<String, dynamic> json){
    return TrainUserModelData(
      informationTrain: json["information_train"] == null ? null : InformationTrain.fromJson(json["information_train"]),
      userLists: json["user_lists"] == null ? [] : List<UserList>.from(json["user_lists"]!.map((x) => UserList.fromJson(x))),
      userCount: json["user_count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "information_train": informationTrain?.toJson(),
    "user_lists": userLists.map((x) => x.toJson()).toList(),
    "user_count": userCount,
  };

}

class InformationTrain {
  InformationTrain({
    required this.trainName,
    required this.address,
    required this.trainDate,
    required this.trainTime,
  });

  final String trainName;
  final String address;
  final DateTime? trainDate;
  final String trainTime;

  factory InformationTrain.fromJson(Map<String, dynamic> json){
    return InformationTrain(
      trainName: json["train_name"] ?? "",
      address: json["address"] ?? "",
      trainDate: DateTime.tryParse(json["train_date"] ?? ""),
      trainTime: json["train_time"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "train_name": trainName,
    "address": address,
    "train_date": trainDate,
    "train_time": trainTime,
  };

}

class UserList {
  UserList({
    required this.firstname,
    required this.lastname,
    required this.groupName,
  });

  final String firstname;
  final String lastname;
  final String groupName;

  factory UserList.fromJson(Map<String, dynamic> json){
    return UserList(
      firstname: json["firstname"] ?? "",
      lastname: json["lastname"] ?? "",
      groupName: json["group_name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "group_name": groupName,
  };

}
