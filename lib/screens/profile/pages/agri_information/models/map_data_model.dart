class MapDataModel {
  MapDataModel({
    required this.respondentName,
    required this.respondentAdress,
    required this.respondentTel,
    required this.respondentSubdistrict,
    required this.respondentDistrict,
    required this.respondentProvice,
    required this.respondentZipcode,
    required this.interviewerId,
    required this.dateStart,
    required this.dateStop,
    required this.questionPart11,
    required this.questionPart12,
    required this.questionPart13,
    required this.questionPart41,
    required this.questionPart42,
    required this.questionPart43,
    required this.questionPart14,
    required this.questionPart15,
    required this.questionPart16,
    required this.questionPart2,
    required this.questionPart3,
    required this.questionPart2321,
    required this.questionPart234,
    required this.questionPart24513,
    required this.questionPart24522,
    required this.questionPart245311,
  });

  final String? respondentName;
  final String? respondentAdress;
  final String? respondentTel;
  final String? respondentSubdistrict;
  final String? respondentDistrict;
  final String? respondentProvice;
  final String? respondentZipcode;
  final int? interviewerId;
  final DateTime? dateStart;
  final DateTime? dateStop;
  final String? questionPart11;
  final String? questionPart12;
  final String? questionPart13;
  final String? questionPart41;
  final String? questionPart42;
  final String? questionPart43;
  final List<QuestionPart14> questionPart14;
  final List<QuestionPart15> questionPart15;
  final List<QuestionPart16> questionPart16;
  final List<QuestionPart2> questionPart2;
  final List<QuestionPart3> questionPart3;
  final List<Map<String, dynamic>> questionPart2321;
  final List<Map<String, dynamic>> questionPart234;
  final List<Map<String, dynamic>> questionPart24513;
  final List<Map<String, dynamic>> questionPart24522;
  final List<Map<String, dynamic>> questionPart245311;

  /* factory MapDataModel.fromJson(Map<String, dynamic> json){
    return MapDataModel(
      respondentName: json["respondent_name"],
      respondentAdress: json["respondent_adress"],
      respondentSubdistrict: json["respondent_subdistrict"],
      respondentDistrict: json["respondent_district"],
      respondentProvice: json["respondent_provice"],
      respondentZipcode: json["respondent_zipcode"],
      interviewerId: json["interviewer_id"],
      dateStart: DateTime.tryParse(json["date_start"] ?? ""),
      dateStop: DateTime.tryParse(json["date_stop"] ?? ""),
      questionPart11: json["question_part_1_1"],
      questionPart12: json["question_part_1_2"],
      questionPart13: json["question_part_1_3"],
      questionPart41: json["question_part_4_1"],
      questionPart42: json["question_part_4_2"],
      questionPart43: json["question_part_4_3"],
      questionPart14: json["question_part_1_4"] == null ? [] : List<QuestionPart14>.from(json["question_part_1_4"]!.map((x) => QuestionPart14.fromJson(x))),
      questionPart15: json["question_part_1_5"] == null ? [] : List<QuestionPart15>.from(json["question_part_1_5"]!.map((x) => QuestionPart15.fromJson(x))),
      questionPart16: json["question_part_1_6"] == null ? [] : List<QuestionPart16>.from(json["question_part_1_6"]!.map((x) => QuestionPart16.fromJson(x))),
      questionPart2: json["question_part_2"] == null ? [] : List<QuestionPart2>.from(json["question_part_2"]!.map((x) => QuestionPart2.fromJson(x))),
      questionPart3: json["question_part_3"] == null ? [] : List<QuestionPart3>.from(json["question_part_3"]!.map((x) => QuestionPart3.fromJson(x))),
      questionPart2321: json["question_part_2_3_2_1"] == null ? [] : List<QuestionPart2321>.from(json["question_part_2_3_2_1"]!.map((x) => QuestionPart2321.fromJson(x))),
      questionPart233: json["question_part_2_3_3"] == null ? [] : List<QuestionPart233>.from(json["question_part_2_3_3"]!.map((x) => QuestionPart233.fromJson(x))),
      questionPart24513: json["question_part_2_4_5_1_3"] == null ? [] : List<QuestionPart24513>.from(json["question_part_2_4_5_1_3"]!.map((x) => QuestionPart24513.fromJson(x))),
      questionPart24522: json["question_part_2_4_5_2_2"] == null ? [] : List<QuestionPart24522>.from(json["question_part_2_4_5_2_2"]!.map((x) => QuestionPart24522.fromJson(x))),
      questionPart245311: json["question_part_2_4_5_3_1_1"] == null ? [] : List<QuestionPart245311>.from(json["question_part_2_4_5_3_1_1"]!.map((x) => QuestionPart245311.fromJson(x))),
    );
  }*/

  Map<String, dynamic> toJson() => {
        "respondent_name": respondentName,
        "respondent_adress": respondentAdress,
        "respondent_tel": respondentTel,
        "respondent_subdistrict": respondentSubdistrict,
        "respondent_district": respondentDistrict,
        "respondent_provice": respondentProvice,
        "respondent_zipcode": respondentZipcode,
        "interviewer_id": interviewerId,
        "date_start": dateStart?.toIso8601String(),
        "date_stop": dateStop?.toIso8601String(),
        "question_part_1_1": questionPart11,
        "question_part_1_2": questionPart12,
        "question_part_1_3": questionPart13,
        "question_part_4_1": questionPart41,
        "question_part_4_2": questionPart42,
        "question_part_4_3": questionPart43,
        "question_part_1_4": questionPart14.map((x) => x.toJson()).toList(),
        "question_part_1_5": questionPart15.map((x) => x.toJson()).toList(),
        "question_part_1_6": questionPart16.map((x) => x.toJson()).toList(),
        "question_part_2": questionPart2.map((x) => x.toJson()).toList(),
        "question_part_3": questionPart3.map((x) => x.toJson()).toList(),
        "question_part_2_3_2_1": questionPart2321,
        "question_part_2_3_4": questionPart234,
        "question_part_2_4_5_1_3": questionPart24513,
        "question_part_2_4_5_2_2": questionPart24522,
        "question_part_2_4_5_3_1_1": questionPart245311,
      };
}

