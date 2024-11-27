import 'package:flutter_dotenv/flutter_dotenv.dart';

class LogoModel {
  LogoModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final LogoModelData? data;

  factory LogoModel.fromJson(Map<String, dynamic> json){
    return LogoModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : LogoModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class LogoModelData {
  LogoModelData({
    required this.logoLists,
  });

  final List<LogoList> logoLists;

  factory LogoModelData.fromJson(Map<String, dynamic> json){
    return LogoModelData(
      logoLists: json["logo_lists"] == null ? [] : List<LogoList>.from(json["logo_lists"]!.map((x) => LogoList.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "logo_lists": logoLists.map((x) => x?.toJson()).toList(),
  };

}

class LogoList {
  LogoList({
    required this.imgId,
    required this.imgName,
    required this.img,
  });

  final int? imgId;
  final String? imgName;
  final String? img;

  factory LogoList.fromJson(Map<String, dynamic> json){
    return LogoList(
      imgId: json["img_id"],
      imgName: json["img_name"],
      // img: json["img"],
      img: json["img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['img']}' : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg",
    );
  }

  Map<String, dynamic> toJson() => {
    "img_id": imgId,
    "img_name": imgName,
    "img": img,
  };

}
