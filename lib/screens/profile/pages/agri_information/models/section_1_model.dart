import 'package:flutter/material.dart';

class Section1Point1 {
  final String question;
  List<Section1Point1Model> model;

  Section1Point1({
    required this.question,
    this.model = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'model': model.map((e) => e.toJson()).toList(),
    };
  }

  static  Section1Point1 section1Point1 = Section1Point1(
    question: '1. รายได้หลักของท่านมาจากอาชีพอะไร',
    model: [
      Section1Point1Model(
        question: '1. อาชีพนอกภาคเกษตร คือ',
        value: false,
        controller: TextEditingController(),
      ),
      Section1Point1Model(
        question: '2. อาชีพในภาคเกษตร คือ',
        value: false,
        controller: TextEditingController(),
      ),
    ],
  );

  static  Section1Point1 section1Point2 = Section1Point1(
    question: '2. เงินจากการขายข้าวเพียงอย่างเดียว เพียงพอที่จะใช้ในครอบครับหรือไม่',
    model: [
      Section1Point1Model(
        question: '1. เพียงพอ',
        value: false,
      ),
      Section1Point1Model(
        question: '2. ไม่เพียงพอ',
        value: false,
      ),
    ],
  );

  static  Section1Point3 section1Point3 = Section1Point3(
    question: '3. ในครัวเรือนของท่านมีที่ดินทำกินรวมทั้งสิ้นจำนวน',
    controller: TextEditingController(),
    suffix: 'แปลง',
  );

  static  Section1Point4 section1Point4 = Section1Point4(
    question: '4. ท่านเคยเป็นสมาชิกกลุ่มหรือวิสาหกิจชุมชนใดบ้าง',
    wasList: [
      Section1Point4Model(
        text: 'เคย',
        value: false,
      ),
      Section1Point4Model(
        text: 'ไม่เคย',
        value: false,
      ),
    ],
    wasListModel: [],
  );

  static  Section1Point5 section1Point5 = Section1Point5(
    question: '5. ท่านมีที่ดินที่ใช้ปลูกข้าวของท่านหรือไม่',
    wasListModel: [],
  );

  static  Section1PointAdOn1 section1PointAdOn1 = Section1PointAdOn1(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 1,
      question: 'แทรกเตอร์',
      value: false,
    ),
    adOn1: AdOn1(
      tractorHourse: TextEditingController(),
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
      adOn1ForUse3: [
        AdOn1ForUse3(
          text: 'ผานไถ',
          value: false,
          count: TextEditingController(),
        ),
        AdOn1ForUse3(
          text: 'ผานไถ',
          value: false,
          count: TextEditingController(),
        ),
        AdOn1ForUse3(
          text: 'ผานไถ',
          value: false,
          count: TextEditingController(),
        ),
        AdOn1ForUse3(
          text: 'ผานไถ',
          value: false,
          count: TextEditingController(),
        ),
        AdOn1ForUse3(
          text: 'ผานไถ',
          value: false,
          count: TextEditingController(),
        ),
      ],
      landExpotion: AdOn1ForUse3(
        text: 'ผานระเบิดดินดาน',
        value: false,
        count: TextEditingController(),
      ),
      rotaree: AdOn1ForUse3(
        text: 'โรตารี่',
        value: false,
        count: TextEditingController(),
      ),
    ),
  );

  static  Section1PointAdOn2 section1PointAdOn2 = Section1PointAdOn2(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 2,
      question: 'เครื่องหยอดเมล็ดข้าว',
      value: false,
    ),
    adOn2: AdOn2(
      rowCount: TextEditingController(),
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );

  static  Section1PointAdOn3 section1PointAdOn3 = Section1PointAdOn3(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 3,
      question: 'เครื่องหว่านเมล็ด',
      value: false,
    ),
    adOn3: AdOn3(
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );

  static  Section1PointAdOn3 section1PointAdOn4 = Section1PointAdOn3(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 3,
      question: 'รถเกี่ยวข้าว',
      value: false,
    ),
    adOn3: AdOn3(
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );

  static  Section1PointAdOn3 section1PointAdOn5 = Section1PointAdOn3(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 3,
      question: 'เครื่องหว่านปุ๋ย',
      value: false,
    ),
    adOn3: AdOn3(
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );

  static  Section1PointAdOn3 section1PointAdOn6 = Section1PointAdOn3(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 3,
      question: 'โดรน',
      value: false,
    ),
    adOn3: AdOn3(
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );

  static  Section1PointAdOn3 section1PointAdOn7 = Section1PointAdOn3(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 3,
      question: 'เครื่องตัดหญ้า',
      value: false,
    ),
    adOn3: AdOn3(
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );

  static  Section1PointAdOn3 section1PointAdOn8 = Section1PointAdOn3(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 3,
      question: 'รถไถนาเดินตาม',
      value: false,
    ),
    adOn3: AdOn3(
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );

  static  Section1PointAdOn3 section1PointAdOn9 = Section1PointAdOn3(
    question: 'ข้อคำถามทรัพยากรเครื่องจักรกลในระดับครัวเรือน',
    tractorModel: Section1PointAdOnModelList(
      id: 3,
      question: 'เครื่องสูบน้ำ',
      value: false,
    ),
    adOn3: AdOn3(
      tractorCount: TextEditingController(),
      tractorYear: TextEditingController(),
      tractorStatus: [
        Section1PointAdOnModelList(
          id: 1,
          question: 'ไม่สามารถใช้ได้',
          value: false,
        ),
        Section1PointAdOnModelList(
          id: 2,
          question: 'สามารถใช้ได้',
          value: false,
        ),
      ],
      forUse: AdOn1ForUse(
        inHome: Section1PointAdOnModelList(
          id: 1,
          question: 'ใช้ในครัวเรือน',
          value: false,
        ),
        forWorks: AdOn1ForUse2(
          forWork: Section1PointAdOnModelList(
            id: 1,
            question: 'ให้บริการรับจ้าง',
            value: false,
          ),
          forWorkList: [
            Section1PointAdOnModelList(
              id: 1,
              question: 'ภายในกลุ่มแปลงใหญ่',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 2,
              question: 'ภายในตำบล',
              value: false,
            ),
            Section1PointAdOnModelList(
              id: 3,
              question: 'ภายนอกตำบล',
              value: false,
            ),
          ],
        ),
      ),
      week: TextEditingController(),
      month: TextEditingController(),
      year: TextEditingController(),
    ),
  );


}