class QuestionPart14 {
  QuestionPart14({
    required this.lastYear,
    required this.groupName,
    required this.role,
    required this.note,
  });

  final String? lastYear;
  final String? groupName;
  final String? role;
  final String? note;

  factory QuestionPart14.fromJson(Map<String, dynamic> json) {
    return QuestionPart14(
      lastYear: json["last_year"],
      groupName: json["group_name"],
      role: json["role"],
      note: json["note"],
    );
  }

  Map<String, dynamic> toJson() => {
        "last_year": lastYear,
        "group_name": groupName,
        "role": role,
        "note": note,
      };
}

class QuestionPart15 {
  QuestionPart15({
    required this.landName,
    required this.numberOfAreas,
    required this.address,
    required this.holding,
    required this.utilization,
    required this.soilType,
    required this.areaCharactor,
    required this.note,
  });

  final String? landName;
  final String? numberOfAreas;
  final String? address;
  final String? holding;
  final String? utilization;
  final String? soilType;
  final String? areaCharactor;
  final String? note;

  factory QuestionPart15.fromJson(Map<String, dynamic> json) {
    return QuestionPart15(
      landName: json["land_name"],
      numberOfAreas: json["number_of_areas"],
      address: json["address"],
      holding: json["holding"],
      utilization: json["utilization"],
      soilType: json["soil_type"],
      areaCharactor: json["area_charactor"],
      note: json["note"],
    );
  }

  Map<String, dynamic> toJson() => {
        "land_name": landName,
        "number_of_areas": numberOfAreas,
        "address": address,
        "holding": holding,
        "utilization": utilization,
        "soil_type": soilType,
        "area_charactor": areaCharactor,
        "note": note,
      };
}

