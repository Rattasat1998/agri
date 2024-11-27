class TrainingModel {
  TrainingModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final TrainingModelData? data;

  factory TrainingModel.fromJson(Map<String, dynamic> json){
    return TrainingModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : TrainingModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class TrainingModelData {
  TrainingModelData({
    required this.train,
  });

  final List<TrainingModelTrain> train;

  factory TrainingModelData.fromJson(Map<String, dynamic> json){
    return TrainingModelData(
      train: json["train"] == null ? [] : List<TrainingModelTrain>.from(json["train"]!.map((x) => TrainingModelTrain.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "train": train.map((x) => x.toJson()).toList(),
  };

}

class TrainingModelTrain {
  TrainingModelTrain({
    required this.trainId,
    required this.imgId,
    required this.trainName,
    required this.trainDate,
    required this.trainTime,
    required this.img,
  });

  final int? trainId;
  final int? imgId;
  final String? trainName;
  final DateTime? trainDate;
  final String? trainTime;
  final String? img;

  factory TrainingModelTrain.fromJson(Map<String, dynamic> json){
    return TrainingModelTrain(
      trainId: json["train_id"],
      imgId: json["img_id"],
      trainName: json["train_name"],
      trainDate: DateTime.tryParse(json["train_date"] ?? ""),
      trainTime: json["train_time"],
      // img: json["img"],
      // img: json["img"],
      img: json["img"] != null ? 'https://agri-app.extremesofts.com/${json['img']}' : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg",
    );
  }

  Map<String, dynamic> toJson() => {
    "train_id": trainId,
    "img_id": imgId,
    "train_name": trainName,
    "train_date": trainDate,
    "train_time": trainTime,
    "img": img,
  };

}


class TrainingDetailModel {
  TrainingDetailModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final TrainingDetailDataModel? data;

  factory TrainingDetailModel.fromJson(Map<String, dynamic> json){
    return TrainingDetailModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : TrainingDetailDataModel.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class TrainingDetailModelData {
  TrainingDetailModelData({
    required this.train,
  });

  final TrainingDetailDataModel? train;

  factory TrainingDetailModelData.fromJson(Map<String, dynamic> json){
    return TrainingDetailModelData(
      train: json["train"] == null ? null : TrainingDetailDataModel.fromJson(json["train"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "train": train?.toJson(),
  };

}

class TrainingDetailDataModel {
  TrainingDetailDataModel({
    required this.train,
  });

  final Train? train;

  factory TrainingDetailDataModel.fromJson(Map<String, dynamic> json){
    return TrainingDetailDataModel(
      train: json["train"] == null ? null : Train.fromJson(json["train"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "train": train?.toJson(),
  };

}

class Train {
  Train({
    required this.trainId,
    required this.imgId,
    required this.trainName,
    required this.address,
    required this.trainDate,
    required this.trainTime,
    required this.trainStatus,
    required this.img,
    required this.isRegister,
  });

  final int? trainId;
  final int? imgId;
  final String? trainName;
  final String? address;
  final DateTime? trainDate;
  final String? trainTime;
  final int? trainStatus;
  final String? img;
  final bool? isRegister;

  factory Train.fromJson(Map<String, dynamic> json){
    return Train(
      trainId: json["train_id"],
      imgId: json["img_id"],
      trainName: json["train_name"],
      address: json["address"],
      trainDate: DateTime.tryParse(json["train_date"] ?? ""),
      trainTime: json["train_time"],
      trainStatus: json["train_status"],
      img: json["img"] != null ? 'https://agri-app.extremesofts.com/${json['img']}' : "'https://www.w3schools.com/w3images/avatar2.png'",
      isRegister: json["is_register"],
    );
  }

  Map<String, dynamic> toJson() => {
    "train_id": trainId,
    "img_id": imgId,
    "train_name": trainName,
    "address": address,
    "train_date": trainDate,
    "train_time": trainTime,
    "train_status": trainStatus,
    "img": img,
    "is_register": isRegister,
  };

}
