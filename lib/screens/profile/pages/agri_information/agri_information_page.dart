import 'dart:convert';

import 'package:agri/screens/profile/pages/agri_information/models/section_2_data_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/staff_info_data_model.dart';
import 'package:agri/screens/profile/pages/agri_information/repositories/agri_info_repository.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/themes.dart';
import '../../../../widgets/back_button_widget.dart';
import '../../../../widgets/custom_text.dart';
import 'bloc/agri_info_bloc.dart';
import 'info_image.dart';
import 'models/local_ifo_model.dart';
import 'models/map_data_model.dart';
import 'models/section_1_model.dart';
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
    context.read<AgriInfoBloc>().add(InitialEvent());
    //
  }

  Future<StaffInfoDataModel?> _checkStaff() async {
    final userId = await LocalStorage.getToken();
    List<LocalInfoModel> localInfoList = await getLocalInfoList() ?? [];
    bool isLocalInfo = localInfoList.where((element) => element.userId == userId).isNotEmpty;
    if (isLocalInfo) {
      LocalInfoModel localInfo = localInfoList.firstWhere((element) => element.userId == userId);
      return localInfo.interviewers;
    } else {
      return null;
    }
  }

  Future<void> addOrUpdateLocalInfo(String userId, LocalInfoModel newModel) async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the existing list of JSON strings
    List<String>? jsonList = prefs.getStringList('localInfoList');
    List<LocalInfoModel> models = [];

    // If the list exists, decode it
    if (jsonList != null) {
      models =
          jsonList.map((jsonString) => LocalInfoModel.fromJson(jsonDecode(jsonString))).toList();
    }

    // Find the index of the model with the same userId
    int index = models.indexWhere((model) => model.userId == userId);

    if (index != -1) {
      // Update the existing model
      models[index] = newModel;
    } else {
      // Add the new model
      models.add(newModel);
    }

    // Convert the updated list of models back into JSON strings
    List<String> updatedJsonList = models.map((model) => jsonEncode(model.toJson())).toList();

    // Save the updated list back to SharedPreferences
    await prefs.setStringList('localInfoList', updatedJsonList);

    print('addOrUpdateLocalInfo');
  }

  Future<List<LocalInfoModel>?> getLocalInfoList() async {
    print('getLocalInfoList');

    final prefs = await SharedPreferences.getInstance();

    // Retrieve the list of JSON strings
    List<String>? jsonList = prefs.getStringList('localInfoList');
    if (jsonList == null) return null;

    // Convert each JSON string back into a LocalInfoModel object
    return jsonList.map((jsonString) => LocalInfoModel.fromJson(jsonDecode(jsonString))).toList();
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
                onPressed: () async {
                  print('state.staffData: ${state.interviewers.length}');
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

                  try {
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
                        benefitsOfUse += benefitsOfUse2.forWork.question;
                      }
                      for (var item in benefitsOfUse2.forWorkList) {
                        if (item.value) {
                          benefitsOfUse += ', ${item.question}';
                        }
                      }

                      print('benefitsOfUse : $benefitsOfUse');

                      String fou1 = '';
                      String fou2 = '';
                      String fou3 = '';
                      String fou = '';

                      final fouList = p161.mainSequenceToUseModel;
                      if (fouList[0].value == true) {
                        fou1 = "${fouList[0].text} : ";
                        final items = fouList[0].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou1 += '\n${item.text} ${item.controller.text} ${item.suffix}';
                          }
                        }
                      }
                      if (fouList[1].value == true) {
                        fou2 = "${fouList[1].text} : ";
                        final items = fouList[1].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou2 += '\n${item.text} ${item.controller.text} ${item.suffix}';
                          }
                        }
                      }
                      if (fouList[2].value == true) {
                        final items = fouList[2].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou3 = item.text;
                          }
                        }
                      }

                      fou = '$fou1 $fou2 $fou3';

                      // ผ่านไถ
                      String plows = '';
                      for (var item in forUse3) {
                        if (item.value) {
                          plows += '${item.text}\n';
                        }
                      }

                      questionPart16.add(
                        QuestionPart16(
                          machineType: p161.tractorModel.question,
                          numberOfMachines: p161.adOn1.tractorCount!.text.isEmpty
                              ? 0
                              : int.parse(p161.adOn1.tractorCount?.text ?? '0'),
                          lastYear: p161.adOn1.tractorYear?.text,
                          status: p161.adOn1.tractorStatus.where((e) => e.value == true).isNotEmpty
                              ? p161.adOn1.tractorStatus
                                  .where((e) => e.value == true)
                                  .first
                                  .question
                              : '',
                          benefitsOfUse: benefitsOfUse,
                          tractorHorsepower: p161.adOn1.tractorHourse!.text.isEmpty
                              ? null
                              : int.parse(p161.adOn1.tractorHourse?.text ?? '0'),
                          frequencyOfUse: fou,
                          plows: plows,
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
                        benefitsOfUse += benefitsOfUse2.forWork.question;
                      }
                      for (var item in benefitsOfUse2.forWorkList) {
                        if (item.value) {
                          benefitsOfUse += ', ${item.question}';
                        }
                      }

                      String fou1 = '';
                      String fou2 = '';
                      String fou3 = '';
                      String fou = '';

                      final fouList = p162.mainSequenceToUseModel;
                      if (fouList[0].value == true) {
                        fou1 = "${fouList[0].text} : ";
                        final items = fouList[0].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou1 += '\n${item.text} ${item.controller.text} ${item.suffix}';
                          }
                        }
                      }
                      if (fouList[1].value == true) {
                        fou2 = '${fouList[1].text} : ';
                        final items = fouList[1].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou2 += '\n${item.text} ${item.controller.text} ${item.suffix}';
                          }
                        }
                      }
                      if (fouList[2].value == true) {
                        final items = fouList[2].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou3 = item.text;
                          }
                        }
                      }

                      fou = '$fou1 $fou2 $fou3';

                      questionPart16.add(
                        QuestionPart16(
                          machineType: p162.tractorModel.question,
                          numberOfMachines: p162.adOn2.tractorCount!.text.isEmpty
                              ? 0
                              : int.parse(p162.adOn2.tractorCount?.text ?? '0'),
                          lastYear: p162.adOn2.tractorYear?.text,
                          status: p162.adOn2.tractorStatus.where((e) => e.value == true).isNotEmpty
                              ? p162.adOn2.tractorStatus
                                  .where((e) => e.value == true)
                                  .first
                                  .question
                              : '',
                          benefitsOfUse: benefitsOfUse,
                          frequencyOfUse: fou,
                          tractorHorsepower: null,
                          plows: null,
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
                        benefitsOfUse += benefitsOfUse2.forWork.question;
                      }
                      for (var item in benefitsOfUse2.forWorkList) {
                        if (item.value) {
                          benefitsOfUse += ', ${item.question}';
                        }
                      }

                      String fou1 = '';
                      String fou2 = '';
                      String fou3 = '';
                      String fou = '';

                      final fouList = item.mainSequenceToUseModel;
                      if (fouList[0].value == true) {
                        final items = fouList[0].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou1 += '\n${item.text} ${item.controller.text} ${item.suffix}';
                          }
                        }
                      }
                      if (fouList[1].value == true) {
                        final items = fouList[1].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou2 += '\n${item.text} ${item.controller.text} ${item.suffix}';
                          }
                        }
                      }
                      if (fouList[2].value == true) {
                        final items = fouList[2].subs;
                        for (var item in items) {
                          if (item.value == true) {
                            fou3 = item.text;
                          }
                        }
                      }

                      fou = '$fou1 $fou2 $fou3';

                      print('benefitsOfUse : $benefitsOfUse');

                      questionPart16.add(
                        QuestionPart16(
                          machineType: item.question,
                          numberOfMachines: item.adOn3.tractorCount!.text.isEmpty
                              ? 0
                              : int.parse(item.adOn3.tractorCount?.text ?? '0'),
                          lastYear: item.adOn3.tractorYear?.text,
                          status: item.adOn3.tractorStatus.where((e) => e.value == true).isNotEmpty
                              ? item.adOn3.tractorStatus
                                  .where((e) => e.value == true)
                                  .first
                                  .question
                              : '',
                          benefitsOfUse: benefitsOfUse,
                          frequencyOfUse: '',
                          tractorHorsepower: null,
                          plows: null,
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
                          holding: item.landHolding.map((e) => e.text).toList().join(', '),
                          utilization: item.landForUse,
                          soilType: item.landType.map((e) => e.text).toList().join(', '),
                          areaCharactor: item.landTypeList!.name,
                          note: item.landRemark ?? '',
                        ),
                      );
                    }

                    /* print('\n ส่วนที่ 1');
                    print(p11.toJson());
                    print('\n ส่วนที่ 1_5');
                    print(questionPart15.map((e) => e.toJson()).toList());
                    print('\n ส่วนที่ 1 เพิ่มเติม');
                    print(questionPart16.map((e) => e.toJson()).toList());*/

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
                            questionPart221: item.s21,
                            questionPart222: item.s22,
                            questionPart223: item.s23,
                            questionPart224: item.s24,
                            questionPart225: item.s261,
                            questionPart231: item.s31,
                            questionPart232: item.s32,
                            questionPart233: item.s33,
                            questionPart241: item.s41,
                            questionPart242: item.s42,
                            questionPart243: item.s43,
                            questionPart244: item.s44,
                            questionPart245: item.s45, // new
                            questionPart24611: item.s4511,
                            questionPart24621: item.s4521,
                            questionPart24631: item.s4531,
                            questionPart251: item.s51,
                            questionPart252: item.s52A,
                            questionPart24641: item.s4541,
                            questionPart253: item.s53B,
                            questionPart254: item.s54C,
                            questionPart255: item.s55D,
                            questionPart2551: item.s551D,
                            questionPart256: item.s56E,
                            questionPart261: item.s61E,
                            questionPart2561: item.s561E,

                            //questionPart2411: item.s411,
                          ),
                        );
                      }
                    }

                    print('\n ส่วนที่ 2');
                    //print(questionPart2.map((e) => jsonEncode(e.toJson())).toList());

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

                    final s513 =
                        Section2DataModel.datas.map((element) => element.s513).toList()[0] ?? [];
                    final s522 =
                        Section2DataModel.datas.map((element) => element.s522).toList()[0] ?? [];
                    final s311 =
                        Section2DataModel.datas.map((element) => element.s45311).toList()[0] ?? [];

                    MapDataModel mapData = MapDataModel(
                      respondentName: state.staffData?.staffName,
                      respondentAdress: state.staffData?.staffAddress,
                      respondentTel: state.staffData?.staffPhone,
                      respondentSubdistrict: state.staffData?.staffTambon,
                      respondentDistrict: state.staffData?.staffAmphur,
                      respondentProvice: state.staffData?.staffProvince,
                      respondentZipcode: state.staffData?.staffZipcode,
                      interviewerId: state.staffData?.selectedStaff?.interviewerId,
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
                      questionPart234:
                          Section2DataModel.datas.map((element) => element.s331).toList()[0],
                      questionPart24513: s513,
                      questionPart24522: s522,
                      questionPart245311: s311,
                    );

                    EasyLoading.show(status: 'กำลังบันทึกข้อมูล');
                    await AgriInfoRepository().addQuestionNew(mapData.toJson()).whenComplete(() {
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
                                onPressed: () async {
                                  final userId = await LocalStorage.getToken();

                                  print('userId: ${state.staffData?.toJson()}');

                                  try {
                                    final data = LocalInfoModel(
                                      userId: userId.toString(),
                                      interviewers: state.staffData!,
                                      selectedPoint1:
                                          state.selectedPoint1 ?? Section1Point1.section1Point1,
                                      selectedPoint2:
                                          state.selectedPoint2 ?? Section1Point1.section1Point2,
                                      selectedPoint3:
                                          state.selectedPoint3 ?? Section1Point1.section1Point3,
                                      selectedPoint4:
                                          state.selectedPoint4 ?? Section1Point1.section1Point4,
                                      selectedPoint5:
                                          state.selectedPoint5 ?? Section1Point1.section1Point5,
                                      selectedPointAdOn1: state.selectedPointAdOn1 ??
                                          Section1Point1.section1PointAdOn1,
                                      selectedPointAdOn2: state.selectedPointAdOn2 ??
                                          Section1Point1.section1PointAdOn2,
                                      selectedPointAdOn3: state.selectedPointAdOn3 ??
                                          Section1Point1.section1PointAdOn3,
                                      selectedPointAdOn4: state.selectedPointAdOn4 ??
                                          Section1Point1.section1PointAdOn4,
                                      selectedPointAdOn5: state.selectedPointAdOn5 ??
                                          Section1Point1.section1PointAdOn5,
                                      selectedPointAdOn6: state.selectedPointAdOn6 ??
                                          Section1Point1.section1PointAdOn6,
                                      selectedPointAdOn7: state.selectedPointAdOn7 ??
                                          Section1Point1.section1PointAdOn7,
                                      selectedPointAdOn8: state.selectedPointAdOn8 ??
                                          Section1Point1.section1PointAdOn8,
                                      selectedPointAdOn9: state.selectedPointAdOn9 ??
                                          Section1Point1.section1PointAdOn9,
                                      selectedPoint2Map: Section2DataModel.datas,
                                      data3: Section3Model.data3,
                                      data3StringList:
                                          Section3Model.part4.map((e) => e.text).toList(),
                                    );

                                    await addOrUpdateLocalInfo(userId.toString(), data);
                                  } catch (e, t) {
                                    print(e);
                                    print(t);
                                  }
                                  setState(() {});
                                  Navigator.pop(context);
                                  //Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        },
                      );
                    });
                  } catch (e, t) {
                    print(e);
                    print(t);
                  }

                  //print(jsonEncode(mapData.toJson()));
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
}
