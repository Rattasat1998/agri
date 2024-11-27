import 'package:agri/screens/profile/pages/agri_information/models/section_2_data_model.dart';
import 'package:agri/screens/profile/pages/agri_information/repositories/agri_info_repository.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../utils/themes.dart';
import '../../../../widgets/back_button_widget.dart';
import '../../../../widgets/custom_text.dart';
import 'bloc/agri_info_bloc.dart';
import 'info_image.dart';
import 'models/map_data_model.dart';
import 'models/rice_field_model.dart';
import 'models/section_1_data_model.dart';
import 'models/section_1_model.dart';
import 'models/section_2_model.dart';
import 'models/section_3_model.dart';

class AgriInformationPage extends StatefulWidget {
  const AgriInformationPage({super.key});

  @override
  State<AgriInformationPage> createState() => _AgriInformationPageState();
}

class _AgriInformationPageState extends State<AgriInformationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButtonWidget(),
      ),
      body: BlocBuilder<AgriInfoBloc, AgriInfoState>(
        builder: (context, state) {
          bool isStaffPending = !state.statusPending[0];
          bool isSection1 = !state.statusPending[1];

          if (Section2DataModel.datas.isNotEmpty) {
            state.isSection2Pending = true;
          } else {
            state.isSection2Pending = false;
          }

          print(Section3Model.data3.length);

          if (Section3Model.data3.length != 0) {
            print('Section3Model.data3.isNotEmpty');
            state.isSection3Pending = true;
          } else {
            state.isSection3Pending = false;
          }

          bool isSection2 = !state.isSection2Pending;
          bool isSection3 = !state.isSection3Pending;




          return Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: MediaQuery.of(context).size.width,
                color: ThemeConfig.primary,
                child: const CustomText(
                  text: 'แบบสัมภาษณ์ระดับครัวเรือน',
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              _buildInfoMenuWidget(
                context: context,
                imageLogo: InfoImages.interview,
                subTitle: 'บันทึกข้อมูลสำหรับพนักงานสัมภาษณ์',
                status: isStaffPending ? 'รอดำเนินการ' : 'เสร็จสิ้น',
                statusColor: isStaffPending ? Colors.red : Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.interviewStaffPage, arguments: {
                    'staffs': state.interviewers,
                    'staffData': state.staffData,
                  });
                },
              ),
              _buildInfoMenuWidget(
                context: context,
                imageLogo: InfoImages.section1,
                title: 'ส่วนที่ 1 ',
                subTitle: 'ข้อมูลเกี่ยวกับทรัพยากรครัวเรือน',
                status: isSection1 ? 'รอดำเนินการ' : 'เสร็จสิ้น',
                statusColor: isSection1 ? Colors.red : Colors.green,
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.section1Page);
                  setState(() {});
                },
              ),
              _buildInfoMenuWidget(
                context: context,
                imageLogo: InfoImages.section2,
                title: 'ส่วนที่ 2 ',
                subTitle: 'ข้อมูลเกี่ยวกับระบบการปลูกข้าว',
                status: isSection2 ? 'รอดำเนินการ' : 'เสร็จสิ้น',
                statusColor: isSection2 ? Colors.red : Colors.green,
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.section2Page);
                  setState(() {});
                },
              ),
              _buildInfoMenuWidget(
                context: context,
                imageLogo: InfoImages.section3,
                title: 'ส่วนที่ 3 ',
                subTitle: 'การตัดสินใจใช้บริการเครื่องจักรในกระบวนการผลิตข้าวขอวครัวเรือน',
                status: isSection3 ? 'รอดำเนินการ' : 'เสร็จสิ้น',
                statusColor: isSection3 ? Colors.red : Colors.green,
                onPressed: () async {
                  await Navigator.pushNamed(context, AppRoutes.section3Page);
                  setState(() {});
                },
              ),
              const Spacer(),
              CupertinoButton(
                color: const Color(0xff194902),
                onPressed: () async {

                  List<QuestionPart14> questionPart14 = [];
                  List<QuestionPart15> questionPart15 = [];
                  List<QuestionPart16> questionPart16 = [];
                  List<QuestionPart2> questionPart2 = [];

                  bool isInterview = !state.statusPending[0];
                  bool isSection1 = !state.statusPending[1];
                  bool isSection2 = !state.isSection2Pending;
                  bool isSection3 = !state.isSection3Pending;

                  print('isInterview: $isInterview');
                  print('isSection1: $isSection1');
                  print('isSection2: $isSection2');
                  print('isSection3: $isSection3');


                  if (isInterview || isSection1 || isSection2 || isSection3) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const CustomText(
                            text: 'ข้อมูลไม่ครบถ้วน',
                            color: Colors.black,
                            fontSize: 24,
                          ),
                          content: const CustomText(
                            text: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                            color: Colors.black,
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: const CustomText(
                                text: 'ตกลง',
                                color: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      },
                    );
                    return;
                  }

                  final p11 = state.selectedPoint1!.model.where((e) => e.value == true).first;
                  final p12 = state.selectedPoint2!.model.where((e) => e.value == true).first;
                  final p13 = state.selectedPoint3;
                  final p13v = '${p13?.controller.text} แปลง';

                  final p14 = state.selectedPoint4!.wasListModel;
                  final p15 = state.selectedPoint5!.wasListModel;
                  final p161 = state.selectedPointAdOn1;
                  final p162 = state.selectedPointAdOn2;



                  if (p161 != null) {
                    String benefitsOfUse = '';

                    final benefitsOfUse1 = p161.adOn1.forUse.inHome;
                    final benefitsOfUse2 = p161.adOn1.forUse.forWorks;
                    final forUse3 = p161.adOn1.adOn1ForUse3;

                    if (benefitsOfUse1.value) {
                      benefitsOfUse = benefitsOfUse1.question;
                    }

                    if (benefitsOfUse2.forWork.value) {
                      benefitsOfUse = benefitsOfUse2.forWork.question;

                      for (var item in benefitsOfUse2.forWorkList) {
                        if (item.value) {
                          benefitsOfUse += ', ${item.question}';
                        }
                      }
                    }

                    print(p161.tractorModel.question);

                    questionPart16.add(
                      QuestionPart16(
                        machineType: p161.tractorModel.question,
                        numberOfMachines: int.parse(p161.adOn1.tractorCount!.text),
                        lastYear: p161.adOn1.tractorYear?.text,
                        status:
                            p161.adOn1.tractorStatus.firstWhere((e) => e.value == true).question,
                        benefitsOfUse: benefitsOfUse,
                        weekUse: p161.adOn1.week!.text.isEmpty
                            ? null
                            : int.parse(p161.adOn1.week?.text ?? '0'),
                        monthUse: p161.adOn1.month!.text.isEmpty
                            ? null
                            : int.parse(p161.adOn1.month?.text ?? '0'),
                        yearUse: p161.adOn1.year!.text.isEmpty
                            ? null
                            : int.parse(p161.adOn1.year?.text ?? '0'),
                        tractorHorsepower: int.parse(p161.adOn1.tractorHourse?.text ?? '0'),
                        plow1: forUse3[0].count?.text != ''
                            ? int.parse(forUse3[0].count?.text ?? '0')
                            : 0,
                        plow2: forUse3[1].count?.text != ''
                            ? int.parse(forUse3[1].count?.text ?? '0')
                            : 0,
                        plow3: forUse3[2].count?.text != ''
                            ? int.parse(forUse3[2].count?.text ?? '0')
                            : 0,
                        plow4: forUse3[3].count?.text != ''
                            ? int.parse(forUse3[3].count?.text ?? '0')
                            : 0,
                        plow5: forUse3[4].count?.text != ''
                            ? int.parse(forUse3[4].count?.text ?? '0')
                            : 0,
                        plowBomb: p161.adOn1.landExpotion.value == true ? 1 : null,
                        rotary: p161.adOn1.rotaree.value == true ? 1 : null,
                        rowOfRice: null,
                      ),
                    );
                  }

                  if (p162 != null) {
                    String benefitsOfUse = '';

                    final benefitsOfUse1 = p162.adOn2.forUse.inHome;
                    final benefitsOfUse2 = p162.adOn2.forUse.forWorks;
                    if (benefitsOfUse1.value) {
                      benefitsOfUse = benefitsOfUse1.question;
                    }

                    if (benefitsOfUse2.forWork.value) {
                      benefitsOfUse = benefitsOfUse2.forWork.question;

                      for (var item in benefitsOfUse2.forWorkList) {
                        if (item.value) {
                          benefitsOfUse += ', ${item.question}';
                        }
                      }
                    }

                    questionPart16.add(
                      QuestionPart16(
                        machineType: p162.tractorModel.question,
                        numberOfMachines: int.parse(p162.adOn2.tractorCount!.text),
                        lastYear: p162.adOn2.tractorYear?.text,
                        status:
                            p162.adOn2.tractorStatus.firstWhere((e) => e.value == true).question,
                        benefitsOfUse: benefitsOfUse,
                        weekUse: p162.adOn2.week!.text.isEmpty
                            ? null
                            : int.parse(p162.adOn2.week?.text ?? '0'),
                        monthUse: p162.adOn2.month!.text.isEmpty
                            ? null
                            : int.parse(p162.adOn2.month?.text ?? '0'),
                        yearUse: p162.adOn2.year!.text.isEmpty
                            ? null
                            : int.parse(p162.adOn2.year?.text ?? '0'),
                        tractorHorsepower: null,
                        plow1: null,
                        plow2: null,
                        plow3: null,
                        plow4: null,
                        plow5: null,
                        plowBomb: null,
                        rotary: null,
                        rowOfRice: int.parse(p162.adOn2.rowCount?.text ?? '0'),
                      ),
                    );
                  }

                  List<Section1PointAdOn3> adons = [];

                  if (state.selectedPointAdOn3 != null) {
                    adons.add(state.selectedPointAdOn3!);
                  }
                  if (state.selectedPointAdOn4 != null) {
                    adons.add(state.selectedPointAdOn4!);
                  }
                  if (state.selectedPointAdOn5 != null) {
                    adons.add(state.selectedPointAdOn5!);
                  }
                  if (state.selectedPointAdOn6 != null) {
                    adons.add(state.selectedPointAdOn6!);
                  }
                  if (state.selectedPointAdOn7 != null) {
                    adons.add(state.selectedPointAdOn7!);
                  }
                  if (state.selectedPointAdOn8 != null) {
                    adons.add(state.selectedPointAdOn8!);
                  }
                  if (state.selectedPointAdOn9 != null) {
                    adons.add(state.selectedPointAdOn9!);
                  }

                  for (var item in adons) {
                    String benefitsOfUse = '';

                    final benefitsOfUse1 = item.adOn3.forUse.inHome;
                    final benefitsOfUse2 = item.adOn3.forUse.forWorks;
                    if (benefitsOfUse1.value) {
                      benefitsOfUse = benefitsOfUse1.question;
                    }
                    if (benefitsOfUse2.forWork.value) {
                      benefitsOfUse = benefitsOfUse2.forWork.question;

                      for (var item in benefitsOfUse2.forWorkList) {
                        if (item.value) {
                          benefitsOfUse += ', ${item.question}';
                        }
                      }
                    }

                    questionPart16.add(
                      QuestionPart16(
                        machineType: item.question,
                        numberOfMachines: int.parse(item.adOn3.tractorCount!.text),
                        lastYear: item.adOn3.tractorYear?.text,
                        status:
                            item.adOn3.tractorStatus.firstWhere((e) => e.value == true).question,
                        benefitsOfUse: benefitsOfUse,
                        weekUse: int.parse(item.adOn3.week?.text ?? '0'),
                        monthUse: int.parse(item.adOn3.month?.text ?? '0'),
                        yearUse: int.parse(item.adOn3.year?.text ?? '0'),
                        tractorHorsepower: null,
                        plow1: null,
                        plow2: null,
                        plow3: null,
                        plow4: null,
                        plow5: null,
                        plowBomb: null,
                        rotary: null,
                        rowOfRice: null,
                      ),
                    );
                  }

                  for (var item in p14) {
                    questionPart14.add(
                      QuestionPart14(
                        lastYear: item.dty.text,
                        groupName: item.group.text,
                        role: item.role.text,
                        note: item.remark?.text ?? '',
                      ),
                    );
                  }

                  for (var item in p15) {
                    questionPart15.add(
                      QuestionPart15(
                        landName: item.landName,
                        numberOfAreas: item.landZCount,
                        address: item.landArea,
                        holding: item.landHolding,
                        utilization: item.landForUse,
                        soilType: item.landType,
                        areaCharactor: item.landTypeList!.name,
                        note: item.landRemark ?? '',
                      ),
                    );
                  }

                  print(p11.controller?.text);
                  print(Section2DataModel.datas.length);
                  if (Section2DataModel.datas.isNotEmpty) {
                    for (var item in Section2DataModel.datas) {
                      questionPart2.add(
                        QuestionPart2(
                          landNumber: item.riceFieldNumber,
                          landName: item.riceFieldName,
                          numberOfArear: double.parse(item.riceFieldArea.toString()),
                          questionPart211: item.s11,
                          questionPart212: item.s12,
                          questionPart213: item.s13,
                          questionPart214: item.s14,
                          questionPart215: item.s15,
                          questionPart221: item.s21,
                          questionPart222: item.s22,
                          questionPart223: item.s23,
                          questionPart224: item.s24,
                          questionPart225: item.s25,
                          questionPart226: item.s26,
                          questionPart2261: item.s261,
                          questionPart231: item.s31,
                          questionPart2311: item.s311,
                          questionPart232: item.s32,
                          questionPart241: item.s41,
                          questionPart2411: item.s411,
                          questionPart242: item.s42,
                          questionPart2421: item.s421,
                          questionPart243: item.s43,
                          questionPart244: item.s44,
                          questionPart24511: item.s4511,
                          questionPart24512: item.s4512,
                          questionPart24521: item.s4521,
                          questionPart24531: item.s4531,
                          questionPart24532: item.s4532,
                          questionPart24541: item.s4541,
                          questionPart245411: item.s45411,
                          questionPart24542: item.s4542,
                          questionPart245421: item.s45421,
                          questionPart251: item.s51,
                          questionPart252: item.s52A,
                          questionPart2521: item.s521A,
                          questionPart253: item.s53B,
                          questionPart254: item.s54C,
                          questionPart255: item.s55D,
                          questionPart2551: item.s551D,
                          questionPart256: item.s56E,
                          questionPart2561: item.s561E,
                          questionPart261: item.s61E,
                        ),
                      );
                    }
                  }

                  List<QuestionPart3> questionPart3 = [];

                  final p3 = Section3Model.data3;

                  if (p3.isNotEmpty) {
                    for (var item in p3) {
                      questionPart3.add(
                        QuestionPart3(
                          process: item.process,
                          typeMachine: item.typeMachine,
                          prossessor: item.prossessor,
                          prossessor1: item.prossessor1,
                          serviceFee: int.parse(item.serviceFee ?? '0'),
                          decisionReusons: item.dicisionReason ?? '',
                        ),
                      );
                    }
                  }






                  MapDataModel mapData = MapDataModel(
                    respondentName: state.staffData?.staffName,
                    respondentAdress: state.staffData?.staffAddress,
                    respondentTel: state.staffData?.staffPhone,
                    respondentSubdistrict: state.staffData?.staffTambon,
                    respondentDistrict: state.staffData?.staffAmphur,
                    respondentProvice: state.staffData?.staffProvince,
                    respondentZipcode: state.staffData?.staffZipcode,
                    interviewerId: 1,
                    dateStart: state.staffData?.interviewDate,
                    dateStop: DateTime.now(),
                    questionPart11: p11.controller?.text ?? '',
                    questionPart12: p12.question,
                    questionPart13: p13v,
                    questionPart14: questionPart14,
                    questionPart15: questionPart15,
                    questionPart16: questionPart16,
                    questionPart2: questionPart2,
                    questionPart3: questionPart3,
                    questionPart41: Section3Model.part4[0].text,
                    questionPart42: Section3Model.part4[1].text,
                    questionPart43: Section3Model.part4[2].text,
                    questionPart2321:
                        Section2DataModel.datas.map((element) => element.s321).toList()[0],
                    questionPart233:
                        Section2DataModel.datas.map((element) => element.s33).toList()[0],
                    questionPart24513:
                        Section2DataModel.datas.map((element) => element.s513).toList()[0]!,
                    questionPart24522:
                        Section2DataModel.datas.map((element) => element.s522).toList()[0]!,
                    questionPart245311:
                        Section2DataModel.datas.map((element) => element.s45311).toList()[0]!,
                  );

                  EasyLoading.show(status: 'กำลังบันทึกข้อมูล');

                  try {
                    await AgriInfoRepository().addQuestion(mapData.toJson()).whenComplete(() {
                      EasyLoading.dismiss();
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title:
                                const CustomText(text: 'สำเร็จ', color: Colors.black, fontSize: 24),
                            content:
                                const CustomText(text: 'บันทึกข้อมูลสำเร็จ', color: Colors.black),
                            actions: [
                              CupertinoDialogAction(
                                child: const CustomText(
                                  text: 'ตกลง',
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  state.selectedRiceField = null;
                                  state.staffData = null;
                                  _clearSection1();
                                  _clearSection2();
                                  state.statusPending[0] = false;
                                  state.statusPending[1] = false;
                                  state.isSection2Pending = false;
                                  state.isSection3Pending = false;
                                  Section2DataModel.datas.clear();
                                  Section3Model.data3.clear();
                                  Section3Model.part4 = [
                                    TextEditingController(),
                                    TextEditingController(),
                                    TextEditingController(),
                                  ];
                                  RiceFieldModel.riceFields.clear();
                                  setState(() {});
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        },
                      );
                    });
                  } catch (e) {
                    print(e);
                  }

                  print(mapData.toJson());
                },
                child: const CustomText(
                  text: 'ส่งข้อมูล',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40)
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoMenuWidget({
    required BuildContext context,
    required String imageLogo,
    String? title,
    required String subTitle,
    required String status,
    Color statusColor = Colors.red,
    void Function()? onPressed,
  }) {
    Color headTextColor = const Color(0xff194902);
    bool isTitle = title != null && title.isNotEmpty;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(imageLogo, width: 75, height: 75),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isTitle,
                      child: CustomText(
                        text: title ?? '',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: headTextColor,
                      ),
                    ),
                    CustomText(
                      text: subTitle,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          text: status,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _clearSection1() {
    Section1Point1.section1Point1 = Section1Point1(
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

    Section1Point1.section1Point2 = Section1Point1(
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

    Section1Point1.section1Point3 = Section1Point3(
      question: '3. ในครัวเรือนของท่านมีที่ดินทำกินรวมทั้งสิ้นจำนวน',
      controller: TextEditingController(),
      suffix: 'แปลง',
    );

    Section1Point1.section1Point4 = Section1Point4(
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

    Section1Point1.section1Point5 = Section1Point5(
      question: '5. ท่านมีที่ดินที่ใช้ปลูกข้าวของท่านหรือไม่',
      wasListModel: [],
    );

    Section1Point1.section1PointAdOn1 = Section1PointAdOn1(
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

    Section1Point1.section1PointAdOn2 = Section1PointAdOn2(
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

    Section1Point1.section1PointAdOn3 = Section1PointAdOn3(
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

    Section1Point1.section1PointAdOn4 = Section1PointAdOn3(
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

    Section1Point1.section1PointAdOn5 = Section1PointAdOn3(
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

    Section1Point1.section1PointAdOn6 = Section1PointAdOn3(
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

    Section1Point1.section1PointAdOn7 = Section1PointAdOn3(
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

    Section1Point1.section1PointAdOn8 = Section1PointAdOn3(
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

    Section1Point1.section1PointAdOn9 = Section1PointAdOn3(
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

  void _clearSection2() {
    Section2Model.s211 = S211(
      question: '2.1.1 ประเภทการปลูกข้าว',
      values: [
        Section2ValueTextModel(text: '1. นาอินทรีย', value: false),
        Section2ValueTextModel(text: '2. นาสารเคมี', value: false),
        Section2ValueTextModel(text: '3. อื่นๆ', value: false),
      ],
    );
    Section2Model.s212 = S212(
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
    Section2Model.s213 = S213(
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
    Section2Model.s214 = S214(
      question: '2.1.4 ลักษณะของพื้นที่แปลง',
      values: [
        Section2ValueTextModel(text: '1. ที่ลุ่ม', value: false),
        Section2ValueTextModel(text: '2. ที่ทาม', value: false),
        Section2ValueTextModel(text: '3. ที่ดอน, โคก', value: false),
        Section2ValueTextModel(text: '4. แอ่งกระทะ', value: false),
        Section2ValueTextModel(text: '5. ราบ ขั้นบันได', value: false),
      ],
    );
    Section2Model.s215 = S215(
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
    Section2Model.s221 = S221(
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
    Section2Model.s222 = S222(
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
    Section2Model.s223 = S223(
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
    Section2Model.s224 = S224(
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
    Section2Model.s225 = S225(
      question: '2.2.5 ผลผลิตของข้าวเมื่อปีการผลิตที่แล้ว',
      values: [
        Section2PVSModel(
          prefix: '',
          controller: TextEditingController(),
          suffix: 'กิโลกรัม/ไร่',
        ),
      ],
    );
    Section2Model.s226 = S226(
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
    Section2Model.s231 = S231(
      question: '2.3.1 ก่อนการปลูกข้าว ท่านได้มีการบำรุงดิน หรือไม่',
      yearController: TextEditingController(),
      detailController: TextEditingController(),
      values: [
        Section2ValueTextModel(text: 'ไม่บำรุงดิน', value: false),
        Section2ValueTextModel(
            text: 'มีการบำรุงดิน (ปุ๋ยพืชสด,ปุ๋ยคอก,พืชตระกูลถั่ว(ถั่วพร้า),ปอเทือง)',
            value: false),
      ],
    );
    Section2Model.s232 = S232(
      question: '2.3.2 ท่านเริ่มทำการปลูกข้าวช่วง',
      startMonthController: TextEditingController(),
      monthController: TextEditingController(),
    );
    Section2Model.s23SoilPreparationSteps = S23SoilPreparationSteps(
      values: [],
    );
    Section2Model.hS23owToPlantInTheLastProductionYears = HS23owToPlantInTheLastProductionYears(
      values: [],
    );
    Section2Model.s241 = S241(
      question: '2.4.1 ในแปลงของท่านพบว่า มีวัชพืช หรือไม่',
      weedController: TextEditingController(),
      percentController: TextEditingController(),
      controlWeedController: TextEditingController(),
      values: [
        Section2ValueTextModel(text: 'ไม่พบวัชพืชในแปลง', value: false),
        Section2ValueTextModel(text: 'พบวัชพืชในแปลง', value: false),
      ],
    );
    Section2Model.s242 = S242(
      question: '2.4.2 ในแปลงท่านพบพันธุ์ข้าวปนหรือไม่่',
      weedController: TextEditingController(),
      percentController: TextEditingController(),
      values: [
        Section2ValueTextModel(text: 'ไม่พบพันธุ์ข้าวปนในแปลง', value: false),
        Section2ValueTextModel(
            text: 'พบพันธุ์ข้าวปนในแปลง (ข้าวหาง,ข้าวดีด,ข้าวแดง ฯลฯ)', value: false),
      ],
    );
    Section2Model.s243 = S243(
      question: '2.4.3 ท่านได้กำจัดพันธุ์ปนในแปลงท่านพบพันธุ์ข้าวหรือไม่',
      controller: TextEditingController(),
      values: [
        Section2ValueTextModel(text: 'ไม่กำจัดพันธุ์ข้าวปนในแปลง', value: false),
        Section2ValueTextModel(
            text: 'กำจัดพันธุ์ข้าวปนในแปลง ด้วยวิธี (อธิบายขั้นตอนการกำจัด) ', value: false),
      ],
    );
    Section2Model.s244 = S244(
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
    Section2Model.s245 = S245(
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
    Section2Model.caseOfGivingWaters = CaseOfGivingWaters(
      question: 'กรณีให้น้ำ',
      values: [],
    );
    Section2Model.caseOfApplyingFertilizers = CaseOfApplyingFertilizers(
      question: 'กรณีใส่ปุ๋ย',
      values: [],
    );
    Section2Model.caseKillWeeds = CaseKillWeeds(
      question: 'กรณีกำจัดวัชพืช',
      values: [],
    );
    Section2Model.s254532 = S254532(
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
          values: [
            /*
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
        */
          ],
        ),
      ],
    );
    Section2Model.s224541 = S224541(
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
    Section2Model.s224542 = S224542(
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
    Section2Model.s251 = S251(
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
    Section2Model.s252 = S252(
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
    Section2Model.s253 = S253(
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
    Section2Model.s254 = S254(
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
    Section2Model.s255 = S255(
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
    Section2Model.s256 = S256(
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
    Section2Model.s260 = S260(
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
}
