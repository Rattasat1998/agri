class HModel {
  HModel({
    required this.result,
    required this.message,
    required this.data,
     this.statusCode = 200,
  });

  final bool? result;
  final String? message;
  final HModelDatum? data;
  final int? statusCode;

  factory HModel.fromJson(Map<String, dynamic> json){
    return HModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : HModelDatum.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class HModelDatum {
  HModelDatum({
    required this.role,
    required this.homeData,
  });

  final String? role;
  final HomeData? homeData;

  factory HModelDatum.fromJson(Map<String, dynamic> json){
    return HModelDatum(
      role: json["role"],
      homeData: json["home_data"] == null ? null : HomeData.fromJson(json["home_data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "role": role,
    "home_data": homeData?.toJson(),
  };

}

class HomeData {
  HomeData({
    required this.profileImg,
    required this.firstname,
    required this.lastname,
    required this.role,
    required this.groupName,
    required this.fullname,
  });

  final String profileImg;
  final String? firstname;
  final String? lastname;
  final String? role;
  final String? groupName;
  final String? fullname;

  factory HomeData.fromJson(Map<String, dynamic> json){
    return HomeData(
      profileImg: json["profile_img"] != null ? 'https://agri-app.extremesofts.com/${json['profile_img']}' : " ",
      // profileImg: json["profile_img"] ?? 'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg',
      firstname: json["firstname"],
      lastname: json["lastname"],
      role: json["role"],
      groupName: json["group_name"],
      fullname: json["fullname"],
    );
  }

  Map<String, dynamic> toJson() => {
    "profile_img": profileImg,
    "firstname": firstname,
    "lastname": lastname,
    "role": role,
    "group_name": groupName,
    "fullname": fullname,
  };

}
