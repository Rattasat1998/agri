class PModel {
  PModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final PData? data;

  factory PModel.fromJson(Map<String, dynamic> json){
    return PModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : PData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class PData {
  PData({
    required this.profile,
  });

  final ProfileModel? profile;

  factory PData.fromJson(Map<String, dynamic> json){
    return PData(
      profile: json["profile"] == null ? null : ProfileModel.fromJson(json["profile"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "profile": profile?.toJson(),
  };

}

class ProfileModel {
  ProfileModel({
    required this.profileImg,
    required this.firstname,
    required this.lastname,
    required this.tel,
    required this.dateOfBirth,
    required this.role,
  });

  final String? profileImg;
  final String? firstname;
  final String? lastname;
  final String? tel;
  final DateTime? dateOfBirth;
  final String? role;

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      profileImg: json["profile_img"] != null ? 'https://agri-app.extremesofts.com/${json['profile_img']}' : "",
      firstname: json["firstname"],
      lastname: json["lastname"],
      tel: json["tel"],
      dateOfBirth: DateTime.tryParse(json["date_of_birth"] ?? ""),
      role: json["role"],
    );
  }

  Map<String, dynamic> toJson() => {
    "profile_img": profileImg,
    "firstname": firstname,
    "lastname": lastname,
    "tel": tel,
    "date_of_birth": dateOfBirth,
    "role": role,
  };

}
