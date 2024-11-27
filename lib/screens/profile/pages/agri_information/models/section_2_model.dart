import 'package:flutter/material.dart';

class Section2Model {
  static String s21H = '2.1 รายละเอียดแปลงทั่วไป';
  static S211 s211 = S211(
    question: '2.1.1 ประเภทการปลูกข้าว',
    values: [
      Section2ValueTextModel(text: '1. นาอินทรีย', value: false),
      Section2ValueTextModel(text: '2. นาสารเคมี', value: false),
      Section2ValueTextModel(text: '3. อื่นๆ', value: false),
    ],
  );
  static S212 s212 = S212(
    question: '2.1.2 ผลผลิตของข้าวเมื่อปีการผลิตที่แล้ว',
    values: [
      Section2PVSModel(
        prefix: 'ปีการผลิต พ.ศ.',
        controller: TextEditingController(),
        suffix: '',
      ),
      Section2PVSModel(
        prefix: 'ผลผลิตรวมต่อไร่',
        controller: TextEditingController(),
        suffix: 'กิโลกรัม/ไร่',
      ),
      Section2PVSModel(
        prefix: 'ผลผลิตรวมรายแปลง',
        controller: TextEditingController(),
        suffix: 'กิโลกรัม',
      ),
    ],
  );
  static S213 s213 = S213(
    question: '2.1.3 แปลงนานี้ได้ผลกระทบจากแล้งหรือไม่',
    values: S213Model(
      value1: Section2ValueTextModel(text: '1. ไม่ได้รับผลกระทบ', value: false),
      value2: Section2CheckVSModel(
        value: false,
        text: '2. ได้รับผลกระทบ ร้อยละ',
        controller: TextEditingController(),
        suffix: 'ของพื้นที',
      ),
    ),
  );
  static S214 s214 = S214(
    question: '2.1.4 ลักษณะของพื้นที่แปลง',
    values: [
      Section2ValueTextModel(text: '1. ที่ลุ่ม', value: false),
      Section2ValueTextModel(text: '2. ที่ทาม', value: false),
      Section2ValueTextModel(text: '3. ที่ดอน, โคก', value: false),
      Section2ValueTextModel(text: '4. แอ่งกระทะ', value: false),
      Section2ValueTextModel(text: '5. ราบ ขั้นบันได', value: false),
    ],
  );
  static S215 s215 = S215(
    question: '2.1.5 ปีที่ผ่านมาท่านได้ทำนาปรังหรือไม่',
    values: S213Model(
      value1: Section2ValueTextModel(text: '1. ไม่ได้ทำ', value: false),
      value2: Section2CheckVSModel(
        value: false,
        text: '2. ทำนาปรัง ได้ผลผลิต',
        controller: TextEditingController(),
        suffix: 'กิโลกรัม/ไร่',
      ),
    ),
  );
  static String s22H = '2.2 ประเภทและวิธีการปลูก';
  static S221 s221 = S221(
    question: '2.2.1 ประเภทข้าวที่ปลูก',
    values: [
      Section2CheckVSModel(
        value: false,
        text: '1. ข้าวเหนียวพันธุ์',
        controller: TextEditingController(),
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: '2. ข้าวเจ้าพันธุ์',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static S222 s222 = S222(
    question: '2.2.2 แหล่งที่มาของพันธุ์',
    values1: [
      Section2ValueTextModel(text: '1. เตรียมพันธุ์ด้วยตัวเอง', value: false),
      Section2ValueTextModel(text: '2. แลกเปลี่ยนกับเกษตรกรรายอื่น', value: false),
    ],
    values2: [
      Section2CheckVSModel(
        value: false,
        text: '3. ซื้อมาจากแหล่งอื่นๆ ระบุ',
        controller: TextEditingController(),
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: '4. อื่น ๆ โปรดระบุ',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static S223 s223 = S223(
    question: '2.2.3 ปัจจัยที่มีผลต่อการคัดเลือกสายพันธุ์คืออะไร (ตอบได้มากกว่า 1 ข้อ)',
    values1: [
      Section2ValueTextModel(text: '1. ให้ผลผลิตต่อพื้นที่สูง', value: false),
      Section2ValueTextModel(text: '2. ทนทานต่อโรคระบาดในพื้นที่', value: false),
      Section2ValueTextModel(text: '3. ทนแล้ง', value: false),
      Section2ValueTextModel(text: '4. ทนเค็ม', value: false),
      Section2ValueTextModel(text: '5. หาพันธุ์ได้ง่ายในพื้นที่', value: false),
    ],
    values2: [
      Section2CheckVSModel(
        value: false,
        text: '6. อื่น ๆ',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static S224 s224 = S224(
    question: '2.2.4 ท่านมีการเปลี่ยนพันธุ์ข้าวหรือไม่',
    values: [
      Section2CheckVSModel(
        value: false,
        text: '1. เปลี่ยนพันธุ์ ทุกๆ',
        controller: TextEditingController(),
        suffix: 'ปี',
      ),
      Section2CheckVSModel(
        value: false,
        text: '2. ไม่เปลี่ยนสายพันธุ์ เพราะ',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static S225 s225 = S225(
    question: '2.2.5 ผลผลิตของข้าวเมื่อปีการผลิตที่แล้ว',
    values: [
      Section2PVSModel(
        prefix: '',
        controller: TextEditingController(),
        suffix: 'กิโลกรัม/ไร่',
      ),
    ],
  );
  static S226 s226 = S226(
    question: '2.2.6 ประเภทการใช้น้ำในแปลงนา',
    question2: 'กรณี อาศัยระบบชลประทาน ชลประทาน',
    values1: [
      Section2ValueTextModel(text: '1. อาศัยน้ำฝน', value: false),
      Section2ValueTextModel(text: '2. อาศัยระบบชลประทาน', value: false),
      Section2ValueTextModel(text: '3. ทั้งอาศัยน้ำฝนและระบบชลประทาน', value: false),
    ],
    values2: [
      Section2CheckVSModel(
        value: false,
        text: '1. คลองชลประทาน',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: '2. น้ำประปา',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: '3. น้ำบาดาล',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: '4. บ่อน้ำตื้น',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: '5. แม่น้ำลำคลอง',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: '6. อื่นๆ (ระบุ)',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static String s23H = '2.3 การเตรียมพื้นที่ก่อนการปลูกข้าว';
  static S231 s231 = S231(
    question: '2.3.1 ก่อนการปลูกข้าว ท่านได้มีการบำรุงดิน หรือไม่',
    yearController: TextEditingController(),
    detailController: TextEditingController(),
    values: [
      Section2ValueTextModel(text: 'ไม่บำรุงดิน', value: false),
      Section2ValueTextModel(
          text: 'มีการบำรุงดิน (ปุ๋ยพืชสด,ปุ๋ยคอก,พืชตระกูลถั่ว(ถั่วพร้า),ปอเทือง)', value: false),
    ],
  );
  static S232 s232 = S232(
    question: '2.3.2 ท่านเริ่มทำการปลูกข้าวช่วง',
    startMonthController: TextEditingController(),
    monthController: TextEditingController(),
  );
  static S23SoilPreparationSteps s23SoilPreparationSteps = S23SoilPreparationSteps(
    values: [],
  );
  static HS23owToPlantInTheLastProductionYears hS23owToPlantInTheLastProductionYears =
      HS23owToPlantInTheLastProductionYears(
    values: [],
  );
  static String s24H = '2.4 การบริหารจัดการแปลง';
  static S241 s241 = S241(
    question: '2.4.1 ในแปลงของท่านพบว่า มีวัชพืช หรือไม่',
    weedController: TextEditingController(),
    percentController: TextEditingController(),
    controlWeedController: TextEditingController(),
    values: [
      Section2ValueTextModel(text: 'ไม่พบวัชพืชในแปลง', value: false),
      Section2ValueTextModel(text: 'พบวัชพืชในแปลง', value: false),
    ],
  );
  static S242 s242 = S242(
    question: '2.4.2 ในแปลงท่านพบพันธุ์ข้าวปนหรือไม่่',
    weedController: TextEditingController(),
    percentController: TextEditingController(),
    values: [
      Section2ValueTextModel(text: 'ไม่พบพันธุ์ข้าวปนในแปลง', value: false),
      Section2ValueTextModel(
          text: 'พบพันธุ์ข้าวปนในแปลง (ข้าวหาง,ข้าวดีด,ข้าวแดง ฯลฯ)', value: false),
    ],
  );
  static S243 s243 = S243(
    question: '2.4.3 ท่านได้กำจัดพันธุ์ปนในแปลงท่านพบพันธุ์ข้าวหรือไม่',
    controller: TextEditingController(),
    values: [
      Section2ValueTextModel(text: 'ไม่กำจัดพันธุ์ข้าวปนในแปลง', value: false),
      Section2ValueTextModel(
          text: 'กำจัดพันธุ์ข้าวปนในแปลง ด้วยวิธี (อธิบายขั้นตอนการกำจัด) ', value: false),
    ],
  );
  static S244 s244 = S244(
    question: '2.4.4 การปลูกซ่อมข้าวหรือไม่',
    values: [
      Section2CheckVSModel(
        value: false,
        text: 'ไม่ซ่อม เพราะ',
        controller: TextEditingController(),
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'ซ่อม เพราะ',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static S245 s245 = S245(
    question: '2.4.5 การดูแลรักษาข้าว',
    s2451: S2451(
      question: '2.4.5.1 การให้น้ำ',
      s24511: S24511(
        question: '2.4.5.1.1 ในการปลูกข้าวของท่าน ได้มีการให้น้ำหรือไม',
        values1: [
          Section2ValueTextModel(text: 'ให้น้ำ (กรอกรายละเอียดในตาราง กรณีให้น้ำ)', value: false),
          Section2ValueTextModel(text: 'ไม่ให้น้ำ สาเหตุเพราะ', value: false),
        ],
        values2: [
          Section2CheckVSModel(
            value: false,
            text: 'เกษตรกรไม่มีเวลา',
            suffix: '',
          ),
          Section2CheckVSModel(
            value: false,
            text: 'อุปกรณ์ในการให้น้ำไม่พร้อม',
            suffix: '',
          ),
          Section2CheckVSModel(
            value: false,
            text: 'ไม่มีน้ำในพื้นที่',
            suffix: '',
          ),
          Section2CheckVSModel(
            value: false,
            text: 'ไม่มีแรงงาน',
            suffix: '',
          ),
          Section2CheckVSModel(
            value: false,
            text: 'ดินมีความชุมชื้นเพียงพอ โดยทราบจาก',
            suffix: '',
            controller: TextEditingController(),
          ),
          Section2CheckVSModel(
            value: false,
            text: 'อื่นๆ',
            suffix: '',
            controller: TextEditingController(),
          ),
        ],
      ),
      s24512: S24512(
        question: '2.4.5.2 การให้ปุ๋ย',
        s24521: S24521(
          question: '2.4.5.2.2 ท่านปลูกข้าวโดยมีการใส่ปุ๋ยหลังจากปลูกแล้วหรือไม่',
          values: [
            Section2CheckVSModel(
              value: false,
              text: 'ใส่ปุ๋ย (กรอกรายละเอียดในตารางกรณีใส่ปุ๋ย)',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'ไม่ใส่ปุ๋ย สาเหตุ',
              suffix: '',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
      s22453: S22453(
        question: '2.4.5.3 การกำจัดวัชพืช',
        values: S224531(
          question: '2.4.5.3.1 ท่านได้มีการกำจัดวัชพืชหรือไม่',
          values: [
            Section2CheckVSModel(
              value: false,
              text: 'กำจัด (กรอกรายละเอียดในตารางกรณีกำจัดวัชพืช)',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'ไม่กำจัด เพราะ',
              suffix: '',
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    ),
  );
  static CaseOfGivingWaters caseOfGivingWaters = CaseOfGivingWaters(
    question: 'กรณีให้น้ำ',
    values: [],
  );
  static CaseOfApplyingFertilizers caseOfApplyingFertilizers = CaseOfApplyingFertilizers(
    question: 'กรณีใส่ปุ๋ย',
    values: [],
  );
  static CaseKillWeeds caseKillWeeds = CaseKillWeeds(
    question: 'กรณีกำจัดวัชพืช',
    values: [],
  );
  static S254532 s254532 = S254532(
    question: '2.5.3.2 ท่านได้มีการตัดใบข้าว หรือไม',
    values: [
      Section2CheckVSModel2(
        value: false,
        text: 'ไม่มีการตัดใบข้าว เพราะ',
        controller: TextEditingController(),
        suffix: '',
      ),
      Section2CheckVSModel2(
        value: false,
        text: 'ตัดใบข้าว จำนวน',
        controller: TextEditingController(),
        suffix: 'ครั้ง',
        values: [/*
          S2TVTVModel(
            title: 'ครั้งที่ 1 ตัดช่วง',
            controller1: TextEditingController(),
            suffix1: 'เพราะ',
            controller2: TextEditingController(),
          ),
          S2TVTVModel(
            title: 'ครั้งที่ 2 ตัดช่วง',
            controller1: TextEditingController(),
            suffix1: 'เพราะ',
            controller2: TextEditingController(),
          ),
          S2TVTVModel(
            title: 'ครั้งที่ 3 ตัดช่วง',
            controller1: TextEditingController(),
            suffix1: 'เพราะ',
            controller2: TextEditingController(),
          ),
        */],
      ),
    ],
  );
  static S224541 s224541 = S224541(
    question: '2.4.5.4 โรคและแมลง',
    values1: [
      Section2CheckVSModel(
        value: false,
        text: 'ไม่พบ',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'พบโรคข้าว',
        suffix: '',
      ),
    ],
    values2: [
      Section2CheckVSModel(
        value: false,
        text: '1. ',
        suffix: '',
        controller: TextEditingController(),
      ),
      Section2CheckVSModel(
        value: false,
        text: '2. ',
        suffix: '',
        controller: TextEditingController(),
      ),
      Section2CheckVSModel(
        value: false,
        text: 'ท่านมีวิธีการแก้ไขโรคที่พบอย่างไร (อธิบายทีละโรค)',
        suffix: '',
        controller: TextEditingController(),
      ),
    ],
  );
  static S224542 s224542 = S224542(
    question: '2.4.5.4.2 ในแปลงนี้ตรวจพบ แมลงศัตรูข้าวหรือไม่',
    values1: [
      Section2CheckVSModel(
        value: false,
        text: 'ไม่พบ',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'พบแมลงศัตรูข้าว',
        suffix: '',
      ),
    ],
    values2: [
      Section2CheckVSModel(
        value: false,
        text: '1. ',
        suffix: '',
        controller: TextEditingController(),
      ),
      Section2CheckVSModel(
        value: false,
        text: '2. ',
        suffix: '',
        controller: TextEditingController(),
      ),
      Section2CheckVSModel(
        value: false,
        text: 'ท่านมีวิธีการแก้ไขปัญหาจากแมลงศัตรูข้าว ที่พบอย่างไร (อธิบายทีละชนิด)',
        suffix: '',
        controller: TextEditingController(),
      ),
    ],
  );
  static String s25H = '2.5 การเก็บเกี่ยว';
  static S251 s251 = S251(
    question: '2.5.1 ท่านเก็บเกี่ยวข้าวช่วง',
    values: [
      Section2CheckVSModel(
        value: false,
        text: 'ช่วง',
        suffix: '(ต้น,กลาง,ปลาย)',
        controller: TextEditingController(),
      ),
      Section2CheckVSModel(
        value: false,
        text: 'เดือน',
        suffix: '',
        controller: TextEditingController(),
      ),
    ],
  );
  static S252 s252 = S252(
    question: '2.5.2 การเก็บเกี่ยวข้าว',
    values1: [
      Section2CheckVSModel(
        value: false,
        text: 'ใช้แรงงานคน',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'แรงงานจ้างทั้งหมด',
        suffix: '',
      ),

      Section2CheckVSModel(
        value: false,
        text: 'แรงงานภายในครัวเรือนทั้งหมด',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'แรงงานภายในครัวเรือนและจ้าง',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'ใช้รถเกี่ยว',
        suffix: '',
      ),
    ],
    values2: [
      Section2CheckVSModel(
        value: false,
        text: 'กลุ่มเกษตรกร',
        suffix: '',
        controller: TextEditingController(),
      ),
      Section2CheckVSModel(
        value: false,
        text: 'เอกชน',
        suffix: '',
      ),

    ],
    values3: [
      Section2CheckVSModel(
        value: false,
        text: 'อัตราค่าให้บริหาร',
        controller: TextEditingController(),
        suffix: 'บาท/ไร่',
      ),
    ],
    values4: [
      Section2CheckVSModel(
        value: false,
        text: 'ทันทีหลังจากการเก็บเกี่ยว',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'หลังเสร็จสิ้นฤดูการเก็บเกี่ยว',
        suffix: '',
      ),
    ],
  );
  static S253 s253 = S253(
    question: '2.5.3 ท่านตัดสินใจเกี่ยวข้าวในวันดังกล่าว เพราะสาเหตุอะไร',
    values: [
      Section2CheckVSModel(
        value: false,
        text: 'ตามช่วงอายุที่เหมาะสม',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'สังเกตุจากลักษณะของรวงข้าวที่พร้อมเก็บเกี่ยว',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'ความพร้อมของแรงงานที่มี',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'เป็นช่วงเวลาที่รถเกี่ยวสามารถเข้ามาเกี่ยวในแปลงได้',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'อื่นๆ',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static S254 s254 = S254(
    question: '2.5.4 ท่านทราบหรือไม่ว่าอายุข้าว มีผลต่อคุณภาพความหอมของข้าว',
    values: [
      Section2CheckVSModel(
        value: false,
        text: 'ไม่ทราบ',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'ทราบ อย่างไร',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
  );
  static S255 s255 = S255(
    question: '2.5.5 การลดความชื้น',
    values: [
      Section2CheckVSModel(
        value: false,
        text: 'ไม่มี',
        suffix: '',
      ),
      Section2CheckVSModel(
        value: false,
        text: 'มีการลดความชื้น',
        controller: TextEditingController(),
        suffix: '',
      ),
    ],
    sunForCount: TextEditingController(),
    sunForDay: TextEditingController(),
    other: TextEditingController(),
  );
  static S256 s256 = S256(
    question: '2.5.6 การใช้ประโยชน์จากเมล็ดข้าว',
    values1: [
      Section2ValueTextModel(
        value: false,
        text: 'ขายทั้งหมด',
      ),
      Section2ValueTextModel(
        value: false,
        text: 'เก็บทั้งหมด',
      ),
      Section2ValueTextModel(
        value: false,
        text: 'ทั้งเก็บและขาย (ให้ทำสัญลักษณ์ทั้งสองส่วน)',
      ),
    ],
    values2: [
      Section2ValueTextModel(
        value: false,
        text: 'ขายให้โรงสี',
      ),
      Section2ValueTextModel(
        value: false,
        text: 'ขายให้เกษตรกร เพื่อทำพันธุ์',
      ),
      Section2ValueTextModel(
        value: false,
        text: 'ขายให้ส่วนราชการ',
      ),
    ],
    values3: [
      Section2ValueTextModel(
        value: false,
        text: 'เก็บไว้บริโภค',
      ),
      Section2ValueTextModel(
        value: false,
        text: 'เก็บไว้ทำพันธุ์',
      ),
    ],
  );

  static String s26H = '2.6 การดูแลแปลงหลังจากการเก็บเกี่ยว';
  static S260 s260 = S260(
    question: '2.6.1 ท่านมีการจัดการแปลงหลังปลูกหรือไม่',
    values1: Section2ValueTextModel(
      value: false,
      text: 'มีการจัดการ',
    ),
    values1s: [
      Section2ValueTextModel(
        value: false,
        text: 'การจัดการฟางข้าว(ฟางอัดก้อน)',
      ),
      Section2ValueTextModel(
        value: false,
        text: 'ไถกลบตอซัง',
      ),
      Section2ValueTextModel(
        value: false,
        text: 'เผาตอซัง',
      ),
    ],
    values2: Section2CheckVSModel(
      value: false,
      text: 'ไม่มีการจัดการ เพราะ',
      controller: TextEditingController(),
      suffix: '',
    ),
  );

}

class S211 {
  String question;
  List<Section2ValueTextModel> values;

  S211({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class Section2ValueTextModel {
  String text;
  bool value;

  Section2ValueTextModel({
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

class S212 {
  String question;
  List<Section2PVSModel> values;

  S212({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class Section2PVSModel {
  String? prefix;
  TextEditingController? controller;
  String? suffix;

  Section2PVSModel({
    this.controller,
    this.prefix,
    this.suffix,
  });

  Map<String, dynamic> toJson() {
    return {
      'prefix': prefix,
      'controller': controller!.text,
      'suffix': suffix,
    };
  }
}

class Section2CheckVSModel {
  bool? value;
  String? text;
  TextEditingController? controller;
  String? suffix;

  Section2CheckVSModel({
    this.controller,
    this.text,
    this.value,
    this.suffix,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'value': value,
      'controller': controller?.text ?? '',
      'suffix': suffix,
    };
  }
}

class S213 {
  String question;
  S213Model values;

  S213({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.toJson(),
    };
  }
}

class S213Model {
  Section2ValueTextModel? value1;
  Section2CheckVSModel? value2;

  S213Model({
    this.value1,
    this.value2,
  });

  Map<String, dynamic> toJson() {
    return {
      'value1': value1!.toJson(),
      'value2': value2!.toJson(),
    };
  }
}

class S214 {
  String question;
  List<Section2ValueTextModel> values;

  S214({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class S215 {
  String question;
  S213Model values;

  S215({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.toJson(),
    };
  }
}

class S221 {
  String question;
  List<Section2CheckVSModel> values;

  S221({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class S222 {
  String question;
  List<Section2ValueTextModel> values1;
  List<Section2CheckVSModel> values2;

  S222({
    required this.question,
    required this.values1,
    required this.values2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
    };
  }
}

class S223 {
  String question;
  List<Section2ValueTextModel> values1;
  List<Section2CheckVSModel> values2;

  S223({
    required this.question,
    required this.values1,
    required this.values2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
    };
  }
}

class S224 {
  String question;
  List<Section2CheckVSModel> values;

  S224({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class S225 {
  String question;
  List<Section2PVSModel> values;

  S225({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class S226 {
  String question;
  List<Section2ValueTextModel> values1;
  String question2;
  List<Section2CheckVSModel> values2;

  S226({
    required this.question,
    required this.values1,
    required this.question2,
    required this.values2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'question2': question2,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
    };
  }
}

class S231 {
  String question;
  List<Section2ValueTextModel> values;
  TextEditingController? yearController;
  TextEditingController? detailController;

  S231({
    required this.question,
    required this.values,
    this.yearController,
    this.detailController,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values.map((e) => e.toJson()).toList(),
      'yearController': yearController?.text ?? '',
      'detailController': detailController?.text ?? '',
    };
  }
}

class S232 {
  String question;
  TextEditingController? startMonthController;
  TextEditingController? monthController;

  S232({
    required this.question,
    this.startMonthController,
    this.monthController,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'startMonthController': startMonthController?.text ?? '',
      'monthController': monthController?.text ?? '',
    };
  }
}

class S23SoilPreparationSteps {
  List<SoilPreparationStepsModel> values;

  S23SoilPreparationSteps({
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class SoilPreparationStepsModel {
  String? wayController;
  String? timeRangeController;
  String? monthController;
  String? countController;
  String? machineController;
  String? fromWhereController;
  String? servicePriceController;

  SoilPreparationStepsModel({
    this.wayController,
    this.timeRangeController,
    this.monthController,
    this.countController,
    this.machineController,
    this.fromWhereController,
    this.servicePriceController,
  });

  Map<String, dynamic> toJson() {
    return {
      'how_to': wayController,
      'range': timeRangeController,
      'month': monthController,
      'number_of_times': countController,
      'machine': machineController,
      'source': fromWhereController,
      'service_fee': servicePriceController,
    };
  }
}

class HS23owToPlantInTheLastProductionYears {
  List<HowToPlantInTheLastProductionYearsModel> values;

  HS23owToPlantInTheLastProductionYears({
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class HowToPlantInTheLastProductionYearsModel {
  String howTo;
  String timeRange;
  String month;
  String cause;
  String machine;
  String problemAndObstacle;

  HowToPlantInTheLastProductionYearsModel({
    required this.howTo,
    required this.timeRange,
    required this.month,
    required this.cause,
    required this.machine,
    required this.problemAndObstacle,
  });

  Map<String, dynamic> toJson() {
    return {
      'how_to': howTo,
      'range': timeRange,
      'month': month,
      'causa': cause,
      'source': machine,
      'problem': problemAndObstacle,
    };
  }
}

class S241 {
  String question;
  List<Section2ValueTextModel> values;
  TextEditingController? weedController;
  TextEditingController? percentController;
  TextEditingController? controlWeedController;

  S241({
    required this.question,
    required this.values,
    this.weedController,
    this.percentController,
    this.controlWeedController,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
      'weedController': weedController?.text ?? '',
      'percentController': percentController?.text ?? '',
      'controlWeedController': controlWeedController?.text ?? '',
    };
  }
}

class S242 {
  String question;
  List<Section2ValueTextModel> values;
  TextEditingController? weedController;
  TextEditingController? percentController;

  S242({
    required this.question,
    required this.values,
    this.weedController,
    this.percentController,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
      'weedController': weedController?.text ?? '',
      'percentController': percentController?.text ?? '',
    };
  }
}

class S243 {
  String question;
  List<Section2ValueTextModel> values;
  TextEditingController? controller;

  S243({
    required this.question,
    required this.values,
    this.controller,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
      'weedController': controller?.text ?? '',
    };
  }
}

class S244 {
  String question;
  List<Section2CheckVSModel> values;

  S244({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class S245 {
  String question;
  S2451 s2451;

  S245({
    required this.question,
    required this.s2451,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      's2451': s2451.toJson(),
    };
  }
}

class S2451 {
  String question;
  S24511 s24511;
  S24512 s24512;
  S22453 s22453;

  S2451({
    required this.question,
    required this.s24511,
    required this.s24512,
    required this.s22453,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      's24511': s24511.toJson(),
      's24512': s24512.toJson(),
      's22453': s22453.toJson(),
    };
  }
}

class S24511 {
  String question;
  List<Section2ValueTextModel> values1;
  List<Section2CheckVSModel> values2;

  S24511({
    required this.question,
    required this.values1,
    required this.values2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
    };
  }
}

class CaseOfGivingWaters {
  String question;
  List<CaseOfGivingWatersModel> values;

  CaseOfGivingWaters({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class CaseOfGivingWatersModel {
  String dmy;
  String decisionStart;
  String waterSource;
  String howToGiveWater;
  String waterAmount;
  String decisionStop;
  String totalWater;

  CaseOfGivingWatersModel({
    required this.dmy,
    required this.decisionStart,
    required this.waterSource,
    required this.howToGiveWater,
    required this.waterAmount,
    required this.decisionStop,
    required this.totalWater,
  });

  Map<String, dynamic> toJson() {
    return {
      'date_range': dmy,
      'decision': decisionStart,
      'water_source': waterSource,
      'how_to_give_water': howToGiveWater,
      'amount': waterAmount,
      'decision_stop': decisionStop,
      'enough': totalWater,
    };
  }
}

class S24512 {
  String question;
  S24521 s24521;

  S24512({
    required this.question,
    required this.s24521,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      's24521': s24521.toJson(),
    };
  }
}

class S24521 {
  String question;
  List<Section2CheckVSModel> values;

  S24521({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class CaseOfApplyingFertilizers {
  String question;
  List<CaseOfApplyingFertilizersModel> values;

  CaseOfApplyingFertilizers({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class CaseOfApplyingFertilizersModel {
  String timeToApply;
  String decision;
  String riceAge;
  String fertilizerType;
  String formula;
  String amountToApply;
  String howToUseFertilizer;
  String fertilizerSource;

  CaseOfApplyingFertilizersModel({
    required this.timeToApply,
    required this.decision,
    required this.riceAge,
    required this.fertilizerType,
    required this.formula,
    required this.amountToApply,
    required this.howToUseFertilizer,
    required this.fertilizerSource,
  });

  Map<String, dynamic> toJson() {
    return {
      'date_range': timeToApply,
      'factor': decision,
      'age_rice': riceAge,
      'fertilizer_type': fertilizerType,
      'fertilizer_formula': formula,
      'amouht': amountToApply,
      'how_to': howToUseFertilizer,
      'fertilizer_source': fertilizerSource,
    };
  }
}

class HowToUseFertilizer {
  String title;
  bool value;

  HowToUseFertilizer({
    required this.title,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'value': value,
    };
  }

  static final datas = [
    HowToUseFertilizer(title: 'ปุ๋ยอินทรีย', value: false),
    HowToUseFertilizer(title: 'ปุ๋ยคอก', value: false),
    HowToUseFertilizer(title: 'น้ำหมักชีวภาพ', value: false),
  ];
}

class Fertilizer {
  String title;
  bool value;

  Fertilizer({
    required this.title,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'value': value,
    };
  }

  static final datas = [
    Fertilizer(title: 'แรงงานคน', value: false),
    Fertilizer(title: 'เครื่องจักร', value: false),
  ];
}

class S22453 {
  String question;
  S224531 values;

  S22453({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values,
    };
  }
}

class S224531 {
  String question;
  List<Section2CheckVSModel> values;

  S224531({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class CaseKillWeeds {
  String question;
  List<CaseKillWeedsModel> values;

  CaseKillWeeds({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class CaseKillWeedsModel {
  String reasonDecision;
  String objective;
  String solution;
  String toolSource;
  String chemicalName;

  CaseKillWeedsModel({
    required this.reasonDecision,
    required this.objective,
    required this.solution,
    required this.toolSource,
    required this.chemicalName,
  });

  Map<String, dynamic> toJson() {
    return {
      'reason': reasonDecision,
      'objective': objective,
      'how_to': solution,
      'tool_source': toolSource,
      'brand': chemicalName,
    };
  }
}

class S254532 {
  String question;
  List<Section2CheckVSModel2> values;

  S254532({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class Section2CheckVSModel2 {
  bool? value;
  String? text;
  TextEditingController? controller;
  String? suffix;
  List<S2TVTVModel>? values;

  Section2CheckVSModel2({
    this.controller,
    this.text,
    this.value,
    this.suffix,
    this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'value': value,
      'controller': controller?.text ?? '',
      'suffix': suffix,
      'values': values?.map((e) => e.toJson()).toList(),
    };
  }
}

class S2TVTVModel {
  String title;
  TextEditingController controller1;
  String suffix1;
  TextEditingController controller2;

  S2TVTVModel({
    required this.title,
    required this.controller1,
    required this.suffix1,
    required this.controller2,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'controller1': controller1.text,
      'suffix1': suffix1,
      'controller2': controller2.text,
    };
  }
}

class S224541 {
  String question;
  List<Section2CheckVSModel> values1;
  List<Section2CheckVSModel> values2;


  S224541({
    required this.question,
    required this.values1,
    required this.values2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
    };
  }
}
class S224542 {
  String question;
  List<Section2CheckVSModel> values1;
  List<Section2CheckVSModel> values2;


  S224542({
    required this.question,
    required this.values1,
    required this.values2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
    };
  }
}

class S251 {
  String question;
  List<Section2CheckVSModel> values;

  S251({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}


class S252 {
  String question;
  List<Section2CheckVSModel> values1;
  List<Section2CheckVSModel> values2;
  List<Section2CheckVSModel> values3;
  List<Section2CheckVSModel> values4;

  S252({
    required this.question,
    required this.values1,
    required this.values2,
    required this.values3,
    required this.values4,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
      'values3': values3.map((e) => e.toJson()).toList(),
      'values4': values4.map((e) => e.toJson()).toList(),
    };
  }
}

class S253 {
  String question;
  List<Section2CheckVSModel> values;

  S253({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}
class S254 {
  String question;
  List<Section2CheckVSModel> values;

  S254({
    required this.question,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
    };
  }
}

class S255 {
  String question;
  List<Section2CheckVSModel> values;
  TextEditingController? sunForDay;
  TextEditingController? sunForCount;
  TextEditingController? other;

  S255({
    required this.question,
    required this.values,
    this.sunForDay,
    this.sunForCount,
    this.other,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values': values.map((e) => e.toJson()).toList(),
      'sunForDay': sunForDay?.text ?? '',
      'sunForCount': sunForCount?.text ?? '',
      'other': other?.text ?? '',
    };
  }
}

class S256 {
  String question;
  List<Section2ValueTextModel> values1;
  List<Section2ValueTextModel> values2;
  List<Section2ValueTextModel> values3;

  S256({
    required this.question,
    required this.values1,
    required this.values2,
    required this.values3,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.map((e) => e.toJson()).toList(),
      'values2': values2.map((e) => e.toJson()).toList(),
      'values3': values3.map((e) => e.toJson()).toList(),
    };
  }
}
class S260 {
  String question;
  Section2ValueTextModel values1;
  List<Section2ValueTextModel> values1s;
  Section2CheckVSModel values2;

  S260({
    required this.question,
    required this.values1,
    required this.values1s,
    required this.values2,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'values1': values1.toJson(),
      'values1s': values1s.map((e) => e.toJson()).toList(),
      'values2': values2.toJson(),
    };
  }
}