class QuestionPart16 {
  QuestionPart16({
    required this.machineType,
    required this.numberOfMachines,
    required this.lastYear,
    required this.status,
    required this.benefitsOfUse,
    required this.tractorHorsepower,
    required this.frequencyOfUse,

    required this.plows,
  });

  final String? machineType;
  final int? numberOfMachines;
  final String? lastYear;
  final String? status;
  final String? benefitsOfUse;
  final int? tractorHorsepower;
  final String? frequencyOfUse;
  final String? plows;
  factory QuestionPart16.fromJson(Map<String, dynamic> json) {
    return QuestionPart16(
      machineType: json["machine_type"],
      numberOfMachines: json["number_of_machines"],
      lastYear: json["last_year"],
      status: json["status"],
      benefitsOfUse: json["benefits_of_use"],
      tractorHorsepower: json["tractor_horsepower"],
      frequencyOfUse: json["frequency_of_use"],
      plows: json["plows"],
    );
  }

  Map<String, dynamic> toJson() => {
        "machine_type": machineType,
        "number_of_machines": numberOfMachines,
        "last_year": lastYear,
        "status": status,
        "benefits_of_use": benefitsOfUse,
        "tractor_horsepower": tractorHorsepower,
        "frequency_of_use": frequencyOfUse,
        "plows": plows,
      };
}

class QuestionPart2 {
  QuestionPart2({
    required this.questionPart233,
    //required this.questionPart234,
    required this.questionPart245,
    required this.questionPart24611,
    required this.questionPart24621,
    //required this.questionPart246211,
    //required this.questionPart246212,
    required this.questionPart24631,
    required this.questionPart24641,
    required this.landNumber,
    required this.landName,
    required this.numberOfArear,
    required this.questionPart211,
    required this.questionPart212,
    required this.questionPart213,
    required this.questionPart214,
    required this.questionPart221,
    required this.questionPart222,
    required this.questionPart223,
    required this.questionPart224,
    required this.questionPart225,
    //required this.questionPart2261,
    required this.questionPart231,
    //required this.questionPart2311,
    required this.questionPart232,
    required this.questionPart241,
    //required this.questionPart2411,
    required this.questionPart242,
    // required this.questionPart2421,
    required this.questionPart243,
    required this.questionPart244,
    required this.questionPart251,
    required this.questionPart252,
    required this.questionPart253,
    required this.questionPart254,
    required this.questionPart255,
    required this.questionPart2551,
    required this.questionPart256,
    required this.questionPart2561,
    required this.questionPart261,
  });

  final int? landNumber;
  final String? landName;
  final double? numberOfArear;
  final String? questionPart211; //
  final String? questionPart212; //
  final String? questionPart213; //
  final String? questionPart214; //
  final String? questionPart221; //
  final String? questionPart222; //
  final String? questionPart223; //
  final String? questionPart224; //
  final String? questionPart225; //
  final String? questionPart231; //
  //final String? questionPart2311;
  final String? questionPart232; //
  final String? questionPart233; //
  final String? questionPart241; //
 // final String? questionPart2411;
  final String? questionPart242; //
  final String? questionPart243; //
  final String? questionPart244; //
  final String? questionPart245; //
  final String? questionPart24611; //
  final String? questionPart24621; //
  final String? questionPart24631; // ใบข้าว
  final String? questionPart24641; //
  final String? questionPart251; //
  final String? questionPart252; //
  final String? questionPart253; //
  final String? questionPart254; //
  final String? questionPart255; //
  final String? questionPart2551; //
  final String? questionPart256; //
  final String? questionPart2561; //
  final String? questionPart261; //
  //final dynamic questionPart234; /// วิธีปลูกในปีการผลิตที่ผ่านมา
  //final dynamic questionPart2261; /// ขั้นตอนการเตรียมดิน
  //final dynamic questionPart2421;  /// กรณีให้น้ำ
  //final dynamic questionPart246211; /// การให้ปุ๋ย
  //final dynamic questionPart246212; /// กรณีกำจัดวัชพืช


