import 'package:agri/screens/profile/pages/agri_information/info_image.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../widgets/custom_text.dart';
import '../bloc/agri_info_bloc.dart';
import '../models/rice_field_model.dart';
import '../models/section_1_data_model.dart';
import '../models/section_1_model.dart';

class Section1Page extends StatefulWidget {
  const Section1Page({super.key});

  @override
  State<Section1Page> createState() => _Section1PageState();
}

class _Section1PageState extends State<Section1Page> {
  final _formKeyA1 = GlobalKey<FormState>();
  final _formKeyA2 = GlobalKey<FormState>();
  final _formKeyA3 = GlobalKey<FormState>();
  final _formKeyA4 = GlobalKey<FormState>();
  final _formKeyA5 = GlobalKey<FormState>();
  final _formKeyA6 = GlobalKey<FormState>();
  final _formKeyA7 = GlobalKey<FormState>();
  final _formKeyA8 = GlobalKey<FormState>();
  final _formKeyA9 = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButtonWidget(),
        ),
        body: BlocBuilder<AgriInfoBloc, AgriInfoState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image.asset(InfoImages.section1, width: 200, height: 200),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: 'ส่วนที่ 1',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff194902),
                    ),
                    const CustomText(
                      text: 'ข้อมูลเกี่ยวกับทรัพยากรครัวเรือน',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    _buildPoint1Widget(state),
                    _buildPoint2Widget(state),
                    _buildPoint3Widget(state),
                    _buildPoint4Widget(context, state),
                    _buildPoint5Widget(context, state),
                    _buildPointAdOn1Widget(context, state),
                    const SizedBox(height: 16),
                    CupertinoButton(
                      color: const Color(0xff194902),
                      onPressed: () {
                        if (state.selectedPoint1 == null) {
                          print('selectedPoint1 is null');
                          Fluttertoast.showToast(
                            msg: 'กรุณาเลือกข้อมูลในข้อ 1',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (state.selectedPoint2 == null) {
                          print('selectedPoint2 is null');
                          Fluttertoast.showToast(
                            msg: 'กรุณาเลือกข้อมูลในข้อ 2',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (state.selectedPoint3 == null) {
                          print('selectedPoint3 is null');
                          Fluttertoast.showToast(
                            msg: 'กรุณาเลือกข้อมูลในข้อ 3',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (state.selectedPoint4 == null) {
                          print('selectedPoint4 is null');
                          Fluttertoast.showToast(
                            msg: 'กรุณาเลือกข้อมูลในข้อ 4',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (state.selectedPoint4 != null &&
                            state.selectedPoint4!.wasList[0].value &&
                            state.selectedPoint4!.wasListModel.isEmpty) {
                          print('selectedPoint4 is null');
                          Fluttertoast.showToast(
                            msg: 'กรุณาเพิ่มข้อมูลในข้อ 4',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (state.selectedPoint5!.wasListModel.isEmpty) {
                          print('selectedPoint5 is null');
                          Fluttertoast.showToast(
                            msg: 'กรุณาเพิ่มข้อมูลในข้อ 5',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (kDebugMode) {
                          print('point1: ${state.selectedPoint1?.toJson()}');
                          print('point2: ${state.selectedPoint2?.toJson()}');
                          print('point3: ${state.selectedPoint3?.toJson()}');
                          print('point4: ${state.selectedPoint4?.toJson()}');
                          print('point5: ${state.selectedPoint5?.toJson()}');
                        }
                        final Section1PointAdOn1 adOn1 = Section1Point1.section1PointAdOn1;
                        if (adOn1.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn1.adOn1.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn1.adOn1.forUse.inHome.value;
                          bool tractorType2 = adOn1.adOn1.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn1.adOn1.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA1.currentState!.validate()) {
                            state.selectedPointAdOn1 = adOn1;
                          } else {
                            state.selectedPointAdOn1 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn1 = null;
                        }
                        if (kDebugMode) {
                          print('adOn1: ${state.selectedPointAdOn1?.toJson()}');
                        }

                        /// adOn2
                        final Section1PointAdOn2 adOn2 = Section1Point1.section1PointAdOn2;
                        if (adOn2.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn2.adOn2.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn2.adOn2.forUse.inHome.value;
                          bool tractorType2 = adOn2.adOn2.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn2.adOn2.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA2.currentState!.validate()) {
                            state.selectedPointAdOn2 = adOn2;
                          } else {
                            state.selectedPointAdOn2 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn2 = null;
                        }
                        if (kDebugMode) {
                          print('adOn2: ${state.selectedPointAdOn2?.toJson()}');
                        }

                        final Section1PointAdOn3 adOn3 = Section1Point1.section1PointAdOn3;
                        if (adOn3.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn3.adOn3.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn3.adOn3.forUse.inHome.value;
                          bool tractorType2 = adOn3.adOn3.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn3.adOn3.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA3.currentState!.validate()) {
                            state.selectedPointAdOn3 = adOn3;
                          } else {
                            state.selectedPointAdOn3 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn3 = null;
                        }
                        if (kDebugMode) {
                          print('adOn3: ${state.selectedPointAdOn3?.toJson()}');
                        }

                        final Section1PointAdOn3 adOn4 = Section1Point1.section1PointAdOn4;
                        if (adOn4.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn4.adOn3.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn4.adOn3.forUse.inHome.value;
                          bool tractorType2 = adOn4.adOn3.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn4.adOn3.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA4.currentState!.validate()) {
                            state.selectedPointAdOn4 = adOn4;
                          } else {
                            state.selectedPointAdOn4 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn4 = null;
                        }
                        if (kDebugMode) {
                          print('\nadOn4: ${state.selectedPointAdOn4?.toJson()}');
                        }

                        final Section1PointAdOn3 adOn5 = Section1Point1.section1PointAdOn5;
                        if (adOn5.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn5.adOn3.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn5.adOn3.forUse.inHome.value;
                          bool tractorType2 = adOn5.adOn3.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn5.adOn3.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA5.currentState!.validate()) {
                            state.selectedPointAdOn5 = adOn5;
                          } else {
                            state.selectedPointAdOn5 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn5 = null;
                        }
                        if (kDebugMode) {
                          print('\nadOn5: ${state.selectedPointAdOn5?.toJson()}');
                        }

                        final Section1PointAdOn3 adOn6 = Section1Point1.section1PointAdOn6;
                        if (adOn6.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn6.adOn3.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn6.adOn3.forUse.inHome.value;
                          bool tractorType2 = adOn6.adOn3.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn6.adOn3.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA6.currentState!.validate()) {
                            state.selectedPointAdOn6 = adOn6;
                          } else {
                            state.selectedPointAdOn6 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn6 = null;
                        }

                        if (kDebugMode) {
                          print('\nadOn6: ${state.selectedPointAdOn6?.toJson()}');
                        }

                        final Section1PointAdOn3 adOn7 = Section1Point1.section1PointAdOn7;
                        if (adOn7.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn7.adOn3.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn7.adOn3.forUse.inHome.value;
                          bool tractorType2 = adOn7.adOn3.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn7.adOn3.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA7.currentState!.validate()) {
                            state.selectedPointAdOn7 = adOn7;
                          } else {
                            state.selectedPointAdOn7 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn7 = null;
                        }
                        if (kDebugMode) {
                          print('\nadOn7: ${state.selectedPointAdOn7?.toJson()}');
                        }

                        final Section1PointAdOn3 adOn8 = Section1Point1.section1PointAdOn8;
                        if (adOn8.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn8.adOn3.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn8.adOn3.forUse.inHome.value;
                          bool tractorType2 = adOn8.adOn3.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn8.adOn3.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA8.currentState!.validate()) {
                            state.selectedPointAdOn8 = adOn8;
                          } else {
                            state.selectedPointAdOn8 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn8 = null;
                        }
                        if (kDebugMode) {
                          print('\nadOn8: ${state.selectedPointAdOn8?.toJson()}');
                        }

                        final Section1PointAdOn3 adOn9 = Section1Point1.section1PointAdOn9;
                        if (adOn9.tractorModel.value) {
                          String msg = 'กรุณาเลือกการใช้ประโยชน์';
                          bool tractorStatus =
                              adOn9.adOn3.tractorStatus.map((e) => e.value).contains(true);
                          bool tractorType = adOn9.adOn3.forUse.inHome.value;
                          bool tractorType2 = adOn9.adOn3.forUse.forWorks.forWork.value;
                          bool tractorType3 = adOn9.adOn3.forUse.forWorks.forWorkList
                              .map((e) => e.value)
                              .contains(true);

                          if (!tractorStatus) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกสถานะเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (!tractorType && !tractorType2 && !tractorType3) {
                            Fluttertoast.showToast(
                              msg: msg,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_formKeyA9.currentState!.validate()) {
                            state.selectedPointAdOn9 = adOn9;
                          } else {
                            state.selectedPointAdOn9 = null;
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                        } else {
                          state.selectedPointAdOn9 = null;
                        }
                        if (kDebugMode) {
                          print('\nadOn9: ${state.selectedPointAdOn9?.toJson()}');
                        }

                        context.read<AgriInfoBloc>().add(AddSection1DataEvent(
                                section1: Section1DataModel(
                              selectedPoint1: state.selectedPoint1,
                              selectedPoint2: state.selectedPoint2,
                              selectedPoint3: state.selectedPoint3,
                              selectedPoint4: state.selectedPoint4,
                              selectedPoint5: state.selectedPoint5,
                              selectedPointAdOn1: state.selectedPointAdOn1,
                              selectedPointAdOn2: state.selectedPointAdOn2,
                              selectedPointAdOn3: state.selectedPointAdOn3,
                              selectedPointAdOn4: state.selectedPointAdOn4,
                              selectedPointAdOn5: state.selectedPointAdOn5,
                              selectedPointAdOn6: state.selectedPointAdOn6,
                              selectedPointAdOn7: state.selectedPointAdOn7,
                              selectedPointAdOn8: state.selectedPointAdOn8,
                              selectedPointAdOn9: state.selectedPointAdOn9,
                            )));
                        Navigator.pop(context);

/*
                        if (_formKey.currentState!.validate()) {
                          // ignore: avoid_print
                          print('validate');
                        }

                        if (state.selectedPoint4!.wasList[0].value) {
                          print('selectedPoint4');
                        }*/
                      },
                      child: const CustomText(
                        text: 'บันทึกข้อมูล',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPoint1Widget(AgriInfoState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: Section1Point1.section1Point1.question,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: Section1Point1.section1Point1.model.map(
                      (e) {
                        final index = Section1Point1.section1Point1.model.indexOf(e);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              Section1Point1.section1Point1.model[index].value = !e.value;
                              //state.selectedPoint1 = Section1Point1.section1Point1;
                              if (Section1Point1.section1Point1.model[index].value) {
                                Section1Point1.section1Point1.model.forEach((element) {
                                  if (element != e) {
                                    element.value = false;
                                    element.controller?.clear();
                                  }
                                });
                              } else {
                                state.selectedPoint1 = null;
                                Section1Point1.section1Point1.model.forEach((element) {
                                  element.value = false;
                                  element.controller?.clear();
                                });
                              }
                              _formKey.currentState?.validate();
                            });
                          },
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    value: e.value,
                                    onChanged: (value) {
                                      setState(() {
                                        Section1Point1.section1Point1.model[index].value = !e.value;
                                        //state.selectedPoint1 = Section1Point1.section1Point1;
                                        if (Section1Point1.section1Point1.model[index].value) {
                                          Section1Point1.section1Point1.model.forEach((element) {
                                            if (element != e) {
                                              element.value = false;
                                              element.controller?.clear();
                                            }
                                          });
                                        } else {
                                          state.selectedPoint1 = null;
                                          Section1Point1.section1Point1.model.forEach((element) {
                                            element.value = false;
                                            element.controller?.clear();
                                          });
                                        }
                                        _formKey.currentState?.validate();
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: e.question,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                              _buildTextFieldWidget(
                                controller: e.controller,
                                keyboardType: TextInputType.text,
                                enabled: e.value,
                                validator: (value) {
                                  if (e.value && value!.isEmpty) {
                                    return 'กรุณาระบุ';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  e.controller?.text = value!;
                                  if (e.value) {
                                    state.selectedPoint1 = Section1Point1.section1Point1;
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoint2Widget(AgriInfoState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: Section1Point1.section1Point2.question,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Row(
                  children: Section1Point1.section1Point2.model.map(
                    (e) {
                      final index = Section1Point1.section1Point2.model.indexOf(e);
                      final point2 = Section1Point1.section1Point2.model[index];
                      return Expanded(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  value: e.value,
                                  onChanged: (value) {
                                    setState(() {
                                      Section1Point1.section1Point2.model.forEach((element) {
                                        element.value = false;
                                        element.controller?.clear();
                                      });
                                      point2.value = value!;
                                      //point2.value = value!;
                                      state.selectedPoint2 = Section1Point1.section1Point2;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: CustomText(
                                    text: e.question,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            /*Container(
                                          margin: const EdgeInsets.only(left: 30),
                                          child: CupertinoTextField(
                                            controller: e.controller,
                                            enabled: e.value,
                                          ),
                                        ),*/
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final FocusNode _focusNode3 = FocusNode();

  Widget _buildPoint3Widget(AgriInfoState state) {
    final point3 = Section1Point1.section1Point3;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
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
      child: Form(
        key: _formKey2,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: point3.question,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              focusNode: _focusNode3,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: point3.controller,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาระบุ';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                point3.controller.text = value;
                                if (value.isNotEmpty) {
                                  state.selectedPoint3 = point3;
                                } else {
                                  state.selectedPoint3 = null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'ระบุ',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                              )),
                        ),
                        Expanded(
                            child:
                                CustomText(text: point3.suffix, fontSize: 16, color: Colors.black))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoint4Widget(BuildContext context, AgriInfoState state) {
    final point4 = Section1Point1.section1Point4;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: point4.question,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Row(
                  children: point4.wasList.map(
                    (e) {
                      final index = point4.wasList.indexOf(e);
                      final point = point4.wasList[index];
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              point.value = !e.value;
                              state.selectedPoint4 = point4;
                              if (point.value) {
                                point4.wasList.forEach((element) {
                                  if (element != e) {
                                    element.value = false;
                                  }
                                });
                              } else {
                                state.selectedPoint4 = null;
                                point4.wasList.forEach((element) {
                                  element.value = false;
                                });
                              }
                            });
                          },
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    value: e.value,
                                    onChanged: (value) {
                                      setState(() {
                                        point.value = !e.value;
                                        state.selectedPoint4 = point4;
                                        if (point.value) {
                                          point4.wasList.forEach((element) {
                                            if (element != e) {
                                              element.value = false;
                                            }
                                          });
                                        } else {
                                          state.selectedPoint4 = null;
                                          point4.wasList.forEach((element) {
                                            element.value = false;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: e.text,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Visibility(
                  visible: point4.wasList[0].value,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: const Color(0xff194902),
                    child: const CustomText(
                      text: 'เพิ่ม',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _dty.clear();
                        _group.clear();
                        _role.clear();
                        _remark.clear();
                      });
                      _focusNode3.unfocus();

                      _addWasList(
                        context: context,
                        point4: point4,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: point4.wasList[0].value,
                  child: point4.wasListModel.isNotEmpty
                      ? SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columnSpacing: 10,
                              horizontalMargin: 10,
                              headingTextStyle: const TextStyle(fontSize: 16, color: Colors.black),

                              // border: TableBorder.all(width: 1.0, color: Colors.grey.shade200),
                              //border: TableBorder.all(width: 1.0, color: Colors.grey),
                              dataTextStyle: const TextStyle(fontSize: 14, color: Colors.black),
                              headingRowColor: MaterialStateProperty.all(const Color(0xff9ABC95)),

                              columns: const [
                                DataColumn(
                                  // size: ColumnSize.S,
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text('ลำดับ'),
                                ),
                                DataColumn(
                                  label: Text('ช่วงปี (พ.ศ.)'),
                                ),
                                DataColumn(
                                  label: Text('กลุ่ม/วิสาหกิจชุมชน'),
                                ),
                                DataColumn(
                                  label: Text('บทบาท'),
                                ),
                                DataColumn(
                                  label: Text('หมายเหตุ'),
                                ),
                              ],
                              rows: List.generate(
                                point4.wasListModel.length,
                                (index) {
                                  final was = point4.wasListModel[index];
                                  return DataRow(cells: [
                                    DataCell(
                                      GestureDetector(
                                        onTap: () {
                                          point4.wasListModel.removeAt(index);
                                          setState(() {});
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: Color(0xffFC5E5E),
                                          radius: 10,
                                          child: Icon(
                                            Icons.close,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      CustomText(
                                        text: '${index + 1}',
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    DataCell(
                                      CustomText(
                                          text: was.dty.text, fontSize: 16, color: Colors.black),
                                    ),
                                    DataCell(
                                      CustomText(
                                        text: was.group.text,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    DataCell(
                                      CustomText(
                                        text: was.role.text,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    DataCell(CustomText(
                                        text: was.remark?.text ?? '',
                                        fontSize: 16,
                                        color: Colors.black)),
                                  ]);
                                },
                              ),
                            ),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(
                              text: '---------กรุณาเพิ่มกลุ่มหรือวิสาหกิจชุมชน----------'),
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  final TextEditingController _dty = TextEditingController();
  final TextEditingController _group = TextEditingController();
  final TextEditingController _role = TextEditingController();
  final TextEditingController _remark = TextEditingController();

  final _formKey3 = GlobalKey<FormState>();

  void _addWasList({
    required BuildContext context,
    required Section1Point4 point4,
  }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (context) {
          return Container(
            // height: 600,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(
                            text: 'เข้าร่วมกลุ่มและวิสาหกิจชุมชน',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff194902),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: 'ช่วงปี (พ.ศ.)',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _dty,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'กรุณาระบุ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'ระบุ',
                          contentPadding: const EdgeInsets.all(8),
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        )),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: ' กลุ่ม/วิสาหกิจชุมชน',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _group,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'กรุณาระบุ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'ระบุ',
                          contentPadding: const EdgeInsets.all(8),
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        )),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: 'บทบาท',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _role,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'กรุณาระบุ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'ระบุ',
                          contentPadding: const EdgeInsets.all(8),
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        )),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: 'หมายเหตุ',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _remark,
                        decoration: InputDecoration(
                          hintText: 'ไม่บังคับ',
                          contentPadding: const EdgeInsets.all(8),
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ThemeConfig.primary,
                              width: 1,
                            ),
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        )),
                    //const SizedBox(height: 29),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CupertinoButton(
                            color: const Color(0xff194902),
                            child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                            onPressed: () {
                              if (_formKey3.currentState!.validate()) {
                                point4.wasListModel.add(
                                  Section1Point4WasListModel(
                                    dty: _dty,
                                    group: _group,
                                    role: _role,
                                    remark: _remark.text.isEmpty
                                        ? TextEditingController(text: '-')
                                        : _remark,
                                  ),
                                );
                                setState(() {});

                                Navigator.pop(context);
                              }
                            },
                          ),
                          CupertinoButton(
                            color: Colors.grey,
                            child: const CustomText(text: 'ยกเลิก', color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    //  const SizedBox(height: 29),
                    // const SizedBox(height: 29),
                  ],
                ),
              ),
            ),
          );
        }).whenComplete(() => _focusNode3.unfocus());
  }

  Widget _buildPoint5Widget(BuildContext context, AgriInfoState state) {
    final point5 = Section1Point1.section1Point5;
    print('point5: ${point5.wasListModel.length}');
    print('point5: ${point5.wasListModel.map((e) => e.toJson()).toList()}');
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: point5.question,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: const Color(0xff194902),
                  child: const CustomText(
                    text: 'เพิ่ม',
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _landName.clear();
                      _landZCount.clear();
                      _landArea.clear();
                      //_landHolding.clear();
                      _landForUse.clear();
                      _landType.clear();
                      _landRemark.clear();
                      LandType.landTypeList.forEach((element) {
                        element.value = false;
                      });
                      MainLandHoldingModel.landHoldingList.modelList.forEach((element) {
                        element.value = false;
                      });
                      MainLandTypeModel.landTypeList.modelList.forEach((element) {
                        element.value = false;
                        element.another?.clear();
                      });
                    });

                    _addWas5List(context: context, point5: point5, state: state);
                    print('add was list');
                  },
                ),
                const SizedBox(height: 20),
                point5.wasListModel.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 10,
                            horizontalMargin: 10,
                            headingTextStyle: const TextStyle(fontSize: 16, color: Colors.black),

                            // border: TableBorder.all(width: 1.0, color: Colors.grey.shade200),
                            //border: TableBorder.all(width: 1.0, color: Colors.grey),
                            dataTextStyle: const TextStyle(fontSize: 14, color: Colors.black),
                            headingRowColor: MaterialStateProperty.all(const Color(0xff9ABC95)),

                            columns: const [
                              DataColumn(
                                // size: ColumnSize.S,
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text('แปลงที่'),
                              ),
                              DataColumn(
                                label: Text('ชื่อแปลง'),
                              ),
                              DataColumn(
                                label: Text('จำนวนที่ดิน (ไร่/งาน/ตารางวา)'),
                              ),
                              DataColumn(
                                label: Text('ที่ตั้ง (หมู่บ้าน/อำเภอ)'),
                              ),
                              DataColumn(
                                label: Text('การถือครอง'),
                              ),
                              DataColumn(
                                label: Text('การใช้ประโยชน์'),
                              ),
                              DataColumn(
                                label: Text('ชนิดดิน'),
                              ),
                              DataColumn(
                                label: Text('ลักษณะพื้นที่'),
                              ),
                              DataColumn(
                                label: Text('หมายเหตุ (กรณีที่ดินผืน เดียวกัน)'),
                              ),
                            ],
                            rows: List.generate(
                              point5.wasListModel.length,
                              (index) {
                                final was = point5.wasListModel[index];
                                return DataRow(cells: [
                                  DataCell(
                                    GestureDetector(
                                      onTap: () {
                                        point5.wasListModel.removeAt(index);
                                        state.selectedPoint5 = point5;
                                        setState(() {});
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: Color(0xffFC5E5E),
                                        radius: 10,
                                        child: Icon(
                                          Icons.close,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: '${index + 1}',
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  DataCell(
                                    CustomText(
                                        text: was.landName, fontSize: 16, color: Colors.black),
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: was.landZCount,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: was.landArea,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  DataCell(
                                    CustomText(
                                      text: was.landHolding.map((e) => e.text).join(', '),
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  DataCell(CustomText(
                                      text: was.landForUse, fontSize: 16, color: Colors.black)),
                                  DataCell(CustomText(
                                    text: was.landType.map((e) {
                                      if (e.text.contains('อื่นๆ')) {
                                        return e.another?.text ?? '';
                                      } else {
                                        return e.text;
                                      }
                                    }).join(', '),
                                    fontSize: 16,
                                    color: Colors.black,
                                  )),
                                  DataCell(CustomText(
                                      text: was.landTypeList?.name ?? '',
                                      fontSize: 16,
                                      color: Colors.black)),
                                  DataCell(CustomText(
                                      text: was.landRemark ?? '',
                                      fontSize: 16,
                                      color: Colors.black)),
                                ]);
                              },
                            ),
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            CustomText(text: '----------กรุณาเพิ่มรายการถือครองที่ดิน-----------'),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPointAdOn1Widget(BuildContext context, AgriInfoState state) {
    final pointAdOn1 = Section1Point1.section1PointAdOn1;
    final tractorHead = pointAdOn1.tractorModel;

    final pointAdOn2 = Section1Point1.section1PointAdOn2;
    final tractorHead2 = pointAdOn2.tractorModel;

    final pointAdOn3 = Section1Point1.section1PointAdOn3;
    final tractorHead3 = pointAdOn3.tractorModel;

    final pointAdOn4 = Section1Point1.section1PointAdOn4;
    final tractorHead4 = pointAdOn4.tractorModel;

    final pointAdOn5 = Section1Point1.section1PointAdOn5;
    final tractorHead5 = pointAdOn5.tractorModel;

    final pointAdOn6 = Section1Point1.section1PointAdOn6;
    final tractorHead6 = pointAdOn6.tractorModel;

    final pointAdOn7 = Section1Point1.section1PointAdOn7;
    final tractorHead7 = pointAdOn7.tractorModel;

    final pointAdOn8 = Section1Point1.section1PointAdOn8;
    final tractorHead8 = pointAdOn8.tractorModel;

    final pointAdOn9 = Section1Point1.section1PointAdOn9;
    final tractorHead9 = pointAdOn9.tractorModel;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
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
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: pointAdOn1.question,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                _buildAdOn1(tractorHead, pointAdOn1),
                const Divider(color: Colors.black),
                _buildAdOn2(tractorHead2, pointAdOn2),
                const Divider(color: Colors.black),
                _buildAdOn3(tractorHead3, pointAdOn3),
                const Divider(color: Colors.black),
                _buildAdOn4(tractorHead4, pointAdOn4),
                const Divider(color: Colors.black),
                _buildAdOn5(tractorHead5, pointAdOn5),
                const Divider(color: Colors.black),
                _buildAdOn6(tractorHead6, pointAdOn6),
                const Divider(color: Colors.black),
                _buildAdOn7(tractorHead7, pointAdOn7),
                const Divider(color: Colors.black),
                _buildAdOn8(tractorHead8, pointAdOn8),
                const Divider(color: Colors.black),
                _buildAdOn9(tractorHead9, pointAdOn9),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdOn1(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn1 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn1;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final adOn1ForUse3 = ad.adOn1ForUse3;
    final seq = section1PointAdOn1.mainSequenceToUseModel;

    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: 'แทรกเตอร์',
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tb1(ad),
                  const SizedBox(height: 10),
                  tb2(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tb4(ad, seq),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: 'ปรับผานไถ ให้ใส่ค่าจำนวนผาน ',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        ...adOn1ForUse3.map(
                          (e) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: _buildCheckRowTextWidget(
                                value: e.value,
                                text: e.text ?? '',
                                onChanged: (value) {
                                  e.value = !e.value;
                                  //_formKeyA1.currentState?.validate();

                                  setState(() {});
                                },
                              ),
                            );
                          },
                        ).toList(),
                        /*_buildCheckRowTextWidget(
                          value: ad.landExpotion.value,
                          text: ad.landExpotion.text ?? '',
                          onChanged: (value) {
                            setState(() {
                              ad.landExpotion.value = value!;
                            });
                          },
                        ),
                        _buildCheckRowTextWidget(
                          value: ad.rotaree.value,
                          text: ad.rotaree.text ?? '',
                          onChanged: (value) {
                            setState(() {
                              ad.rotaree.value = value!;
                            });
                          },
                        ),*/
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn2(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn2 section1PointAdOn1) {
    AdOn2 ad = section1PointAdOn1.adOn2;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;

    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: 'เครื่องหยอดเมล็ดข้าว',
          onChanged: (value) {
            setState(() {
              tractorHead.value = !tractorHead.value;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt1(ad),
                  const SizedBox(height: 10),
                  tbt2(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt4(ad, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn3(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn3 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn3;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;
    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: 'เครื่องอัดฟาง',
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt31(ad),
                  const SizedBox(height: 10),
                  tbt32(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt34(ad, _formKeyA3, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn4(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn3 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn3;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;
    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: tractorHead.question,
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt31(ad),
                  const SizedBox(height: 10),
                  tbt32(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt34(ad, _formKeyA4, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn5(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn3 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn3;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;
    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: tractorHead.question,
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt31(ad),
                  const SizedBox(height: 10),
                  tbt32(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt34(ad, _formKeyA5, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn6(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn3 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn3;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;
    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: tractorHead.question,
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt31(ad),
                  const SizedBox(height: 10),
                  tbt32(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt34(ad, _formKeyA6, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn7(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn3 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn3;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;
    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: tractorHead.question,
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt31(ad),
                  const SizedBox(height: 10),
                  tbt32(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt34(ad, _formKeyA7, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn8(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn3 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn3;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;
    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: tractorHead.question,
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt31(ad),
                  const SizedBox(height: 10),
                  tbt32(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt34(ad, _formKeyA8, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdOn9(
      Section1PointAdOnModelList tractorHead, Section1PointAdOn3 section1PointAdOn1) {
    final ad = section1PointAdOn1.adOn3;
    final inHome = ad.forUse.inHome;
    final forWorks = ad.forUse.forWorks.forWork;
    final seq = section1PointAdOn1.mainSequenceToUseModel;
    final forWorkList = ad.forUse.forWorks.forWorkList;
    return Column(
      children: [
        _buildCheckRowTextWidget(
          value: tractorHead.value,
          text: tractorHead.question,
          onChanged: (value) {
            setState(() {
              tractorHead.value = value!;
            });
          },
        ),
        Visibility(
          visible: tractorHead.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKeyA9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tbt31(ad),
                  const SizedBox(height: 10),
                  tbt32(ad),
                  const CustomText(
                    text: 'การใช้ประโยชน์(ตอบได้มากกว่า 1 ข้อ)',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  tb3(inHome, forWorks, forWorkList),
                  const CustomText(
                    text: 'ความถี่ในการใช้งาน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  _tbt34(ad, _formKeyA9, seq),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _tb4(AdOn1 ad, List<MainSequenceToUseModel> mainSequenceToUseModel) {
    List<bool> isValue = [
      ad.week!.value.text.isNotEmpty,
      ad.month!.value.text.isNotEmpty,
      ad.year!.value.text.isNotEmpty,
    ];

    return Column(
      children: [
        ...mainSequenceToUseModel.map((e) {
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: e.value,
                    onChanged: (value) {
                      e.value = value!;
                      if (!e.value) {
                        e.subs.forEach((element) {
                          element.value = false;
                        });
                      }
                      mainSequenceToUseModel.forEach((element) {
                        if (element.text != e.text) {
                          element.value = false;
                          element.subs.forEach((element) {
                            element.value = false;
                          });
                        }
                      });
                      setState(() {});
                    },
                  ),
                  CustomText(text: e.text, fontSize: 16, color: Colors.black),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: [
                    ...e.subs.map((sub) {
                      return Row(
                        children: [
                          Checkbox(
                            value: sub.value,
                            onChanged: !e.value
                                ? null
                                : (value) {
                                    sub.value = value!;
                                    mainSequenceToUseModel.forEach((element) {
                                      element.subs.forEach((element) {
                                        if (element.text != sub.text) {
                                          element.value = false;
                                        }
                                      });
                                    });
                                    setState(() {});
                                  },
                          ),
                          const SizedBox(width: 10),
                          CustomText(text: sub.text, fontSize: 16, color: Colors.black),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: _buildTextFieldWidget(
                                enabled: e.value && sub.value,
                                controller: sub.controller,
                                keyboardType: TextInputType.number,
                                validator: e.value && sub.value ? null : (value) => 'กรุณาระบุ',
                                onChanged: (value) {
                                  // _formKeyA1.currentState!.validate();
                                  // setState(() {});
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomText(text: sub.suffix, fontSize: 16, color: Colors.black),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              )
            ],
          );
        }).toList(),
      ],
    );

    /*  return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / สัปดาห์', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.week,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _formKeyA1.currentState!.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / เดือน', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.month,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _formKeyA1.currentState!.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / ปี', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.year,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _formKeyA1.currentState!.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );*/
  }

  Widget _tbt4(AdOn2 ad, List<MainSequenceToUseModel> mainSequenceToUseModel) {
/*
    List<bool> isValue = [
      ad.week!.value.text.isNotEmpty,
      ad.month!.value.text.isNotEmpty,
      ad.year!.value.text.isNotEmpty,
    ];

    bool isAllTrue = isValue.any((element) => element == true);
*/

    return Column(
      children: [
        ...mainSequenceToUseModel.map((e) {
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: e.value,
                    onChanged: (value) {
                      e.value = value!;
                      if (!e.value) {
                        e.subs.forEach((element) {
                          element.value = false;
                        });
                      }
                      mainSequenceToUseModel.forEach((element) {
                        if (element.text != e.text) {
                          element.value = false;
                          element.subs.forEach((element) {
                            element.value = false;
                          });
                        }
                      });
                      setState(() {});
                    },
                  ),
                  CustomText(text: e.text, fontSize: 16, color: Colors.black),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: [
                    ...e.subs.map((sub) {
                      return Row(
                        children: [
                          Checkbox(
                            value: sub.value,
                            onChanged: !e.value
                                ? null
                                : (value) {
                                    sub.value = value!;
                                    mainSequenceToUseModel.forEach((element) {
                                      element.subs.forEach((element) {
                                        if (element.text != sub.text) {
                                          element.value = false;
                                        }
                                      });
                                    });
                                    setState(() {});
                                  },
                          ),
                          const SizedBox(width: 10),
                          CustomText(text: sub.text, fontSize: 16, color: Colors.black),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: _buildTextFieldWidget(
                                enabled: e.value && sub.value,
                                controller: sub.controller,
                                keyboardType: TextInputType.number,
                                validator: e.value && sub.value ? null : (value) => 'กรุณาระบุ',
                                onChanged: (value) {
                                  // _formKeyA1.currentState!.validate();
                                  // setState(() {});
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomText(text: sub.suffix, fontSize: 16, color: Colors.black),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              )
            ],
          );
        }).toList(),
      ],
    );
    /*return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / สัปดาห์', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.week,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _formKeyA2.currentState!.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / เดือน', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.month,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _formKeyA2.currentState!.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / ปี', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.year,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _formKeyA2.currentState!.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );*/
  }

  Widget _tbt34(AdOn3 ad, GlobalKey<FormState> _formKey,
      List<MainSequenceToUseModel> mainSequenceToUseModel) {
    return Column(
      children: [
        ...mainSequenceToUseModel.map((e) {
          return Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: e.value,
                    onChanged: (value) {
                      e.value = value!;
                      if (!e.value) {
                        e.subs.forEach((element) {
                          element.value = false;
                        });
                      }
                      mainSequenceToUseModel.forEach((element) {
                        if (element.text != e.text) {
                          element.value = false;
                          element.subs.forEach((element) {
                            element.value = false;
                          });
                        }
                      });
                      setState(() {});
                    },
                  ),
                  CustomText(text: e.text, fontSize: 16, color: Colors.black),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Column(
                  children: [
                    ...e.subs.map((sub) {
                      return Row(
                        children: [
                          Checkbox(
                            value: sub.value,
                            onChanged: !e.value
                                ? null
                                : (value) {
                                    sub.value = value!;
                                    mainSequenceToUseModel.forEach((element) {
                                      element.subs.forEach((element) {
                                        if (element.text != sub.text) {
                                          element.value = false;
                                        }
                                      });
                                    });
                                    setState(() {});
                                  },
                          ),
                          const SizedBox(width: 10),
                          CustomText(text: sub.text, fontSize: 16, color: Colors.black),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: _buildTextFieldWidget(
                                enabled: e.value && sub.value,
                                controller: sub.controller,
                                keyboardType: TextInputType.number,
                                validator: e.value && sub.value ? null : (value) => 'กรุณาระบุ',
                                onChanged: (value) {
                                  // _formKeyA1.currentState!.validate();
                                  // setState(() {});
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CustomText(text: sub.suffix, fontSize: 16, color: Colors.black),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              )
            ],
          );
        }).toList(),
      ],
    );
    /*List<bool> isValue = [
      ad.week!.value.text.isNotEmpty,
      ad.month!.value.text.isNotEmpty,
      ad.year!.value.text.isNotEmpty,
    ];

    bool isAllTrue = isValue.any((element) => element == true);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / สัปดาห์', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.week,
                keyboardType: TextInputType.number,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                onChanged: (value) {
                  _formKey.currentState?.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / เดือน', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.month,
                keyboardType: TextInputType.number,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                onChanged: (value) {
                  _formKey.currentState?.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / ปี', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.year,
                keyboardType: TextInputType.number,
                validator: isAllTrue ? null : (value) => 'กรุณาระบุ',
                onChanged: (value) {
                  _formKeyA3.currentState?.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );*/
  }

  Widget _tbt44(AdOn3 ad) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / สัปดาห์', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.week,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / เดือน', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.month,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ครั้ง / ปี', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.year,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tb3(
    Section1PointAdOnModelList inHome,
    Section1PointAdOnModelList forWorks,
    List<Section1PointAdOnModelList> forWorkList,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: _buildCheckRowTextWidget(
            value: inHome.value,
            text: inHome.question,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onChanged: (value) {
              setState(() {
                inHome.value = value!;
              });
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCheckRowTextWidget(
                value: forWorks.value,
                text: forWorks.question,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onChanged: (value) {
                  setState(() {
                    forWorks.value = value!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  children: forWorkList.map((e) {
                    final index = forWorkList.indexOf(e);
                    return _buildCheckRowTextWidget(
                      value: e.value,
                      text: e.question,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          e.value = value!;
                          /*if (e.value) {
                                      forWorkList.forEach((element) {
                                        if (element != e) {
                                          element.value = false;
                                        }
                                      });
                                    }*/
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row tb2(AdOn1 ad) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ปีที่ซื้อ (พ.ศ.)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorYear,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              const CustomText(
                text: 'สถานะของเครื่องจักร',
                fontSize: 16,
                color: Colors.black,
              ),
              ...ad.tractorStatus.map((e) {
                final index = ad.tractorStatus.indexOf(e);
                return _buildCheckRowTextWidget(
                  value: e.value,
                  text: e.question,
                  onChanged: (value) {
                    setState(() {
                      e.value = value!;
                      if (e.value) {
                        ad.tractorStatus.forEach((element) {
                          if (element != e) {
                            element.value = false;
                          }
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Row tbt2(AdOn2 ad) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ปีที่ซื้อ (พ.ศ.)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorYear,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              const CustomText(
                text: 'สถานะของเครื่องจักร',
                fontSize: 16,
                color: Colors.black,
              ),
              ...ad.tractorStatus.map((e) {
                final index = ad.tractorStatus.indexOf(e);
                return _buildCheckRowTextWidget(
                  value: e.value,
                  text: e.question,
                  onChanged: (value) {
                    setState(() {
                      e.value = value!;
                      if (e.value) {
                        ad.tractorStatus.forEach((element) {
                          if (element != e) {
                            element.value = false;
                          }
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget tbt32(AdOn3 ad) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ปีที่ซื้อ (พ.ศ.)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorYear,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
                onChanged: (value) {
                  _formKeyA3.currentState?.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              const CustomText(
                text: 'สถานะของเครื่องจักร',
                fontSize: 16,
                color: Colors.black,
              ),
              ...ad.tractorStatus.map((e) {
                final index = ad.tractorStatus.indexOf(e);
                return _buildCheckRowTextWidget(
                  value: e.value,
                  text: e.question,
                  onChanged: (value) {
                    setState(() {
                      e.value = value!;
                      if (e.value) {
                        ad.tractorStatus.forEach((element) {
                          if (element != e) {
                            element.value = false;
                          }
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Row tbt42(AdOn3 ad) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'ปีที่ซื้อ (พ.ศ.)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorYear,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              const CustomText(
                text: 'สถานะของเครื่องจักร',
                fontSize: 16,
                color: Colors.black,
              ),
              ...ad.tractorStatus.map((e) {
                final index = ad.tractorStatus.indexOf(e);
                return _buildCheckRowTextWidget(
                  value: e.value,
                  text: e.question,
                  onChanged: (value) {
                    setState(() {
                      e.value = value!;
                      if (e.value) {
                        ad.tractorStatus.forEach((element) {
                          if (element != e) {
                            element.value = false;
                          }
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Row tb1(AdOn1 ad) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'แทรกเตอร์กี่แรงม้า', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorHourse,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'จำนวน (คัน/เครื่อง/ชิ้น)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorCount,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tbt1(AdOn2 ad) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'จำนวนแถว', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.rowCount,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
                onChanged: (value) {
                  _formKeyA2.currentState?.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'จำนวน (คัน/เครื่อง/ชิ้น)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorCount,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tbt31(AdOn3 ad) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'จำนวน (คัน/เครื่อง/ชิ้น)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorCount,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณาระบุ';
                  }
                  return null;
                },
                onChanged: (value) {
                  _formKeyA3.currentState?.validate();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tbt41(AdOn3 ad) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'จำนวน (คัน/เครื่อง/ชิ้น)', fontSize: 16, color: Colors.black),
              _buildTextFieldWidget(
                controller: ad.tractorCount,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldWidget({
    required TextEditingController? controller,
    bool? enabled,
    String? Function(String?)? validator,
    Function(String?)? onChanged,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
        enabled: enabled ?? true,
        autovalidateMode: AutovalidateMode.always,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType ?? TextInputType.text,
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          //contentPadding: const EdgeInsets.all(8),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          hintStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeConfig.primary,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeConfig.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeConfig.primary,
              width: 1,
            ),
          ),
          errorText: null,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 0,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
        ));
  }

  Widget _buildCheckRowTextWidget({
    required bool value,
    required String text,
    required Function(bool?)? onChanged,
    OutlinedBorder? shape,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          shape: shape,
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: CustomText(
            text: text,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  final TextEditingController _landName = TextEditingController();
  final TextEditingController _landZCount = TextEditingController();
  final TextEditingController _landArea = TextEditingController();

  //final TextEditingController _landHolding = TextEditingController();
  final TextEditingController _landForUse = TextEditingController();
  final TextEditingController _landType = TextEditingController();
  final TextEditingController _landRemark = TextEditingController();

  final _formKey5 = GlobalKey<FormState>();

  void _addWas5List({
    required BuildContext context,
    required Section1Point5 point5,
    required AgriInfoState state,
  }) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, s) {
            return Container(
              // height: 600,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey5,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: 'การถือครองที่ดินและการใช้ประโยชน์',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff194902),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ชื่อแปลง',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _landName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาระบุ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'ระบุ',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'จำนวนที่ดิน (ไร่)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.number,
                              controller: _landZCount,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาระบุ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'ระบุ',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ที่ตั้ง (หมู่บ้าน/อำเภอ)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _landArea,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาระบุ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'ระบุ',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: MainLandHoldingModel.landHoldingList.title,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: MainLandHoldingModel.landHoldingList.modelList.map(
                                  (e) {
                                    final index =
                                        MainLandHoldingModel.landHoldingList.modelList.indexOf(e);
                                    final landHolding =
                                        MainLandHoldingModel.landHoldingList.modelList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          landHolding.value = !e.value;
                                          if (landHolding.value) {
                                            MainLandHoldingModel.landHoldingList.modelList
                                                .forEach((element) {
                                              if (element != e) {
                                                element.value = false;
                                              }
                                            });
                                          } else {
                                            MainLandHoldingModel.landHoldingList.modelList
                                                .forEach((element) {
                                              element.value = false;
                                            });
                                          }

                                          s(() {});
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Checkbox(
                                                value: e.value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    landHolding.value = !e.value;
                                                    if (landHolding.value) {
                                                      MainLandHoldingModel.landHoldingList.modelList
                                                          .forEach((element) {
                                                        if (element != e) {
                                                          element.value = false;
                                                        }
                                                      });
                                                    } else {
                                                      MainLandHoldingModel.landHoldingList.modelList
                                                          .forEach((element) {
                                                        element.value = false;
                                                      });
                                                    }
                                                    s(() {});
                                                  });
                                                },
                                              ),
                                              Expanded(
                                                child: CustomText(
                                                  text: e.text,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  overflow: TextOverflow.visible,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: MainLandTypeModel.landTypeList.title,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: MainLandTypeModel.landTypeList.modelList.map(
                                  (e) {
                                    final index =
                                        MainLandTypeModel.landTypeList.modelList.indexOf(e);
                                    final landHolding =
                                        MainLandTypeModel.landTypeList.modelList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          landHolding.value = !e.value;
                                          if (landHolding.value) {
                                            MainLandTypeModel.landTypeList.modelList
                                                .forEach((element) {
                                              if (element != e) {
                                                element.value = false;
                                              }
                                            });
                                          } else {
                                            MainLandTypeModel.landTypeList.modelList
                                                .forEach((element) {
                                              element.value = false;
                                            });
                                          }

                                          s(() {});
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Checkbox(
                                                value: e.value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    landHolding.value = !e.value;
                                                    if (landHolding.value) {
                                                      MainLandTypeModel.landTypeList.modelList
                                                          .forEach((element) {
                                                        if (element != e) {
                                                          element.value = false;
                                                        }
                                                      });
                                                    } else {
                                                      MainLandTypeModel.landTypeList.modelList
                                                          .forEach((element) {
                                                        element.value = false;
                                                      });
                                                    }
                                                    s(() {});
                                                  });
                                                },
                                              ),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    CustomText(
                                                      text: e.text,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.normal,
                                                      color: Colors.black,
                                                      overflow: TextOverflow.visible,
                                                      textAlign: TextAlign.start,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    if (e.isAnother)
                                                      Expanded(
                                                        child: TextFormField(
                                                          autovalidateMode:
                                                              AutovalidateMode.onUserInteraction,
                                                          controller: e.another,
                                                          enabled: e.value,
                                                          validator: !e.value
                                                              ? null
                                                              : (value) {
                                                                  if (value!.isEmpty) {
                                                                    return 'กรุณาระบุ';
                                                                  }
                                                                  return null;
                                                                },
                                                          decoration: InputDecoration(
                                                            hintText: 'ระบุ',
                                                            contentPadding: const EdgeInsets.all(8),
                                                            hintStyle:
                                                                const TextStyle(fontSize: 16),
                                                            border: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: ThemeConfig.primary,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: ThemeConfig.primary,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius.circular(8),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: ThemeConfig.primary,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            errorStyle: const TextStyle(
                                                              color: Colors.red,
                                                            ),
                                                            errorBorder: const OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                color: Colors.red,
                                                                width: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'การใช้ประโยชน์',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _landForUse,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาระบุ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'ระบุ',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 10),
                          /* const CustomText(
                            text: 'ชนิดดิน',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _landType,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณาระบุ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'ระบุ',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                              )),
                          const SizedBox(height: 10),*/
                          const CustomText(
                            text: 'ลักษณะพื้นที่',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: LandType.landTypeList.map(
                              (e) {
                                final index = LandType.landTypeList.indexOf(e);
                                final landType = LandType.landTypeList[index];
                                return Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        landType.value = !e.value;
                                        if (landType.value) {
                                          LandType.landTypeList.forEach((element) {
                                            if (element != e) {
                                              element.value = false;
                                            }
                                          });
                                        } else {
                                          LandType.landTypeList.forEach((element) {
                                            element.value = false;
                                          });
                                        }

                                        s(() {});
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Checkbox(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              value: e.value,
                                              onChanged: (value) {
                                                setState(() {
                                                  landType.value = !e.value;
                                                  if (landType.value) {
                                                    LandType.landTypeList.forEach((element) {
                                                      if (element != e) {
                                                        element.value = false;
                                                      }
                                                    });
                                                  } else {
                                                    LandType.landTypeList.forEach((element) {
                                                      element.value = false;
                                                    });
                                                  }
                                                  s(() {});
                                                });
                                              },
                                            ),
                                            Expanded(
                                              child: CustomText(
                                                text: e.name,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                                overflow: TextOverflow.visible,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'หมายเหตุ (กรณีที่ดินผืน เดียวกัน)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: _landRemark,
                              decoration: InputDecoration(
                                hintText: 'ไม่บังคับ',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: const TextStyle(fontSize: 16),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ThemeConfig.primary,
                                    width: 1,
                                  ),
                                ),
                                errorStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1,
                                  ),
                                ),
                              )),
                          //const SizedBox(height: 29),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoButton(
                                  color: const Color(0xff194902),
                                  child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                                  onPressed: () {
                                    if (LandType.landTypeList
                                        .where((type) => type.value == true)
                                        .isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกลักษณะพื้นที่',
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2,
                                      );
                                      return;
                                    }

                                    if (MainLandHoldingModel.landHoldingList.modelList
                                        .where((e) => e.value == true)
                                        .isEmpty) {
                                      Fluttertoast.showToast(
                                        msg:
                                            'กรุณาเลือก${MainLandHoldingModel.landHoldingList.title}',
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2,
                                      );
                                      return;
                                    }

                                    if (MainLandTypeModel.landTypeList.modelList
                                        .where((e) => e.value == true)
                                        .isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกล${MainLandTypeModel.landTypeList.title}',
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 2,
                                      );
                                      return;
                                    }

                                    if (_formKey5.currentState!.validate()) {
                                      LandType landType = LandType.landTypeList
                                          .firstWhere((element) => element.value);

                                      List<LandHoldingModel> landHoldingList = MainLandHoldingModel
                                          .landHoldingList.modelList
                                          .where((element) => element.value)
                                          .toList();
                                      landHoldingG = landHoldingList;

                                      List<LandTypeModel> landTypeList = MainLandTypeModel
                                          .landTypeList.modelList
                                          .where((element) => element.value)
                                          .toList();
                                      landTypeG = landTypeList;

                                      // Before adding
                                      debugPrint("Before Adding Model");
                                      debugPrint("Land Name: ${_landName.text}");
                                      debugPrint(
                                          "Land Holdings: ${landHoldingG.map((e) => e.text).toList()}");
                                      debugPrint(
                                          "Land Types: ${landTypeG.map((e) => e.text).toList()}");

                                      point5.wasListModel.add(
                                        Section1Point5ListModel(
                                          landName: _landName.text,
                                          landZCount: _landZCount.text,
                                          landArea: _landArea.text,
                                          landHolding: List<LandHoldingModel>.from(landHoldingG),
                                          landForUse: _landForUse.text,
                                          landType: List<LandTypeModel>.from(landTypeG),
                                          landTypeList: landType,
                                          landRemark:
                                              _landRemark.text.isEmpty ? '-' : _landRemark.text,
                                        ),
                                      );
                                      RiceFieldModel.riceFields.add(
                                        RiceFieldModel(
                                          riceFieldArea: double.parse(_landZCount.text ?? '0'),
                                          riceFieldName: _landName.text,
                                          riceFieldNumber: RiceFieldModel.riceFields.length + 1,
                                        ),
                                      );
                                      setState(() {});
                                      s(() {});

                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                CupertinoButton(
                                  color: Colors.grey,
                                  child: const CustomText(text: 'ยกเลิก', color: Colors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        }).whenComplete(() {
      _focusNode3.unfocus();
      state.selectedPoint5 = point5;
    });
  }
}