class Section1Point1Model {
  String question;
  bool value;
  TextEditingController? controller;

  Section1Point1Model({
    required this.question,
    required this.value,
    this.controller,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'value': value,
      'controller': controller?.text,
    };
  }
}

class Section1Point3 {
  final String question;
  final TextEditingController controller;
  final String suffix;

  Section1Point3({
    required this.question,
    required this.controller,
    required this.suffix,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'controller': controller.text,
      'suffix': suffix,
    };
  }
}

class Section1Point4 {
  String question;
  List<Section1Point4Model> wasList;
  List<Section1Point4WasListModel> wasListModel;

  Section1Point4({
    required this.question,
    this.wasList = const [],
    this.wasListModel = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'wasList': wasList.map((e) => e.toJson()).toList(),
      'wasListModel': wasListModel.map((e) => e.toJson()).toList(),
    };
  }
}

class Section1Point4WasListModel {
  TextEditingController dty;
  TextEditingController group;
  TextEditingController role;
  TextEditingController? remark;

  Section1Point4WasListModel({
    required this.dty,
    required this.group,
    required this.role,
    this.remark,
  });

  Map<String, dynamic> toJson() {
    return {
      'dty': dty.text,
      'group': group.text,
      'role': role.text,
      'remark': remark?.text,
    };
  }
}

class Section1Point4Model {
  String text;
  bool value;

  Section1Point4Model({
    required this.text,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'value': value,
    };
  }
}

class Section1Point5 {
  String question;
  List<Section1Point5ListModel> wasListModel;

  Section1Point5({
    required this.question,
    this.wasListModel = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'wasListModel': wasListModel.map((e) => e.toJson()).toList(),
    };
  }
}

class Section1Point5ListModel {
  String landName;
  String landZCount;
  String landArea;
  String landHolding;
  String landForUse;
  String landType;
  String landRemark;
  LandType? landTypeList;

  Section1Point5ListModel({
    required this.landName,
    required this.landZCount,
    required this.landArea,
    required this.landHolding,
    required this.landForUse,
    required this.landType,
    required this.landRemark,
    this.landTypeList,
  });

  Map<String, dynamic> toJson() {
    return {
      'landName': landName,
      'landZCount': landZCount,
      'landArea': landArea,
      'landHolding': landHolding,
      'landForUse': landForUse,
      'landType': landType,
      'landRemark': landRemark,
      'landTypeList': landTypeList?.toJson(),
    };
  }
}

class LandType {
  final String name;
  bool value;

  LandType({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'name': name,
    };
  }

  static final List<LandType> landTypeList = [
    LandType(name: 'ลุ่ม', value: false),
    LandType(name: 'ดอน', value: false),
  ];
}

class Section1PointAdOnModelList {
  int id;
  String question;
  bool value;

  Section1PointAdOnModelList({
    required this.id,
    required this.question,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'value': value,
    };
  }
}

class Section1PointAdOn1 {
  String question;
  Section1PointAdOnModelList tractorModel;
  AdOn1 adOn1;

  Section1PointAdOn1({
    required this.question,
    required this.tractorModel,
    required this.adOn1,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'tractorModel': tractorModel.toJson(),
      'adOn1': adOn1.toJson(),
    };
  }
}