  Map<String, dynamic> toJson() => {
        "land_number": landNumber, //
        "land_name": landName, //
        "number_of_arear": numberOfArear, //
        "question_part_2_1_1": questionPart211, //
        "question_part_2_1_2": questionPart212, //
        "question_part_2_1_3": questionPart213, //
        "question_part_2_1_4": questionPart214, //
        "question_part_2_2_1": questionPart221, //
        "question_part_2_2_2": questionPart222, //
        "question_part_2_2_3": questionPart223, //
        "question_part_2_2_4": questionPart224, //
        "question_part_2_2_5": questionPart225, //
        "question_part_2_3_1": questionPart231,
        "question_part_2_3_2": questionPart232,
        "question_part_2_3_3": questionPart233,
        "question_part_2_4_1": questionPart241,
        "question_part_2_4_2": questionPart242,
        "question_part_2_4_3": questionPart243,
        "question_part_2_4_4": questionPart244,
        "question_part_2_4_5": questionPart245,
        "question_part_2_4_5_1_1": questionPart24611,
        "question_part_2_4_5_2_1": questionPart24621,
        "question_part_2_4_5_3_1": questionPart24631,
        "question_part_2_4_5_4_1": questionPart24641,
        "question_part_2_5_1": questionPart251,
        "question_part_2_5_2": questionPart252,
        "question_part_2_5_3": questionPart253,
        "question_part_2_5_4": questionPart254,
        "question_part_2_5_5": questionPart255,
        "question_part_2_5_5_1": questionPart2551,
        "question_part_2_6_1": questionPart261,
        "question_part_2_5_6": questionPart256,
        "question_part_2_5_6_1": questionPart2561,
      };
}



// ขั้นตอนการเตรียมดิน question_part_2.3.3.1
class QuestionPart2261 {
  QuestionPart2261({
    required this.howTo,
    required this.range,
    required this.month,
    required this.numberOfTimes,
    required this.machine,
    required this.source,
    required this.serviceFee,
  });

  final String? howTo;
  final String? range;
  final String? month;
  final int? numberOfTimes;
  final String? machine;
  final String? source;
  final int? serviceFee;

  factory QuestionPart2261.fromJson(Map<String, dynamic> json) {
    return QuestionPart2261(
      howTo: json["how_to"],
      range: json["range"],
      month: json["month"],
      numberOfTimes: json["number_of_times"],
      machine: json["machine"],
      source: json["source"],
      serviceFee: json["service_fee"],
    );
  }

  Map<String, dynamic> toJson() => {
        "how_to": howTo,
        "range": range,
        "month": month,
        "number_of_times": numberOfTimes,
        "machine": machine,
        "source": source,
        "service_fee": serviceFee,
      };
}

// วิธีปลูกในปีการผลิตที่ผ่านมา question_part_2_3_4_1
class QuestionPart234 {
  QuestionPart234({
    required this.howTo,
    required this.range,
    required this.month,
    required this.causa,
    required this.source,
    required this.problem,
  });

  final String? howTo;
  final String? range;
  final String? month;
  final String? causa;
  final String? source;
  final String? problem;

  factory QuestionPart234.fromJson(Map<String, dynamic> json) {
    return QuestionPart234(
      howTo: json["how_to"],
      range: json["range"],
      month: json["month"],
      causa: json["causa"],
      source: json["source"],
      problem: json["problem"],
    );
  }

  Map<String, dynamic> toJson() => {
        "how_to": howTo,
        "range": range,
        "month": month,
        "causa": causa,
        "source": source,
        "problem": problem,
      };
}

// กรณีให้น้ำ question_part_2_4_2_6_1_1
class QuestionPart2421 {
  QuestionPart2421({
    required this.dateRange,
    required this.decision,
    required this.waterSource,
    required this.howToGiveWater,
    required this.amount,
    required this.decisionStop,
    required this.enough,
  });

