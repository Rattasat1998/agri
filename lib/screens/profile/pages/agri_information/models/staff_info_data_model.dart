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



}