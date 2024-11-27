part of 'agri_info_bloc.dart';

@immutable
class AgriInfoState {

  List<bool> statusPending;

  /// section interview staff
  List<Interviewer> interviewers;
  StaffInfoDataModel? staffData;
  bool isStaffPending;

  /// section 1
  Section1Point1? selectedPoint1;
  Section1Point1? selectedPoint2;
  Section1Point3? selectedPoint3;
  Section1Point4? selectedPoint4;
  Section1Point5? selectedPoint5;
  Section1PointAdOn1? selectedPointAdOn1;
  Section1PointAdOn2? selectedPointAdOn2;
  Section1PointAdOn3? selectedPointAdOn3;
  Section1PointAdOn3? selectedPointAdOn4;
  Section1PointAdOn3? selectedPointAdOn5;
  Section1PointAdOn3? selectedPointAdOn6;
  Section1PointAdOn3? selectedPointAdOn7;
  Section1PointAdOn3? selectedPointAdOn8;
  Section1PointAdOn3? selectedPointAdOn9;
  Section1DataModel? section1Data;
  bool isSection1Pending;


  /// section 2
  RiceFieldModel? selectedRiceField;

  bool isSection2Pending;
  bool isSection3Pending;

  AgriInfoState({
    this.statusPending = const [false, false,false,false],
    /// section interview staff
    this.staffData,
    this.isStaffPending = false,

    /// section 1
    this.interviewers = const [],
    this.isSection1Pending = false,
    this.isSection2Pending = false,
    this.isSection3Pending = false,
    this.selectedPoint1,
    this.selectedPoint2,
    this.selectedPoint3,
    this.selectedPoint4,
    this.selectedPoint5,

    this.selectedPointAdOn1,
    this.selectedPointAdOn2,
    this.selectedPointAdOn3,
    this.selectedPointAdOn4,
    this.selectedPointAdOn5,
    this.selectedPointAdOn6,
    this.selectedPointAdOn7,
    this.selectedPointAdOn8,
    this.selectedPointAdOn9,

     this.section1Data,

    /// section 2
    this.selectedRiceField,
  });

  AgriInfoState copyWith({
    List<bool>? statusPending,
    /// section interview staff
    StaffInfoDataModel? staffData,
    List<Interviewer>? interviewers,

    /// section 1
    bool? isStaffPending,
    Section1Point1? selectedPoint1,
    Section1Point1? selectedPoint2,
    Section1Point3? selectedPoint3,
    Section1Point4? selectedPoint4,
    Section1Point5? selectedPoint5,
    Section1PointAdOn1? selectedPointAdOn1,
    Section1PointAdOn2? selectedPointAdOn2,
    Section1PointAdOn3? selectedPointAdOn3,
    Section1PointAdOn3? selectedPointAdOn4,
    Section1PointAdOn3? selectedPointAdOn5,
    Section1PointAdOn3? selectedPointAdOn6,
    Section1PointAdOn3? selectedPointAdOn7,
    Section1PointAdOn3? selectedPointAdOn8,
    Section1PointAdOn3? selectedPointAdOn9,
    Section1DataModel? section1Data,
    bool? isSection1Pending,

    /// section 2
    RiceFieldModel? selectedRiceField,
  }) {
    return AgriInfoState(
      statusPending: statusPending ?? this.statusPending,
      /// section interview staff
      staffData: staffData ?? this.staffData,
      interviewers: interviewers ?? this.interviewers,
      isStaffPending: isStaffPending ?? this.isStaffPending,

      /// section 1
      isSection1Pending: isSection1Pending ?? this.isSection1Pending,
      selectedPoint1: selectedPoint1 ?? this.selectedPoint1,
      selectedPoint2: selectedPoint2 ?? this.selectedPoint2,
      selectedPoint3: selectedPoint3 ?? this.selectedPoint3,
      selectedPoint4: selectedPoint4 ?? this.selectedPoint4,
      selectedPoint5: selectedPoint5 ?? this.selectedPoint5,
      selectedPointAdOn1: selectedPointAdOn1 ?? this.selectedPointAdOn1,
      selectedPointAdOn2: selectedPointAdOn2 ?? this.selectedPointAdOn2,
      selectedPointAdOn3: selectedPointAdOn3 ?? this.selectedPointAdOn3,
      selectedPointAdOn4: selectedPointAdOn4 ?? this.selectedPointAdOn4,
      selectedPointAdOn5: selectedPointAdOn5 ?? this.selectedPointAdOn5,
      selectedPointAdOn6: selectedPointAdOn6 ?? this.selectedPointAdOn6,
      selectedPointAdOn7: selectedPointAdOn7 ?? this.selectedPointAdOn7,
      selectedPointAdOn8: selectedPointAdOn8 ?? this.selectedPointAdOn8,
      selectedPointAdOn9: selectedPointAdOn9 ?? this.selectedPointAdOn9,
      section1Data: section1Data ?? this.section1Data,

      /// section 2
      selectedRiceField: selectedRiceField ?? this.selectedRiceField,
    );
  }

}