class AdOn1ForUse2 {
  Section1PointAdOnModelList forWork;
  List<Section1PointAdOnModelList> forWorkList;

  AdOn1ForUse2({
    required this.forWork,
    required this.forWorkList,
  });

  Map<String, dynamic> toJson() {
    return {
      'forWork': forWork.toJson(),
      'forWorkList': forWorkList.map((e) => e.toJson()).toList(),
    };
  }
}

class AdOn1ForUse {
  Section1PointAdOnModelList inHome;
  AdOn1ForUse2 forWorks;

  AdOn1ForUse({
    required this.inHome,
    required this.forWorks,
  });

  Map<String, dynamic> toJson() {
    return {
      'inHome': inHome.toJson(),
      'forWorks': forWorks.toJson(),
    };
  }
}

class AdOn1ForUse3 {
  String? text;
  bool value;
  TextEditingController? count;

  AdOn1ForUse3({
    this.text,
    required this.value,
    this.count,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'value': value,
      'count': count?.text,
    };
  }
}

class AdOn1 {
  TextEditingController? tractorHourse;
  TextEditingController? tractorCount;
  TextEditingController? tractorYear;
  List<Section1PointAdOnModelList> tractorStatus;
  AdOn1ForUse forUse;

  TextEditingController? week;
  TextEditingController? month;
  TextEditingController? year;

  List<AdOn1ForUse3> adOn1ForUse3;
  AdOn1ForUse3 landExpotion;
  AdOn1ForUse3 rotaree;

  AdOn1({
    this.tractorHourse,
    this.tractorCount,
    this.tractorYear,
    required this.tractorStatus,
    required this.forUse,
    this.week,
    this.month,
    this.year,
    required this.adOn1ForUse3,
    required this.landExpotion,
    required this.rotaree,
  });

  Map<String, dynamic> toJson() {
    return {
      'tractorHourse': tractorHourse?.text ?? '0',
      'tractorCount': tractorCount?.text ?? '0',
      'tractorYear': tractorYear?.text ?? '0',
      'tractorStatus': tractorStatus.map((e) => e.toJson()).toList(),
      'forUse': forUse,
      'week': week?.text ?? '0',
      'month': month?.text ?? '0',
      'year': year?.text ?? '0',
      'adOn1ForUse3': adOn1ForUse3.map((e) => e.toJson()).toList(),
      'landExpotion': landExpotion.toJson(),
      'rotaree': rotaree.toJson(),
    };
  }
}

class Section1PointAdOn2 {
  String question;
  Section1PointAdOnModelList tractorModel;
  AdOn2 adOn2;

  Section1PointAdOn2({
    required this.question,
    required this.tractorModel,
    required this.adOn2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'tractorModel': tractorModel.toJson(),
      'adOn1': adOn2.toJson(),
    };
  }
}

class AdOn2 {
  TextEditingController? rowCount;
  TextEditingController? tractorCount;
  TextEditingController? tractorYear;
  List<Section1PointAdOnModelList> tractorStatus;
  AdOn1ForUse forUse;

  TextEditingController? week;
  TextEditingController? month;
  TextEditingController? year;

  AdOn2({
    this.rowCount,
    this.tractorCount,
    this.tractorYear,
    required this.tractorStatus,
    required this.forUse,
    this.week,
    this.month,
    this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'rowCount': rowCount?.text ?? '0',
      'tractorCount': tractorCount?.text ?? '0',
      'tractorYear': tractorYear?.text ?? '0',
      'tractorStatus': tractorStatus.map((e) => e.toJson()).toList(),
      'forUse': forUse,
      'week': week?.text ?? '0',
      'month': month?.text ?? '0',
      'year': year?.text ?? '0',
    };
  }
}

class Section1PointAdOn3 {
  String question;
  Section1PointAdOnModelList tractorModel;
  AdOn3 adOn3;

  Section1PointAdOn3({
    required this.question,
    required this.tractorModel,
    required this.adOn3,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'tractorModel': tractorModel.toJson(),
      'adOn1': adOn3.toJson(),
    };
  }
}


class AdOn3 {
  TextEditingController? tractorCount;
  TextEditingController? tractorYear;
  List<Section1PointAdOnModelList> tractorStatus;
  AdOn1ForUse forUse;

  TextEditingController? week;
  TextEditingController? month;
  TextEditingController? year;



  AdOn3({
    this.tractorCount,
    this.tractorYear,
    required this.tractorStatus,
    required this.forUse,
    this.week,
    this.month,
    this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'tractorCount': tractorCount?.text,
      'tractorYear': tractorYear?.text,
      'tractorStatus': tractorStatus.map((e) => e.toJson()).toList(),
      'forUse': forUse,
      'week': week?.text,
      'month': month?.text,
      'year': year?.text,
    };
  }

}
