import 'package:agri/screens/profile/pages/agri_information/models/section_1_model.dart';

class Section1DataModel {
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

  Section1DataModel({
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
  });

  Map<String, dynamic> toJson() {
    return {
      'selectedPoint1': selectedPoint1?.toJson(),
      'selectedPoint2': selectedPoint2?.toJson(),
      'selectedPoint3': selectedPoint3?.toJson(),
      'selectedPoint4': selectedPoint4?.toJson(),
      'selectedPoint5': selectedPoint5?.toJson(),
      'selectedPointAdOn1': selectedPointAdOn1?.toJson(),
      'selectedPointAdOn2': selectedPointAdOn2?.toJson(),
      'selectedPointAdOn3': selectedPointAdOn3?.toJson(),
      'selectedPointAdOn4': selectedPointAdOn4?.toJson(),
      'selectedPointAdOn5': selectedPointAdOn5?.toJson(),
      'selectedPointAdOn6': selectedPointAdOn6?.toJson(),
      'selectedPointAdOn7': selectedPointAdOn7?.toJson(),
      'selectedPointAdOn8': selectedPointAdOn8?.toJson(),
      'selectedPointAdOn9': selectedPointAdOn9?.toJson(),
    };
  }
}