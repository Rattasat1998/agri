import 'section_2_model.dart';

class RiceFieldModel {
  final int? riceFieldNumber;
  final String? riceFieldName;
  final double? riceFieldArea;
   String s11;
  String s12;
  String s13;
  String s14;
  String s15;
  String s21;
  String s22;
  String s23;
  String s24;
  String s25;
  String s26;
  String s261;
  String s31;
  String? s311;
  List<Map<String, dynamic>> s321;
  String s32;
  List<Map<String, dynamic>> s33;
  String s41;
  String? s411;
  String s42;
  String? s421;
  String s43;
  String s44;
  String s4511;
  String? s4512;
  List<Map<String, dynamic>>? s513;
  String s4521;
  List<Map<String, dynamic>>? s522;
  String s4531;
  List<Map<String, dynamic>>? s45311;
  String s4532;
  String s4541;
  String? s45411;
  String s4542;
  String? s45421;
  String s51;
  String s52A;
  String? s521A;
  String s53B;
  String s54C;
  String s55D;
  String? s551D;
  String s56E;
  String? s561E;
  String s61E;
  RiceFieldModel({
     this.riceFieldNumber,
     this.riceFieldName,
     this.riceFieldArea,
    this.s11 = '',
    this.s12 = '',
    this.s13 = '',
    this.s14 = '',
    this.s15 = '',
    this.s21 = '',
    this.s22 = '',
    this.s23 = '',
    this.s24 = '',
    this.s25 = '',
    this.s26 = '',
    this.s261 = '',
    this.s31 = '',
    this.s32 = '',
    this.s311,
    this.s33 = const [],
    this.s41 = '',
    this.s411,
    this.s42 = '',
    this.s421,
    this.s43 = '',
    this.s44 = '',
    this.s4511 = '',
    this.s4512 = '',
    this.s513,
    this.s4521 = '',
    this.s522 = const [],
    this.s4531 = '',
    this.s45311 = const [],
    this.s4532 = '',
    this.s321 = const [],
    this.s4541 = '',
    this.s45411,
    this.s4542 = '',
    this.s45421,
    this.s51 = '',
    this.s52A = '',
    this.s53B = '',
    this.s54C = '',
    this.s55D = '',
    this.s551D,
    this.s56E = '',
    this.s561E,
    this.s61E= '',
  });

  Map<String, dynamic> toJson() {
    return {
      'land_number': riceFieldNumber,
      'land_name': riceFieldName,
      'number_of_arear': riceFieldArea,
    };
  }

  factory RiceFieldModel.fromJson(Map<String, dynamic> json) {
    return RiceFieldModel(
      riceFieldNumber: json['land_number'],
      riceFieldName: json['land_name'],
      riceFieldArea: json['number_of_arear'],
    );
  }




  Map<String, dynamic> part24522ToJson() {
    return {
      'question_part_2_4_5_2_2': s522,
    };
  }

  Map<String, dynamic> part245311ToJson() {
    return {
      'question_part_2_4_5_3_1_1': s45311,
    };
  }

  Map<String, dynamic> part24513ToJson() {
    return {
      'question_part_2_4_5_1_3': s513,
    };
  }

  Map<String, dynamic> part2333ToJson() {
    return {
      'question_part_2_3_3': s33,
    };
  }

  Map<String, dynamic> part2321ToJson() {
    return {
      'question_part_2_3_2_1': s321,
    };
  }

  Map<String, dynamic> part2ToJson() {
    return {
      'question_part_2_4_5_2_2': s522,
      'question_part_2_4_5_3_1_1': s45311,
      'question_part_2_4_5_1_3': s513,
      'question_part_2_3_3': s33,
      'question_part_2_3_2_1': s321,



      'land_number': riceFieldNumber,
      'land_name': riceFieldName,
      'number_of_arear': riceFieldArea,
      'question_part_2_1_1': s11,
      'question_part_2_1_2': s12,
      'question_part_2_1_3': s13,
      'question_part_2_1_4': s14,
      'question_part_2_1_5': s15,
      'question_part_2_2_1': s21,
      'question_part_2_2_2': s22,
      'question_part_2_2_3': s23,
      'question_part_2_2_4': s24,
      'question_part_2_2_5': s25,
      'question_part_2_2_6': s26,
      'question_part_2_2_6_1' :s261,
      'question_part_2_3_1': s31,
      'question_part_2_3_1_1': s311,
      'question_part_2_3_2': s32,
      'question_part_2_4_1': s41,
      'question_part_2_4_1_1': s411,
      'question_part_2_4_2': s42,
      'question_part_2_4_2_1': s421,
      'question_part_2_4_3': s43,
      'question_part_2_4_4': s44,
      'question_part_2_4_5_1_1': s4511,
      'question_part_2_4_5_1_2': s4512,
      'question_part_2_4_5_2_1': s4521,
      'question_part_2_4_5_3_1': s4531,
      'question_part_2_4_5_3_2': s4532,
      'question_part_2_4_5_4_1': s4541,
      'question_part_2_4_5_4_1_1': s4541,
      'question_part_2_4_5_4_2': s4542,
      'question_part_2_4_5_4_2_1': s45421,
      'question_part_2_5_1': s51,
      'question_part_2_5_2': s52A,
      'question_part_2_5_2_1': s521A,
      'question_part_2_5_3': s53B,
      'question_part_2_5_4': s54C,
      'question_part_2_5_5': s55D,
      'question_part_2_5_5_1': s551D,
      'question_part_2_5_6': s56E,
      'question_part_2_5_6_1': s561E,
      'question_part_2_6_1': s61E,



    };
  }



  static  List<RiceFieldModel> riceFields = [];
}