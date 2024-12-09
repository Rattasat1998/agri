import 'dart:convert';

import 'Section2MapModel.dart';
import 'rice_field_model.dart';
import 'section_1_model.dart';
import 'section_2_data_model.dart';
import 'section_3_model.dart';
import 'staff_info_data_model.dart';

class LocalInfoModel {
  final String userId;

  final StaffInfoDataModel interviewers;

  final Section1Point1 selectedPoint1;
  final Section1Point1 selectedPoint2;
  final Section1Point3 selectedPoint3;
  final Section1Point4 selectedPoint4;
  final Section1Point5 selectedPoint5;
  final Section1PointAdOn1 selectedPointAdOn1;
  final Section1PointAdOn2 selectedPointAdOn2;
  final Section1PointAdOn3 selectedPointAdOn3;
  final Section1PointAdOn3 selectedPointAdOn4;
  final Section1PointAdOn3 selectedPointAdOn5;
  final Section1PointAdOn3 selectedPointAdOn6;
  final Section1PointAdOn3 selectedPointAdOn7;
  final Section1PointAdOn3 selectedPointAdOn8;
  final Section1PointAdOn3 selectedPointAdOn9;

  final List<RiceFieldModel> selectedPoint2Map;
  final List<Section3Model> data3;
  final List<String> data3StringList;



  LocalInfoModel({
    required this.userId,

    required this.interviewers,

    required this.selectedPoint1,
    required this.selectedPoint2,
    required this.selectedPoint3,
    required this.selectedPoint4,
    required this.selectedPoint5,
    required this.selectedPointAdOn1,
    required this.selectedPointAdOn2,
    required this.selectedPointAdOn3,
    required this.selectedPointAdOn4,
    required this.selectedPointAdOn5,
    required this.selectedPointAdOn6,
    required this.selectedPointAdOn7,
    required this.selectedPointAdOn8,
    required this.selectedPointAdOn9,

    required this.selectedPoint2Map,

    required this.data3,
    required this.data3StringList,

  });

  // Convert the model to a Map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'interviewers': interviewers.toJson(),
      'selectedPoint1': selectedPoint1.toJson(),
      'selectedPoint2': selectedPoint2.toJson(),
      'selectedPoint3': selectedPoint3.toJson(),
      'selectedPoint4': selectedPoint4.toJson(),
      'selectedPoint5': selectedPoint5.toJson(),
      'selectedPointAdOn1': selectedPointAdOn1.toJson(),
      'selectedPointAdOn2': selectedPointAdOn2.toJson(),
      'selectedPointAdOn3': selectedPointAdOn3.toJson(),
      'selectedPointAdOn4': selectedPointAdOn4.toJson(),
      'selectedPointAdOn5': selectedPointAdOn5.toJson(),
      'selectedPointAdOn6': selectedPointAdOn6.toJson(),
      'selectedPointAdOn7': selectedPointAdOn7.toJson(),
      'selectedPointAdOn8': selectedPointAdOn8.toJson(),
      'selectedPointAdOn9': selectedPointAdOn9.toJson(),
      'selectedPoint2Map': List<dynamic>.from(selectedPoint2Map.map((x) => x.toJson())),
      'data3': List<dynamic>.from(data3.map((x) => x.toJson())),
      'data3StringList': List<dynamic>.from(data3StringList.map((x) => x)),
    };
  }

  // Create the model from a Map
  factory LocalInfoModel.fromJson(Map<String, dynamic> json) {
    return LocalInfoModel(
      userId: json['userId'],
      interviewers: StaffInfoDataModel.fromJson(json['interviewers']),
      selectedPoint1: Section1Point1.fromJson(json['selectedPoint1']),
      selectedPoint2: Section1Point1.fromJson(json['selectedPoint2']),
      selectedPoint3: Section1Point3.fromJson(json['selectedPoint3']),
      selectedPoint4: Section1Point4.fromJson(json['selectedPoint4']),
      selectedPoint5: Section1Point5.fromJson(json['selectedPoint5']),
      selectedPointAdOn1: Section1PointAdOn1.fromJson(json['selectedPointAdOn1']),
      selectedPointAdOn2: Section1PointAdOn2.fromJson(json['selectedPointAdOn2']),
      selectedPointAdOn3: Section1PointAdOn3.fromJson(json['selectedPointAdOn3']),
      selectedPointAdOn4: Section1PointAdOn3.fromJson(json['selectedPointAdOn4']),
      selectedPointAdOn5: Section1PointAdOn3.fromJson(json['selectedPointAdOn5']),
      selectedPointAdOn6: Section1PointAdOn3.fromJson(json['selectedPointAdOn6']),
      selectedPointAdOn7: Section1PointAdOn3.fromJson(json['selectedPointAdOn7']),
      selectedPointAdOn8: Section1PointAdOn3.fromJson(json['selectedPointAdOn8']),
      selectedPointAdOn9: Section1PointAdOn3.fromJson(json['selectedPointAdOn9']),
      selectedPoint2Map: List<RiceFieldModel>.from(json['selectedPoint2Map'].map((x) => RiceFieldModel.fromJson(x))),
      data3: List<Section3Model>.from(json['data3'].map((x) => Section3Model.fromJson(x))),
      data3StringList: List<String>.from(json['data3StringList'].map((x) => x)),
    );
  }
}