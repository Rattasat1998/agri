import 'package:flutter_dotenv/flutter_dotenv.dart';

class GroupMemberModel {
  GroupMemberModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final GroupMemberModelData? data;

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    return GroupMemberModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : GroupMemberModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data?.toJson(),
      };
}

class GroupMemberModelData {
  GroupMemberModelData({
    required this.members,
  });

  final List<GroupMemberModelDataMember> members;

  factory GroupMemberModelData.fromJson(Map<String, dynamic> json) {
    return GroupMemberModelData(
      members: json["members"] == null
          ? List<GroupMemberModelDataMember>.from(
              json["users"]!.map(
                (x) => GroupMemberModelDataMember.fromJson(x),
              ),
            )
          : List<GroupMemberModelDataMember>.from(
              json["members"]!.map(
                (x) => GroupMemberModelDataMember.fromJson(x),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        "members": members.map((x) => x.toJson()).toList(),
      };
}

class GroupMemberModelDataMember {
  GroupMemberModelDataMember({
    required this.userId,
    required this.profileImg,
    required this.firstname,
    required this.lastname,
    required this.numberFields,
  });

  final int? userId;
  final String? profileImg;
  final String? firstname;
  final String? lastname;
  final int? numberFields;

  factory GroupMemberModelDataMember.fromJson(Map<String, dynamic> json) {
    return GroupMemberModelDataMember(
      userId: json["user_id"],
      // profileImg: json["profile_img"],
      profileImg:
          json["profile_img"] != null ? '${dotenv.env['BASE_IMAGE']!}${json['profile_img']}' : "",
      firstname: json["firstname"],
      lastname: json["lastname"],
      numberFields: json["number_fields"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "profile_img": profileImg,
        "firstname": firstname,
        "lastname": lastname,
        "number_fields": numberFields,
      };
}
