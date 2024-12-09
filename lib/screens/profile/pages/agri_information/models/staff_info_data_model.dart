import 'package:agri/screens/profile/pages/agri_information/models/staff_info_model.dart';

class StaffInfoDataModel {

  Interviewer? selectedStaff;
  String staffName;
  String staffAddress;
  String staffTambon;
  String staffAmphur;
  String staffProvince;
  String staffZipcode;
  String staffPhone;
  DateTime? interviewDate;
  bool isStaffPending;


  StaffInfoDataModel({
    this.selectedStaff,
    this.staffName = '',
    this.staffAddress = '',
    this.staffTambon = '',
    this.staffAmphur = '',
    this.staffProvince = '',
    this.staffZipcode = '',
    this.staffPhone = '',
    this.interviewDate,
    this.isStaffPending = false,
  });

  StaffInfoDataModel copyWith({
    Interviewer? selectedStaff,
    String? staffName,
    String? staffAddress,
    String? staffTambon,
    String? staffAmphur,
    String? staffProvince,
    String? staffZipcode,
    String? staffPhone,
    DateTime? interviewDate,
    bool? isStaffPending,
  }) {
    return StaffInfoDataModel(
      selectedStaff: selectedStaff ?? this.selectedStaff,
      staffName: staffName ?? this.staffName,
      staffAddress: staffAddress ?? this.staffAddress,
      staffTambon: staffTambon ?? this.staffTambon,
      staffAmphur: staffAmphur ?? this.staffAmphur,
      staffProvince: staffProvince ?? this.staffProvince,
      staffZipcode: staffZipcode ?? this.staffZipcode,
      staffPhone: staffPhone ?? this.staffPhone,
      interviewDate: interviewDate ?? this.interviewDate,
      isStaffPending: isStaffPending ?? this.isStaffPending,
    );
  }


  factory StaffInfoDataModel.fromJson(Map<String, dynamic> json) {
    return StaffInfoDataModel(
      selectedStaff: json['selectedStaff'] != null ? Interviewer.fromJson(json['selectedStaff']) : null,
      staffName: json['staffName'] ?? '',
      staffAddress: json['staffAddress'] ?? '',
      staffTambon: json['staffTambon'] ?? '',
      staffAmphur: json['staffAmphur'] ?? '',
      staffProvince: json['staffProvince'] ?? '',
      staffZipcode: json['staffZipcode'] ?? '',
      staffPhone: json['staffPhone'] ?? '',
      interviewDate: json['interviewDate'] != null ? DateTime.parse(json['interviewDate']) : null,
      isStaffPending: json['isStaffPending'] ?? false,
    );
  }

  toJson() {
    return {
      'selectedStaff': selectedStaff?.toJson(),
      'staffName': staffName,
      'staffAddress': staffAddress,
      'staffTambon': staffTambon,
      'staffAmphur': staffAmphur,
      'staffProvince': staffProvince,
      'staffZipcode': staffZipcode,
      'staffPhone': staffPhone,
      'interviewDate': interviewDate?.toIso8601String(),
      'isStaffPending': isStaffPending,
    };
  }




}