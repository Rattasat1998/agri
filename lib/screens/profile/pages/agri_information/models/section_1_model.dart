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

  factory Section1Point1.fromJson(Map<String, dynamic> json) {
    return Section1Point1(
      question: json['question'],
      model: List<Section1Point1Model>.from(json['model'].map((x) => Section1Point1Model.fromJson(x))),
    );
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
    mainSequenceToUseModel: [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
          text: 'ผานไถหัวหมู',
          value: false,
        ),
        AdOn1ForUse3(
          text: 'ผานไถจาน 3',
          value: false,
        ),
        AdOn1ForUse3(
          text: 'ผานไถจาน 5',
          value: false,
        ),
        AdOn1ForUse3(
          text: 'ผานไถจาน 7',
          value: false,
        ),
        AdOn1ForUse3(
          text: 'โรตารี่ หรือ จอบหมุน',
          value: false,
        ),
        AdOn1ForUse3(
          text: 'เครื่องหยอดเมล็ดข้าว',
          value: false,
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
    mainSequenceToUseModel: [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
    mainSequenceToUseModel: [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
    mainSequenceToUseModel:  [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
    mainSequenceToUseModel:  [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
    mainSequenceToUseModel:  [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
    mainSequenceToUseModel:  [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
    mainSequenceToUseModel:  [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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
    mainSequenceToUseModel:  [
      MainSequenceToUseModel(
        text: 'ในฤกาลผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'เริ่มเพาะปลูก',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'ดูแลแปลง',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
          SubSequenceToUseModel(
            text: 'เก็บเกี่ยว',
            value: false,
            controller: TextEditingController(),
            suffix: 'วัน',
          ),
        ],
      ),
      MainSequenceToUseModel(
        text: 'นอกฤดูการผลิตข้าว',
        value: false,
        subs: [
          SubSequenceToUseModel(
            text: 'ช่วงเดือน',
            value: false,
            controller: TextEditingController(),
            suffix: '',
          ),

        ],
      ),
      MainSequenceToUseModel(
        text: 'ตลอดทั้งปี',
        value: false,

      ),
    ],
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


class MainSequenceToUseModel {

  final String text;
   bool value;
  final List<SubSequenceToUseModel> subs;

  MainSequenceToUseModel({
    required this.text,
    required this.value,
     this.subs = const [],
  });


  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'value': value,
      'subs': subs.map((e) => e.toJson()).toList(),
    };
  }




}

class SubSequenceToUseModel {
  final String text;
   bool value;
  final TextEditingController controller;
  final String suffix;

  SubSequenceToUseModel({
    required this.text,
    required this.value,
    required this.controller,
    required this.suffix,
  });

  Map <String, dynamic> toJson() {
    return {
      'text': text,
      'value': value,
      'controller': controller.text,
      'suffix': suffix,
    };
  }

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

  factory Section1Point1Model.fromJson(Map<String, dynamic> json) {
    return Section1Point1Model(
      question: json['question'],
      value: json['value'],
      controller: TextEditingController(text: json['controller']),
    );
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

  factory Section1Point3.fromJson(Map<String, dynamic> json) {
    return Section1Point3(
      question: json['question'],
      controller: TextEditingController(text: json['controller']),
      suffix: json['suffix'],
    );
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

  factory Section1Point4.fromJson(Map<String, dynamic> json) {
    return Section1Point4(
      question: json['question'],
      wasList: List<Section1Point4Model>.from(json['wasList'].map((x) => Section1Point4Model.fromJson(x))),
      wasListModel: List<Section1Point4WasListModel>.from(json['wasListModel'].map((x) => Section1Point4WasListModel.fromJson(x))),
    );
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

  factory Section1Point4WasListModel.fromJson(Map<String, dynamic> json) {
    return Section1Point4WasListModel(
      dty: json['dty'],
      group: json['group'],
      role: json['role'],
      remark: json['remark'],
    );
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

  factory Section1Point4Model.fromJson(Map<String, dynamic> json) {
    return Section1Point4Model(
      text: json['text'],
      value: json['value'],
    );
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

  factory Section1Point5.fromJson(Map<String, dynamic> json) {
    return Section1Point5(
      question: json['question'],
      wasListModel: List<Section1Point5ListModel>.from(json['wasListModel'].map((x) => Section1Point5ListModel.fromJson(x))),
    );
  }
}
List<LandHoldingModel> landHoldingG = [];
List<LandTypeModel> landTypeG = [];

class Section1Point5ListModel {
  String landName;
  String landZCount;
  String landArea;
  List<LandHoldingModel> landHolding;
  String landForUse;
  List<LandTypeModel> landType;
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
      'landHolding': landHolding.map((e) => e.toJson()).toList(),
      'landForUse': landForUse,
      'landType': landType.map((e) => e.toJson()).toList(),
      'landRemark': landRemark,
      'landTypeList': landTypeList?.toJson(),
    };
  }

  factory Section1Point5ListModel.fromJson(Map<String, dynamic> json) {
    return Section1Point5ListModel(
      landName: json['landName'],
      landZCount: json['landZCount'],
      landArea: json['landArea'],
      landHolding: json['landHolding'],
      landForUse: json['landForUse'],
      landType: json['landType'],
      landRemark: json['landRemark'],
      landTypeList: LandType.fromJson(json['landTypeList']),
    );
  }
}

class MainLandHoldingModel {
  final String title;
  List<LandHoldingModel> modelList;

  MainLandHoldingModel({
    required this.title,
    required this.modelList,
  });

  MainLandHoldingModel copyWith({
    String? title,
    List<LandHoldingModel>? modelList,
  }) {
    return MainLandHoldingModel(
      title: title ?? this.title,
      modelList: modelList ?? this.modelList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'model': modelList.map((e) => e.toJson()).toList(),
    };
  }



   static MainLandHoldingModel landHoldingList = MainLandHoldingModel(
    title: 'การถือครอง',
    modelList: [
      LandHoldingModel(
        value: false,
        text: 'โฉนดที่ดิน',
      ),
      LandHoldingModel(
        value: false,
        text: 'หนังสือรับรองการทำประโยชน์ (น.ส. 3, น.ส. 3 ก, น.ส. 3 ข)',
      ),
      LandHoldingModel(
        value: false,
        text: 'ใบจอง (น.ส. 2)',
      ),
      LandHoldingModel(
        value: false,
        text: 'ส.ป.ก. 4-01',
      ),
    ],
  );
}


class MainLandTypeModel {
  final String title;
  List<LandTypeModel> modelList;

  MainLandTypeModel({
    required this.title,
    required this.modelList,
  });

  MainLandTypeModel copyWith({
    String? title,
    List<LandTypeModel>? modelList,
  }) {
    return MainLandTypeModel(
      title: title ?? this.title,
      modelList: modelList ?? this.modelList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'model': modelList.map((e) => e.toJson()).toList(),
    };
  }


  static MainLandTypeModel landTypeList = MainLandTypeModel(
    title: 'ชนิดดิน',
    modelList: [
      LandTypeModel(
        value: false,
        text: 'ดินเหนียว',
      ),
      LandTypeModel(
        value: false,
        text: 'ดินทราย',
      ),
      LandTypeModel(
        value: false,
        text: 'ดินร่วน',
      ),
      LandTypeModel(
        value: false,
        text: ' อื่นๆ ระบุ',
        isAnother: true,
        another: TextEditingController(),
      ),
    ],
  );



}

class LandTypeModel {
   bool value;
   String text;
   bool isAnother;
   TextEditingController? another;

   LandTypeModel({
    required this.value,
    required this.text,
     this.isAnother = false,
      this.another,
  });




  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'text': text,
      'isAnother': isAnother,
      'another': another?.text,
    };
  }






}
class LandHoldingModel {
   bool value;
   String text;

  LandHoldingModel({
    required this.value,
    required this.text,
  });


  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'text': text,
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

  factory LandType.fromJson(Map<String, dynamic> json) {
    return LandType(
      name: json['name'],
      value: json['value'],
    );
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

  factory Section1PointAdOnModelList.fromJson(Map<String, dynamic> json) {
    return Section1PointAdOnModelList(
      id: json['id'],
      question: json['question'],
      value: json['value'],
    );
  }

}

class Section1PointAdOn1 {
  String question;
  Section1PointAdOnModelList tractorModel;
  AdOn1 adOn1;
  List<MainSequenceToUseModel> mainSequenceToUseModel;

  Section1PointAdOn1({
    required this.question,
    required this.tractorModel,
    required this.adOn1,
     this.mainSequenceToUseModel = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'tractorModel': tractorModel.toJson(),
      'adOn1': adOn1.toJson(),
      'mainSequenceToUseModel': mainSequenceToUseModel.map((e) => e.toJson()).toList(),
    };
  }

  factory Section1PointAdOn1.fromJson(Map<String, dynamic> json) {
    return Section1PointAdOn1(
      question: json['question'],
      tractorModel:  Section1PointAdOnModelList.fromJson(json['tractorModel']),
      adOn1: AdOn1.fromJson(json['adOn1']),
    );
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

  factory AdOn1ForUse2.fromJson(Map<String, dynamic> json) {
    return AdOn1ForUse2(
      forWork: Section1PointAdOnModelList.fromJson(json['forWork']),
      forWorkList: List<Section1PointAdOnModelList>.from(json['forWorkList'].map((x) => Section1PointAdOnModelList.fromJson(x))),
    );
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

  factory AdOn1ForUse.fromJson(Map<String, dynamic> json) {
    return AdOn1ForUse(
      inHome: Section1PointAdOnModelList.fromJson(json['inHome']),
      forWorks: AdOn1ForUse2.fromJson(json['forWorks']),
    );
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

  factory AdOn1ForUse3.fromJson(Map<String, dynamic> json) {
    return AdOn1ForUse3(
      text: json['text'],
      value: json['value'],
      count: TextEditingController(text: json['count']),
    );
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


  factory AdOn1.fromJson(Map<String, dynamic> json) {
    return AdOn1(
      tractorHourse: TextEditingController(text: json['tractorHourse']),
      tractorCount: TextEditingController(text: json['tractorCount']),
      tractorYear: TextEditingController(text: json['tractorYear']),
      tractorStatus: List<Section1PointAdOnModelList>.from(json['tractorStatus'].map((x) => Section1PointAdOnModelList.fromJson(x))),
      forUse: AdOn1ForUse.fromJson(json['forUse']),
      week: TextEditingController(text: json['week']),
      month: TextEditingController(text: json['month']),
      year: TextEditingController(text: json['year']),
      adOn1ForUse3: List<AdOn1ForUse3>.from(json['adOn1ForUse3'].map((x) => AdOn1ForUse3.fromJson(x))),
      landExpotion: AdOn1ForUse3.fromJson(json['landExpotion']),
      rotaree: AdOn1ForUse3.fromJson(json['rotaree']),
    );
  }


}

class Section1PointAdOn2 {
  String question;
  Section1PointAdOnModelList tractorModel;
  AdOn2 adOn2;
  List<MainSequenceToUseModel> mainSequenceToUseModel;

  Section1PointAdOn2({
    required this.question,
    required this.tractorModel,
    required this.adOn2,
    this.mainSequenceToUseModel = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'tractorModel': tractorModel.toJson(),
      'adOn1': adOn2.toJson(),
      'mainSequenceToUseModel': mainSequenceToUseModel.map((e) => e.toJson()).toList(),
    };
  }

  factory Section1PointAdOn2.fromJson(Map<String, dynamic> json) {
    return Section1PointAdOn2(
      question: json['question'],
      tractorModel: Section1PointAdOnModelList.fromJson(json['tractorModel']),
      adOn2: AdOn2.fromJson(json['adOn1']),
    );
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

  factory AdOn2.fromJson(Map<String, dynamic> json) {
    return AdOn2(
      rowCount: TextEditingController(text: json['rowCount']),
      tractorCount: TextEditingController(text: json['tractorCount']),
      tractorYear: TextEditingController(text: json['tractorYear']),
      tractorStatus: List<Section1PointAdOnModelList>.from(json['tractorStatus'].map((x) => Section1PointAdOnModelList.fromJson(x))),
      forUse: AdOn1ForUse.fromJson(json['forUse']),
      week: TextEditingController(text: json['week']),
      month: TextEditingController(text: json['month']),
      year: TextEditingController(text: json['year']),
    );
  }

}

class Section1PointAdOn3 {
  String question;
  Section1PointAdOnModelList tractorModel;
  AdOn3 adOn3;
  List<MainSequenceToUseModel> mainSequenceToUseModel;

  Section1PointAdOn3({
    required this.question,
    required this.tractorModel,
    required this.adOn3,
    this.mainSequenceToUseModel = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'tractorModel': tractorModel.toJson(),
      'adOn1': adOn3.toJson(),
      'mainSequenceToUseModel': mainSequenceToUseModel.map((e) => e.toJson()).toList(),
    };
  }

  factory Section1PointAdOn3.fromJson(Map<String, dynamic> json) {
    return Section1PointAdOn3(
      question: json['question'],
      tractorModel: Section1PointAdOnModelList.fromJson(json['tractorModel']),
      adOn3: AdOn3.fromJson(json['adOn1']),
    );
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

  factory AdOn3.fromJson(Map<String, dynamic> json) {
    return AdOn3(
      tractorCount: TextEditingController(text: json['tractorCount']),
      tractorYear: TextEditingController(text: json['tractorYear']),
      tractorStatus: List<Section1PointAdOnModelList>.from(json['tractorStatus'].map((x) => Section1PointAdOnModelList.fromJson(x))),
      forUse: AdOn1ForUse.fromJson(json['forUse']),
      week: TextEditingController(text: json['week']),
      month: TextEditingController(text: json['month']),
      year: TextEditingController(text: json['year']),
    );
  }

}
