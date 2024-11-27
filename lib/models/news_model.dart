import 'package:flutter_dotenv/flutter_dotenv.dart';

class NModel {
  NModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final NewsData? data;

  factory NModel.fromJson(Map<String, dynamic> json){
    return NModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : NewsData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class NewsData {
  NewsData({
    required this.currentPage,
    required this.news,
  });

  final int? currentPage;
  final List<NewsModel> news;

  factory NewsData.fromJson(Map<String, dynamic> json){
    return NewsData(
      currentPage: json["current_page"],
      news: json["news"] == null ? [] : List<NewsModel>.from(json["news"]!.map((x) => NewsModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "news": news.map((x) => x.toJson()).toList(),
  };

}

class NewsModel {
  NewsModel({
    required this.newsId,
    required this.categoryId,
    required this.newsImg,
    required this.newsTitle,
    required this.newsDescription,
    required this.updatedAt,
  });

  final int? newsId;
  final int? categoryId;
  final String? newsImg;
  final String? newsTitle;
  final String? newsDescription;
  final DateTime? updatedAt;

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
      newsId: json["news_id"] ,
      categoryId: json["category_id"] ,
      // newsImg: json["news_img"] ?? '',
      newsImg: json["news_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['news_img']}' : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg",
      newsTitle: json["news_title"],
      newsDescription: json["description"] ?? '',
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "news_id": newsId,
    "category_id": categoryId,
    "news_img": newsImg,
    "news_title": newsTitle,
    "description": newsDescription,
    "updated_at": updatedAt?.toIso8601String(),
  };

}


class NewsDetailModel {
  NewsDetailModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final NewsDetailModelData? data;

  factory NewsDetailModel.fromJson(Map<String, dynamic> json){
    return NewsDetailModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : NewsDetailModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class NewsDetailModelData {
  NewsDetailModelData({
    required this.news,
  });

  final NewsModel? news;

  factory NewsDetailModelData.fromJson(Map<String, dynamic> json){
    return NewsDetailModelData(
      news: json["news"] == null ? null : NewsModel.fromJson(json["news"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "news": news?.toJson(),
  };

}