  final String? dateRange;
  final String? decision;
  final String? waterSource;
  final String? howToGiveWater;
  final String? amount;
  final String? decisionStop;
  final String? enough;

  factory QuestionPart2421.fromJson(Map<String, dynamic> json) {
    return QuestionPart2421(
      dateRange: json["date_range"],
      decision: json["decision"],
      waterSource: json["water_source"],
      howToGiveWater: json["how_to_give_water"],
      amount: json["amount"],
      decisionStop: json["decision_stop"],
      enough: json["enough"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date_range": dateRange,
        "decision": decision,
        "water_source": waterSource,
        "how_to_give_water": howToGiveWater,
        "amount": amount,
        "decision_stop": decisionStop,
        "enough": enough,
      };
}

// การให้ปุ๋ย question_part_2_4_6_2_1
class QuestionPart246211 {
  QuestionPart246211({
    required this.dateRange,
    required this.factor,
    required this.ageRice,
    required this.fertilizerType,
    required this.fertilizerFormula,
    required this.amouht,
    required this.howTo,
    required this.fertilizerSource,
  });

  final String? dateRange;
  final String? factor;
  final String? ageRice;
  final String? fertilizerType;
  final String? fertilizerFormula;
  final String? amouht;
  final String? howTo;
  final String? fertilizerSource;

  factory QuestionPart246211.fromJson(Map<String, dynamic> json) {
    return QuestionPart246211(
      dateRange: json["date_range"],
      factor: json["factor"],
      ageRice: json["age_rice"],
      fertilizerType: json["fertilizer_type"],
      fertilizerFormula: json["fertilizer_formula"],
      amouht: json["amouht"],
      howTo: json["how_to"],
      fertilizerSource: json["fertilizer_source"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date_range": dateRange,
        "factor": factor,
        "age_rice": ageRice,
        "fertilizer_type": fertilizerType,
        "fertilizer_formula": fertilizerFormula,
        "amouht": amouht,
        "how_to": howTo,
        "fertilizer_source": fertilizerSource,
      };
}

// กรณีกำจัดวัชพืช question_part_2_4_5_3_1_1
class QuestionPart245311 {
  QuestionPart245311({
    required this.reason,
    required this.objective,
    required this.howTo,
    required this.toolSource,
    required this.brand,
  });

  final String? reason;
  final String? objective;
  final String? howTo;
  final String? toolSource;
  final String? brand;

  factory QuestionPart245311.fromJson(Map<String, dynamic> json) {
    return QuestionPart245311(
      reason: json["reason"],
      objective: json["objective"],
      howTo: json["how_to"],
      toolSource: json["tool_source"],
      brand: json["brand"],
    );
  }

  Map<String, dynamic> toJson() => {
        "reason": reason,
        "objective": objective,
        "how_to": howTo,
        "tool_source": toolSource,
        "brand": brand,
      };
}

class QuestionPart3 {
  QuestionPart3({
    required this.process,
    required this.typeMachine,
    required this.prossessor,
    required this.prossessor1,
    required this.serviceFee,
    required this.decisionReusons,
  });

  final String? process;
  final String? typeMachine;
  final String? prossessor;
  final String? prossessor1;
  final int? serviceFee;
  final String? decisionReusons;

  factory QuestionPart3.fromJson(Map<String, dynamic> json) {
    return QuestionPart3(
      process: json["process"],
      typeMachine: json["type_machine"],
      prossessor: json["prossessor"],
      prossessor1: json["prossessor_1"],
      serviceFee: json["service_fee"],
      decisionReusons: json["decision_reusons"],
    );
  }

  Map<String, dynamic> toJson() => {
        "process": process,
        "type_machine": typeMachine,
        "prossessor": prossessor,
        "prossessor_1": prossessor1,
        "service_fee": serviceFee,
        "decision_reusons": decisionReusons,
      };
}
