part of 'agri_info_bloc.dart';

@immutable
sealed class AgriInfoEvent {}

final class InitialEvent extends AgriInfoEvent {}

final class AddInterviewDataEvent extends AgriInfoEvent {
  final Interviewer? selectedStaff;
  final String staffName;
  final String staffAddress;
  final String staffTambon;
  final String staffAmphur;
  final String staffProvince;
  final String staffZipcode;
  final String staffPhone;
  final DateTime interviewDate;

  AddInterviewDataEvent({
    required this.staffName,
    required this.staffAddress,
    required this.staffTambon,
    required this.staffAmphur,
    required this.staffProvince,
    required this.staffZipcode,
    required this.staffPhone,
    required this.interviewDate,
    required this.selectedStaff,
  });
}

final class AddSection1DataEvent extends AgriInfoEvent {
  final Section1DataModel section1;

  AddSection1DataEvent({
    required this.section1,
  });
}

final class SelectedRiceFieldEvent extends AgriInfoEvent {
  final RiceFieldModel riceField;

  SelectedRiceFieldEvent({
    required this.riceField,
  });
}
