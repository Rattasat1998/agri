import 'package:agri/screens/profile/pages/agri_information/bloc/agri_info_bloc.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_2_data_model.dart';
import 'package:agri/screens/profile/pages/agri_information/pages/section_2/widgets/section_2_rice_field_plot_widget.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../widgets/custom_text.dart';
import '../../models/rice_field_model.dart';
import '../../models/section_2_model.dart';

class Section2RiceFieldPage extends StatefulWidget {
  const Section2RiceFieldPage({super.key});

  @override
  State<Section2RiceFieldPage> createState() => _Section2RiceFieldPageState();
}

class _Section2RiceFieldPageState extends State<Section2RiceFieldPage> {
  final _formKey = GlobalKey<FormState>();

  void _onSelectedRiceField(BuildContext context, RiceFieldModel? value) {
    if (value != null) {
      context.read<AgriInfoBloc>().add(SelectedRiceFieldEvent(riceField: value));
    }
  }

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToCenter() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent / 1.5,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    const headColor = Color(0xff103300);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        /*floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _scrollToTop();
          },
          label: Row(
            children: [
              GestureDetector(
                onTap: () {
                  _scrollToTop();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.arrow_upward),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _scrollToCenter();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.add),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _scrollToBottom();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.arrow_downward),
                ),
              ),
            ],
          ),
        ),*/
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const CustomText(
            text: 'ข้อมูลแปลงปลูกข้าว',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xff194902),
          ),
          leading: const BackButtonWidget(),
        ),
        body: BlocBuilder<AgriInfoBloc, AgriInfoState>(
          builder: (context, state) {
            final riceField = state.selectedRiceField;
            return Scrollbar(
              thickness: 5,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildDropdownSelectedRiceFieldWidget(context),
                        Section2RiceFieldPlotWidget(selectedRiceField: riceField),
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: Section2Model.s21H,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: headColor,
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s211.question,
                                child: _build211(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s212.question,
                                child: _build212(riceField),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s213.question,
                                child: _build213(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s214.question,
                                child: _build214(),
                              ),
                              /* const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s215.question,
                                child: _build215(),
                              ),*/
                              const SizedBox(height: 30),
                              CustomText(
                                text: Section2Model.s22H,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: headColor,
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s221.question,
                                child: _build221(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s222.question,
                                child: _build222(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s223.question,
                                child: _build223(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s224.question,
                                child: _build224(),
                              ),
                              /*const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s225.question,
                                child: _build225(),
                              ),*/
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s226.question,
                                child: _build225(),
                              ),
                              const SizedBox(height: 30),
                              CustomText(
                                text: Section2Model.s23H,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: headColor,
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s231.question,
                                child: _build231(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s232True.question,
                                child: _build232True(),

                                /// S232 true
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s232.question,
                                child: _build232(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: 'ขั้นตอนการเตรียมดิน',
                                child: _buildSoilPreparationStepWidget(context),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title:
                                    '2.3.4 วิธีการปลูกในปีการผลิตที่ผ่านมาท่านทำการปลูกข้าวกี่ครั้ง',
                                child: _buildHS23owToPlantInTheLastProductionYearsWidget(context),
                              ),
                              const SizedBox(height: 30),
                              CustomText(
                                text: Section2Model.s24H,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: headColor,
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s241.question,
                                child: _build241(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: '2.4.2 การกำจัดวัชพืช',
                                child: _build24531(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.caseKillWeeds.question,
                                child: _buildCaseKillWeedsWidget(context),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: '2.4.3 ในแปลงท่านพบพันธุ์ข้าวปนหรือไม่',
                                child: _build242(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: '2.4.4 ท่านได้กำจัดพันธุ์ปนในแปลงท่านพบพันธุ์ข้าวหรือไม่',
                                child: _build243(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: '2.4.5 ข้าวมีการเจริญเติบโตเต็มแปลงหรือไม่',
                                child: _build244(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s245.question,
                                child: _build245(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.caseOfGivingWaters.question,
                                child: _buildHowToGivingWaterWidget(context),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s245.s2451.s24512.question,
                                child: _build24521(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.caseOfApplyingFertilizers.question,
                                child: _buildCaseOfApplyingFertilizersWidget(context),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s254532.question,
                                child: _build2254(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s224541.question,
                                child: _build24541(),
                              ),
                              /* const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s224542.question,
                                child: _build24542(),
                              ),*/
                              const SizedBox(height: 30),
                              CustomText(
                                text: Section2Model.s25H,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: headColor,
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s251.question,
                                child: _build251(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s252.question,
                                child: _build252(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s253.question,
                                child: _build253(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s254.question,
                                child: _build254(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s255.question,
                                child: _build255(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s256.question,
                                child: _build256(),
                              ),
                              const SizedBox(height: 30),
                              CustomText(
                                text: Section2Model.s26H,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: headColor,
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s260.question,
                                child: _build260(),
                              ),
                              const SizedBox(height: 30),
                              Center(
                                child: CupertinoButton(
                                  color: const Color(0xff194902),
                                  onPressed: () {
                                    if (state.selectedRiceField == null) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกแปลงที่ต้องการบันทึกข้อมูล',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }
                                    RiceFieldModel riceField = state.selectedRiceField!;

                                    // TODO 2.1.1
                                    bool s211 = Section2Model.s211.values
                                        .where((e) => e.value == true)
                                        .isEmpty;
                                    if (s211) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.1.1',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    riceField.s11 = Section2Model.s211.values
                                        .where((e) => e.value == true)
                                        .first
                                        .text;
                                    print('2.1.1 : ${riceField.s11} : ckecked');

                                    // TODO 2.1.2
                                    bool s212 = Section2Model.s212.values
                                        .any((e) => e.controller!.text.isEmpty);
                                    if (s212) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.1.2',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      _formKey.currentState?.validate();
                                      return;
                                    }

                                    riceField.s12 = Section2Model.s212.values
                                        .map((e) => '${e.prefix} ${e.controller!.text} ${e.suffix}')
                                        .toList()
                                        .join(' ');
                                    print('2.1.2 : ${riceField.s12} : ckecked');

                                    bool s213v1 = Section2Model.s213.values.value1!.value;
                                    bool s213v2 = Section2Model.s213.values.value2!.value!;

                                    bool s213 = s213v1 || s213v2;
                                    if (!s213) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.1.3',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }
                                    if (s213v2) {
                                      if (Section2Model
                                          .s213.values.value2!.controller!.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.1.3',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        _formKey.currentState?.validate();
                                        return;
                                      }
                                      riceField.s13 =
                                          '${Section2Model.s213.values.value2!.controller!.text} ${Section2Model.s213.values.value2!.suffix}';
                                    }
                                    if (s213v1) {
                                      riceField.s13 = Section2Model.s213.values.value1!.text;
                                    }

                                    print('2.1.3 : ${riceField.s13} : ckecked');

                                    // TODO 2.1.4
                                    bool s214 = Section2Model.s214.values
                                        .where((e) => e.value == true)
                                        .isEmpty;
                                    if (s214) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.1.4',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    final s214d = Section2Model.s214.values
                                        .where((e) => e.value == true)
                                        .first;

                                    riceField.s14 = s214d.text;

                                    print('2.1.4 : ${riceField.s14} : ckecked');

                                    /// 2.1.5
                                    /* bool s215v1 = Section2Model.s215.values.value1!.value;
                                    bool s215v2 = Section2Model.s215.values.value2!.value!;

                                    bool s215 = s215v1 || s215v2;

                                    if (!s215) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.1.5',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }
                                    if (s215v2) {
                                      if (Section2Model.s215.values.value2!.controller!.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.1.5',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        _formKey.currentState?.validate();
                                        return;
                                      }
                                      riceField.s15 =
                                      '${Section2Model.s215.values.value2!.controller!.text} ${Section2Model.s215.values.value2!.suffix}';
                                    }
                                    if (s215v1) {
                                      riceField.s15 = Section2Model.s215.values.value1!.text;
                                    }

                                    print('s15: ${riceField.s15}'); */

                                    /// 2.2.1
                                    bool s221AllTrue =
                                        Section2Model.s221.datas.any((e) => e.value == true);

                                    if (!s221AllTrue) {
                                      print('s221AllTrue');
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.2.1',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    } else {
                                      try {
                                        List<S221Model> result =
                                            Section2Model.s221.datas.where((e) => e.value).toList();

                                        // ตรวจสอบหากไม่มีข้อมูลที่ถูกเลือก
                                        if (result.isEmpty) {
                                          Fluttertoast.showToast(
                                            msg: 'กรุณากรอกข้อมูลในข้อ 2.2.1',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          return;
                                        }

                                        List<String> s221List = [];

                                        for (var item in result) {
                                          // เพิ่มข้อมูลหัวข้อหลัก เช่น "ข้าวเหนียว" หรือ "ข้าวเจ้า"
                                          s221List.add(item.text);

                                          // เพิ่มข้อมูลพันธุ์ที่ถูกเลือก
                                          List<String> selectedSubValues = item.values
                                              .where((value) => value.value)
                                              .map((value) => value.text)
                                              .toList();

                                          if (selectedSubValues.isNotEmpty) {
                                            s221List.add("${selectedSubValues.join(", ")}");
                                          }

                                          // สำหรับกรณีที่เป็น controller
                                          if (item.controller != null &&
                                              item.controller!.text.isNotEmpty) {
                                            s221List.add("${item.controller!.text}");
                                          }
                                        }

                                        // รวมข้อความเป็น String เดียว
                                        riceField.s21 = s221List.join(" > ");
                                      } catch (e) {
                                        print('Error: $e');
                                      }
                                    }
                                    print('2.2.1 : ${riceField.s21}'); // 2.2.1

                                    /// 2.2.2
                                    try {
                                      String s222 = '';
                                      List<Section2ValueTextModel> values =
                                          Section2Model.s222.values1;
                                      List<Section2CheckVSModel> values2 =
                                          Section2Model.s222.values2;

                                      // ตรวจสอบว่ามีการเลือกหรือกรอกข้อมูลอย่างน้อยหนึ่งรายการ
                                      bool noSelection = values.every((e) => !e.value) &&
                                          values2.every(
                                              (e) => !e.value! || e.controller!.text.isEmpty);

                                      if (noSelection) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.2.2',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      // รวมค่าที่เลือกใน values1
                                      List<String> selectedValues1 = values
                                          .where((item) => item.value)
                                          .map((item) => item.text)
                                          .toList();

                                      // รวมค่าที่เลือกใน values2 พร้อมข้อความจาก controller (ถ้ามี)
                                      List<String> selectedValues2 = values2
                                          .where((item) =>
                                              item.value! && item.controller!.text.isNotEmpty)
                                          .map((item) => '${item.text} ${item.controller!.text}')
                                          .toList();

                                      // รวมค่าเป็นข้อความเดียว
                                      s222 = [...selectedValues1, ...selectedValues2].join(' > ');

                                      riceField.s22 = s222;
                                      print('2.2.2 : $s222');
                                    } catch (e) {
                                      print('Error: $e');
                                    }

                                    /// 2.2.3
                                    List<Section2ValueTextModel> values223 =
                                        Section2Model.s223.values1;
                                    List<Section2CheckVSModel> values2223 =
                                        Section2Model.s223.values2;

                                    List<String> s223 = [];
                                    bool values223All = values223
                                            .where((e) => e.value == true)
                                            .isEmpty &&
                                        values2223
                                            .where((e) => e.value! && e.controller!.text.isNotEmpty)
                                            .isEmpty;
                                    if (values223All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.2.3',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    for (var item in values223) {
                                      if (item.value) {
                                        s223.add(item.text);
                                      }
                                    }

                                    for (var item in values2223) {
                                      if (item.value!) {
                                        if (item.controller!.text.isEmpty) {
                                          Fluttertoast.showToast(
                                            msg: 'กรุณากรอกข้อมูลในข้อ 2.2.3',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          return;
                                        }
                                        s223.add('${item.text} ${item.controller!.text}');
                                      }
                                    }

                                    riceField.s23 = s223.join('');
                                    print('2.2.3 : ${riceField.s23}'); // 2.2.3

                                    /// 2.2.4
                                    List<String> s224 = [];
                                    List<Section2CheckVSModel> values224 =
                                        Section2Model.s224.values;
                                    bool s224All = values224.where((e) => e.value == true).isEmpty;

                                    if (s224All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.2.4',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    List<Section2CheckVSModel> values224v = Section2Model
                                        .s224.values
                                        .where((e) => e.value == true)
                                        .toList();

                                    for (var item in values224v) {
                                      if (item.value! && item.controller!.text.isNotEmpty) {
                                        s224.add('${item.text} ${item.controller!.text}');
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.2.4',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                    }

                                    riceField.s24 = s224.join('');
                                    print('2.2.4 : ${riceField.s24}'); // 2.2.4

                                    /*String s225 = '';
                                    List<Section2PVSModel> values225 = Section2Model.s225.values;

                                    bool s225All = values225.where((e) => e.controller!.text.isNotEmpty).isEmpty;

                                    if (s225All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.2.5',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    for (var item in values225) {
                                      if (item.controller!.text.isNotEmpty) {
                                        s225 = '${item.controller!.text} ${item.suffix} ';
                                        break;
                                      }
                                    }

                                    riceField.s25 = s225;
                                    print('s25: $s225'); // 2.2.5*/

                                    /// 2.2.5
                                    try {
                                      String s226 = '';
                                      List<Section2ValueTextModel> values1 =
                                          Section2Model.s226.values1;
                                      List<Section2CheckVSModel> values2 =
                                          Section2Model.s226.values2;

                                      // ตรวจสอบว่ามีการเลือกหรือกรอกข้อมูลอย่างน้อยหนึ่งรายการ
                                      bool noSelection = values1.every((item) => !item.value) &&
                                          values2.every((item) =>
                                              !item.value! ||
                                              (item.controller?.text.isEmpty ?? true));

                                      if (noSelection) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.2.5',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      // รวมค่าจาก values1
                                      List<String> selectedValues1 = values1
                                          .where((item) => item.value)
                                          .map((item) => item.text)
                                          .toList();

                                      // รวมค่าจาก values2 พร้อมข้อมูลใน controller (ถ้ามี)
                                      List<String> selectedValues2 =
                                          values2.where((item) => item.value!).map((item) {
                                        String text = item.text!;
                                        if (item.controller != null &&
                                            item.controller!.text.isNotEmpty) {
                                          text += " ${item.controller!.text}";
                                        }
                                        return text;
                                      }).toList();

                                      // รวมค่าเป็นข้อความเดียว
                                      s226 = [...selectedValues1, ...selectedValues2].join(' > ');

                                      riceField.s261 = s226;
                                      print('2.2.6 : $s226 ตัวแปร s261');
                                    } catch (e) {
                                      print('Error: $e');
                                    }

                                    /// 2.3.1
                                    try {
                                      String s231 = '';
                                      List<S221Model> values = Section2Model.s231.values;

                                      // ตรวจสอบว่ามีการเลือกข้อมูลหรือไม่
                                      bool noSelection = values.every((item) => !item.value);

                                      if (noSelection) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.3.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      List<String> selectedTexts = [];

                                      for (var item in values) {
                                        if (item.value) {
                                          selectedTexts.add(item.text);

                                          // ตรวจสอบและรวมค่าจาก values (ปุ๋ยหรือพืชบำรุงดิน)
                                          if (item.values.isNotEmpty) {
                                            List<String> subValues = item.values
                                                .where((subItem) => subItem.value)
                                                .map((subItem) => subItem.text)
                                                .toList();
                                            if (subValues.isNotEmpty) {
                                              selectedTexts.add(subValues.join(', '));
                                            }
                                          }
                                        }
                                      }

                                      // รวมข้อความทั้งหมดเป็นข้อความเดียว
                                      s231 = selectedTexts.join(' > ');

                                      riceField.s31 = s231;
                                      print('2.3.1 : ${riceField.s31} s31');

                                      // TODO Table 2.3.1
                                      List<SoilPreparationStepsModel> s23SoilPreparationSteps =
                                          Section2Model.s23SoilPreparationSteps.values;

                                      if (values[1].value && s23SoilPreparationSteps.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเพิ่มขั้นตอนการเตรียมดิน',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      if (values[0].value) {
                                        riceField.s321 = [];
                                      } else {
                                        riceField.s321 =
                                            s23SoilPreparationSteps.map((e) => e.toJson()).toList();
                                        print('2.3.1 Table : ${riceField.s321} ');
                                      }
                                    } catch (e) {
                                      print('Error: $e');
                                    }

                                    /// 311
                                    /// SoilPreparationStepsModel

                                    /// 2.3.2
                                    try {
                                      String s32 = '';
                                      List<Section2ValueTextModel> values =
                                          Section2Model.s214.values;

                                      // ตรวจสอบว่ามีการเลือกข้อมูลหรือไม่
                                      bool noSelection = values.every((item) => !item.value);

                                      if (noSelection) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.3.2',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      // รวมข้อความจากค่าที่เลือก
                                      List<String> selectedTexts = values
                                          .where((item) => item.value)
                                          .map((item) => item.text)
                                          .toList();

                                      s32 = selectedTexts.join(', ');

                                      riceField.s32 = s32;
                                      print('2.3.2 : $s32 s32');
                                    } catch (e) {
                                      print('Error: $e');
                                    }
                                    try {
                                      String s33 = '';
                                      List<Section2ValueTextModel> begins =
                                          Section2Model.s232.begins;

                                      // ตรวจสอบว่ามีการเลือกข้อมูลหรือไม่
                                      bool noSelection = begins.every((item) => !item.value);

                                      if (noSelection) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.3.3',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      // รวมข้อความจากค่าที่เลือก
                                      List<String> selectedTexts = begins
                                          .where((item) => item.value)
                                          .map((item) => item.text)
                                          .toList();

                                      s33 = selectedTexts.join(', ');

                                      riceField.s33 = s33 + ' เดือน ${Section2Model.s232.month}';
                                      print('2.3.3 : ${riceField.s33} s33');
                                    } catch (e) {
                                      print('Error: $e');
                                    }

                                    List<HowToPlantInTheLastProductionYearsModel>
                                        hS23owToPlantInTheLastProductionYears =
                                        Section2Model.hS23owToPlantInTheLastProductionYears.values;

                                    if (hS23owToPlantInTheLastProductionYears.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg:
                                            '2.3.4 กรุณาเพิ่มขวิธีการปลูกในปีการผลิตที่ผ่านมาท่านทำการปลูกข้าวกี่ครั้ง',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    riceField.s331 = hS23owToPlantInTheLastProductionYears
                                        .map((e) => e.toJson())
                                        .toList();
                                    print('2.3.4 : ${riceField.s331} > s331');

                                    /// 2.4.1

                                    List<Section2ValueTextModel> values241 =
                                        Section2Model.s241.values;
                                    String s241Text = '';
                                    String? s2411Text;
                                    final s241 = Section2Model.s241;
                                    bool s241All = values241.where((e) => e.value == true).isEmpty;

                                    if (s241All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.4.1',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    for (var item in values241) {
                                      if (item.value) {
                                        s241Text = item.text;
                                        break;
                                      }
                                    }

                                    riceField.s41 = s241Text;
                                    print('2.4.1 : ${riceField.s41}  > s41'); // 2.4.1

                                    /// 2.4.2
                                    try {
                                      String s242 = '';
                                      S245 values = Section2Model.s245;
                                      S22453 s24511 = values.s2451.s22453;

                                      // ตรวจสอบว่ามีการเลือกข้อมูลหรือไม่
                                      bool noSelection =
                                          s24511.values.values.every((item) => !item.value!);
                                      if (noSelection) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.4.2',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      // ประมวลผลข้อมูลที่เลือก
                                      for (var item in s24511.values.values) {
                                        if (item.value!) {
                                          if (item.controller != null &&
                                              item.controller!.text.isNotEmpty) {
                                            s242 = '${item.text} ${item.controller!.text}';
                                          } else {
                                            s242 = item.text ?? '';
                                          }
                                          break; // หยุดที่ตัวเลือกแรกที่พบ
                                        }
                                      }

                                      riceField.s42 = s242;
                                      print('2.4.2 : $s242 > s242');
                                    } catch (e) {
                                      print('Error: $e');
                                    }
                                    S245 caseKillWeedsvalues = Section2Model.s245;
                                    S22453 caseKillWeedsD = caseKillWeedsvalues.s2451.s22453;
                                    bool isCaseKillWeeds = caseKillWeedsD.values.values[0].value!;
                                    List<CaseKillWeedsModel> caseKillWeeds =
                                        Section2Model.caseKillWeeds.values;
                                    if (isCaseKillWeeds && caseKillWeeds.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเพิ่มกรณีกำจัดวัชพืช',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    riceField.s45311 =
                                        caseKillWeeds.map((e) => e.toJson()).toList();
                                    print(
                                        '2.4.2 Table กรณีกำจัดวัชพืช : ${riceField.s45311} > s46311'); //

                                    /// 2.4.3

                                    try {
                                      String s243 = '';
                                      List<Section2ValueTextModel> values =
                                          Section2Model.s242.values;

                                      bool isSelectedMixedRice = values[1].value;

                                      // ตรวจสอบการกรอกข้อมูลถ้าเลือก "พบพันธุ์ข้าวปนในแปลง"
                                      if (isSelectedMixedRice) {
                                        if (Section2Model.s242.weedController!.text.isEmpty ||
                                            Section2Model.s242.percentController!.text.isEmpty) {
                                          Fluttertoast.showToast(
                                            msg:
                                                'กรุณากรอกข้อมูลพันธุ์ข้าวปนและเปอร์เซ็นต์ ในข้อ 2.4.3',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          return;
                                        } else {
                                          s243 =
                                              'พบพันธุ์ข้าวปน ${Section2Model.s242.weedController!.text} คิดเป็นร้อยละ (${Section2Model.s242.percentController!.text}) ของพื้นที่';
                                        }
                                      }

                                      // กรณีเลือก "ไม่พบพันธุ์ข้าวปนในแปลง"
                                      for (var item in values) {
                                        if (item.value &&
                                            item.text.contains('ไม่พบพันธุ์ข้าวปนในแปลง')) {
                                          s243 = item.text;
                                          break;
                                        }
                                      }

                                      riceField.s43 = s243;
                                      print('2.4.3 : $s243 > s243');
                                    } catch (e) {
                                      print('Error: $e');
                                    }
                                    // print('s43: ${riceField.s43}');

                                    // 2.4.4
                                    try {
                                      String s244 = '';

                                      // ตรวจสอบคำตอบของคำถามหลัก (กำจัดพันธุ์ข้าวปนในแปลง)
                                      var selectedOption =
                                          Section2Model.s243.datas.firstWhere((item) => item.value);

                                      if (selectedOption != null) {
                                        s244 = selectedOption.text;

                                        // ตรวจสอบและดึงข้อมูลเพิ่มเติมหากเลือก "กำจัดพันธุ์ข้าวปนในแปลง"
                                        if (selectedOption.text == 'กำจัดพันธุ์ข้าวปนในแปลง') {
                                          // ค้นหาวิธีการกำจัดที่เลือก
                                          var selectedMethod = selectedOption.values
                                              .where((method) => method.value == true);
                                          var data =
                                              selectedMethod.map((e) => e.text).toList().join(', ');

                                          if (selectedMethod != null) {
                                            s244 += ' $data';
                                          }
                                        }
                                      }

                                      // บันทึกข้อมูลในตัวแปร riceField.s244
                                      riceField.s44 = s244;
                                      print('2.4.4 : $s244 > s244');
                                    } catch (e) {
                                      print('Error: $e');
                                    }

                                    try {
                                      String s245 = '';

                                      // ตรวจสอบคำตอบของคำถามหลัก (กำจัดพันธุ์ข้าวปนในแปลง)
                                      var selectedOption =
                                          Section2Model.s244.datas.firstWhere((item) => item.value);

                                      if (selectedOption != null) {
                                        s245 = selectedOption.text;

                                        // ตรวจสอบและดึงข้อมูลเพิ่มเติมหากเลือก "กำจัดพันธุ์ข้าวปนในแปลง"
                                        if (selectedOption.text == 'ข้าวเจริญเติบโตไม่เต็มแปลง') {
                                          // ค้นหาวิธีการกำจัดที่เลือก
                                          var selectedMethod = selectedOption.values
                                              .where((method) => method.value == true);
                                          var data =
                                              selectedMethod.map((e) => e.text).toList().join(', ');

                                          if (selectedMethod != null) {
                                            s245 += ' $data';
                                          }
                                        }
                                      }

                                      // บันทึกข้อมูลในตัวแปร riceField.s244
                                      riceField.s45 = s245;
                                      print('2.4.5 : $s245 > s245');
                                    } catch (e) {
                                      print('Error: $e');
                                    }

                                    /// 2.4.6.1
                                    S245 values45 = Section2Model.s245;
                                    S24511 s24511 = values45.s2451.s24511;
                                    List<Section2ValueTextModel> s24511values1 = s24511.values1;
                                    List<Section2CheckVSModel> s24511values2 = s24511.values2;
                                    String s24511Text = '';
                                    String? s24512Text;

                                    bool s24511All =
                                        s24511values1.where((e) => e.value == true).isEmpty;
                                    // print('s24511All: ${s24511values1.map((e) => e.value)}');

                                    bool s24511All2 =
                                        s24511values2.where((e) => e.value! == true).isEmpty;
                                    // print('s24511All: ${s24511values2.map((e) => e.value)}');

                                    if (s24511All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.6.1.1',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    if (s24511values1[0].value) {
                                      s24511Text = s24511values1[0].text;
                                      s24512Text = null;
                                    }

                                    if (s24511values1[1].value) {
                                      s24511Text = '${s24511values1[1].text} > ';
                                      if (s24511All2) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.4.6.1.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      List<String> s24512Texts = [];
                                      for (var item in s24511values2) {
                                        if (item.value!) {
                                          s24512Texts
                                              .add('${item.text} ${item.controller?.text ?? ''},');
                                        }
                                      }
                                      s24511Text += s24512Texts.join('');
                                    }

                                    riceField.s4511 = s24511Text;
                                    //riceField.s4512 = s24512Text;
                                    print('2.4.6.1.1 : ${riceField.s4511} > s4611'); //
                                    //print('2.4.6.1.1 ไม่ให้น้ำ : ${riceField.s4512} > s4611'); //

                                    /// WaterGatheringModel
                                    bool isWaterGiving = s24511.values1[0].value;
                                    List<CaseOfGivingWatersModel> caseOfGivingWaters =
                                        Section2Model.caseOfGivingWaters.values;
                                    if (isWaterGiving && caseOfGivingWaters.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเพิ่มกรณีให้น้ำ',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    } else {
                                      riceField.s513 = null;
                                    }

                                    riceField.s513 =
                                        caseOfGivingWaters.map((e) => e.toJson()).toList();
                                    print(
                                        '2.4.5.1.1 Table กรณีให้น้ำ: ${riceField.s513} > s4612'); //

                                    ///
                                    S245 values4512 = Section2Model.s245;
                                    S24512 s245112 = values4512.s2451.s24512;
                                    List<Section2CheckVSModel> s24512values = s245112.s24521.values;
                                    String s24521Text = '';

                                    bool s24512All =
                                        s24512values.where((e) => e.value == true).isEmpty;

                                    if (s24512All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.6.2.1',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }
                                    if (s24512values[0].value!) {
                                      s24521Text = s24512values[0].text!;
                                    }

                                    if (s24512values[1].value!) {
                                      if (s24512values[1].controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.4.6.2.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      s24521Text =
                                          '${s24512values[1].text} ${s24512values[1].controller?.text ?? ''}';
                                    }
                                    riceField.s4521 = s24521Text;
                                    print('2.4.6.2.1 : ${riceField.s4521} > ss4621'); //

                                    bool isFertilizers = s24512values[0].value!;
                                    List<CaseOfApplyingFertilizersModel> caseOfApplyingFertilizers =
                                        Section2Model.caseOfApplyingFertilizers.values;
                                    if (isFertilizers && caseOfApplyingFertilizers.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเพิ่มกรณีใส่ปุ๋ย',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    riceField.s522 =
                                        caseOfApplyingFertilizers.map((e) => e.toJson()).toList();
                                    print(
                                        '2.4.6.2.1 Table กรณีใส่ปุ๋ย : ${riceField.s522} > s4622'); //

                                    // 2.4.6.3.1
                                    final values4531 = Section2Model.s254532;
                                    final s254531List = values4531.values;
                                    String s24531Text = '';
                                    String case1 = '';
                                    String case2 = '';
                                    const msg = 'กรุณากรอกข้อมูลในข้อ 2.4.6.3.1';

                                    try {
                                      bool isCase1 = s254531List[0].controller!.text.isEmpty;
                                      bool isCase2 = s254531List[1].controller!.text.isEmpty;

                                      print('isCase1: $isCase1');
                                      print('isCase2: $isCase2');

                                      if (isCase1 && isCase2) {
                                        Fluttertoast.showToast(
                                          msg: msg,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      print(
                                          'ตัดใบข้่าว 1 ${s254531List[0].values.map((e) => e.toJson())}');
                                      print(
                                          'ตัดใบข้่าว 1 ${s254531List[0].values.where((e) => e.value == true).isEmpty}');

                                      if (s254531List[0]
                                          .values
                                          .where((e) => e.value == true)
                                          .isNotEmpty) {
                                        case1 =
                                            '${s254531List[0].text} ${s254531List[0].controller?.text} ${s254531List[0].suffix}';
                                        for (var item in s254531List[0].values) {
                                          if (item.value!) {
                                            case1 += '\n${item.text}';
                                          }
                                        }
                                      } else {
                                        case1 = '';
                                      }

                                      print(
                                          'ตัดใบข้่าว 2 ${s254531List[1].values.map((e) => e.toJson())}');
                                      print(
                                          'ตัดใบข้่าว 2 ${s254531List[1].values.where((e) => e.value == true).isEmpty}');

                                      if (s254531List[1]
                                          .values
                                          .where((e) => e.value == true)
                                          .isNotEmpty) {
                                        case2 =
                                            '${s254531List[1].text} ${s254531List[1].controller!.text} ${s254531List[1].suffix}';
                                        for (var item in s254531List[1].values) {
                                          if (item.value!) {
                                            case2 += '\n${item.text}';
                                          }
                                        }
                                      } else {
                                        case2 = '';
                                      }

                                      s24531Text = '$case1\n$case2';

                                      riceField.s4531 = s24531Text;
                                      print('2.4.6.3.1 : ${riceField.s4531} > s4631'); //
                                    } catch (e, t) {
                                      print(e);
                                      print(t);
                                    }

                                    final data = Section2Model.s224541;
                                    final values1 = data.values1;

                                    bool c1 = values1[0]
                                        .values
                                        .where((item) => item.value == true)
                                        .isNotEmpty;
                                    bool c2 = values1[1]
                                        .values
                                        .where((item) => item.value == true)
                                        .isNotEmpty;

                                    String values1Text = '';
                                    String values2Text = '';
                                    String valueText = '';

                                    if (!c1 && !c2) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.5.4.1',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    values1Text = values1[0]
                                            .values
                                            .where((item) => item.value == true)
                                            .isNotEmpty
                                        ? values1[0].text.toString()
                                        : '';

                                    values2Text = values1[1]
                                            .values
                                            .where((item) => item.value == true)
                                            .isNotEmpty
                                        ? values1[1].text.toString()
                                        : '';

                                    valueText = '$values1Text\n$values2Text';
                                    riceField.s4541 = valueText;
                                    print('\n\n');
                                    print('2.4.6.4.1 : ${riceField.s4541} > s4531'); //

                                    /// 2.5
                                    // 2.5.1
                                    final x1 = Section2Model.s251;
                                    List<Section2CheckVSModel> s251values1 = x1.values;
                                    String s251Text = '';
                                    List<String> s251Texts = ['ท่านเก็บเกี่ยวข้าว'];

                                    // วนลูปผ่านแต่ละรายการใน values1
                                    for (var item in s251values1) {
                                      // เช็คว่า controller.text ว่างหรือไม่
                                      if (item.controller?.text.isEmpty ?? true) {
                                        // ถ้า controller.text ว่าง แสดงข้อความเตือน
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.5.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      // รวมข้อความจาก text และ controller.text
                                      s251Texts.add('${item.text} ${item.controller?.text ?? ''}');
                                    }

                                    // รวมข้อความทั้งหมดเข้าด้วยกัน
                                    s251Text = s251Texts.join(' ');
                                    riceField.s51 = s251Text;
                                    print('s51: $s251Text');

                                    // 2.5.2
                                    String result = '';
                                    List<String> resultList = ['การเก็บเกี่ยวข้าว'];

                                    final model = Section2Model.s252;

                                    // ประมวลผล values1
                                    for (var item in model.values1) {
                                      if (!item.value!) {
                                        // ถ้า main item ไม่เลือก
                                        continue;
                                      }

                                      resultList.add('${item.text}'); // เพิ่ม main item ลงใน result

                                      // ตรวจสอบ sub-items ภายใน values1
                                      for (var subItem in item.values) {
                                        if (subItem.value == true) {
                                          resultList.add('${subItem.text}');
                                        }
                                      }
                                    }

                                    // ประมวลผล values2
                                    for (var item in model.values2) {
                                      if (!item.value!) {
                                        // ถ้า main item ใน values2 ไม่เลือก
                                        continue;
                                      }

                                      resultList.add('${item.text}');

                                      // ตรวจสอบ sub-items ภายใน values2
                                      for (var subItem in item.values) {
                                        if (subItem.value == true) {
                                          resultList.add('${subItem.text}');
                                        }
                                      }
                                    }

                                    // ประมวลผล values3
                                    for (var item in model.values3) {
                                      if (item.value! && item.controller?.text == '') {
                                        // ถ้ายังไม่ได้กรอกข้อมูลใน controller
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.5.2',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                      if (item.value! && item.controller?.text != '') {
                                        resultList.add(
                                            '${item.text} ${item.controller?.text ?? ''} ${item.suffix}');
                                      }
                                    }

// รวมข้อความทั้งหมด
                                    result = resultList.join(' ');
                                    riceField.s52A = result;
                                    print('2.5.2: $result > s252');

                                    final s53 = Section2Model.s253;
                                    String s253Text = '';

                                    final s253values1 = s53.values;
                                    bool s253All =
                                        s253values1.where((e) => e.value == true).isEmpty;

                                    if (s253All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.3',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    final currentValues53 =
                                        s253values1.where((e) => e.value == true).first;
                                    final index = s253values1.indexOf(currentValues53);

                                    if (index == 4) {
                                      if (currentValues53.controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.5.3',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                    }

                                    riceField.s53B =
                                        '${currentValues53.text} ${currentValues53.controller?.text ?? ''}';
                                    print('2.5.3: ${riceField.s53B} > s53B');

                                    final s54 = Section2Model.s254;

                                    final s254values1 = s54.values;
                                    bool s254All =
                                        s254values1.where((e) => e.value == true).isEmpty;

                                    if (s254All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.4',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    final currentValues54 =
                                        s254values1.where((e) => e.value == true).first;
                                    final index54 = s254values1.indexOf(currentValues54);

                                    if (index54 == 1) {
                                      if (currentValues54.controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.5.4',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                    }

                                    riceField.s54C =
                                        '${currentValues54.text} ${currentValues54.controller?.text ?? ''}';
                                    print('2.5.4 : ${riceField.s54C} > s54C');

                                    final s55 = Section2Model.s255;
                                    final s255values1 = s55.values;
                                    bool s255All =
                                        s255values1.where((e) => e.value == true).isEmpty;

                                    if (s255All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.5',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    final currentValues55 =
                                        s255values1.where((e) => e.value == true).first;
                                    final index55 = s255values1.indexOf(currentValues55);
                                    riceField.s55D = currentValues55.text!;
                                    riceField.s551D = null;
                                    if (index55 == 1) {
                                      if (s55.sunForCount?.text == '' ||
                                          s55.sunForDay?.text == '' ||
                                          s55.other?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.5.5',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                      riceField.s55D = currentValues55.text!;
                                      riceField.s551D =
                                          '- ตากแดด กลับกองข้าววันละ ${s55.sunForDay?.text} ครั้ง\nตากแดดจำนวน ${s55.sunForCount?.text ?? ''} วัน\n- อื่นๆ ${s55.sunForDay?.text ?? ''} ${s55.other?.text ?? ''}';
                                    }

                                    print('s55D: ${riceField.s55D}');
                                    print('2.5.5 : ${riceField.s551D} > s551D');

                                    final s56 = Section2Model.s256;
                                    final sv1 = s56.values1;
                                    final sv2 = s56.values2;
                                    final sv3 = s56.values3;

                                    bool s56All = sv1.where((e) => e.value == true).isEmpty;

                                    if (s56All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.6',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    final currentValues56 = sv1.where((e) => e.value == true).first;
                                    final index56 = sv1.indexOf(currentValues56);
                                    riceField.s56E = currentValues56.text;

                                    if (index56 == 0) {
                                      bool s56All2 = sv2.where((e) => e.value == true).isEmpty;
                                      if (s56All2) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.6',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      List<String> s56E = [];

                                      for (var item in sv2) {
                                        if (item.value) {
                                          s56E.add('- กรณีขายทั้งหมด ${item.text}');
                                        }
                                      }

                                      riceField.s561E = currentValues56.text;
                                      riceField.s561E = s56E.join('\n');
                                    }
                                    if (index56 == 1) {
                                      bool s56All3 = sv3.where((e) => e.value == true).isEmpty;
                                      if (s56All3) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.6',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      List<String> s56E = [];

                                      for (var item in sv3) {
                                        if (item.value) {
                                          s56E.add('- กรณีเก็บทั้งหมด ${item.text}');
                                        }
                                      }

                                      riceField.s561E = currentValues56.text;
                                      riceField.s561E = s56E.join('\n');
                                    }

                                    if (index56 == 2) {
                                      bool s56All2 = sv2.where((e) => e.value == true).isEmpty;
                                      bool s56All3 = sv3.where((e) => e.value == true).isEmpty;
                                      if (s56All2 || s56All3) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.6',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      List<String> s56E = [];

                                      for (var item in sv2) {
                                        if (item.value) {
                                          s56E.add('- กรณีขายทั้งหมด ${item.text}');
                                        }
                                      }

                                      for (var item in sv3) {
                                        if (item.value) {
                                          s56E.add('- กรณีเก็บทั้งหมด ${item.text}');
                                        }
                                      }

                                      riceField.s561E = currentValues56.text;
                                      riceField.s561E = s56E.join('\n');
                                    }

                                    print('s56E: ${riceField.s56E}');
                                    print('2.5.6 : ${riceField.s561E} > s561E');

                                    final s561 = Section2Model.s260;
                                    final vS561 = s561.values1;
                                    final vS561s = s561.values1s;
                                    final vS562 = s561.values2;

                                    if (!vS561.value && !vS562.value!) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.6',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    if (vS562.value!) {
                                      if (vS562.controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.6.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                      riceField.s61E = vS562.text ?? '';
                                      riceField.s61E =
                                          '${riceField.s61E} ${vS562.controller?.text ?? ''}';
                                    }

                                    bool s561All = vS561s.where((e) => e.value == true).isNotEmpty;

                                    print('vS561.value: ${vS561.value}');
                                    print('s561All: $s561All');
                                    if (vS561.value) {
                                      if (!s561All) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณาเลือกข้อมูลในข้อ 2.6.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      List<String> s561Text = [];
                                      for (var item in vS561s) {
                                        if (item.value) {
                                          s561Text.add(item.text);
                                        }
                                      }
                                      riceField.s61E = '${riceField.s61E} ${s561Text.join('\n')}';
                                    }

                                    print('s61E: ${riceField.s61E}');

                                    Section2DataModel.datas.add(riceField);
                                    state.isSection2Pending = true;
                                    setState(() {});
                                    // Navigator.pop(context, true);
                                  },
                                  child: const CustomText(
                                    text: 'บันทึกข้อมูล',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _build260() {
    final data = Section2Model.s260;
    final values1 = data.values1;
    final values2 = data.values2;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    value: values1.value,
                    onChanged: (v) {
                      setState(() {
                        values2.value = false;
                        data.values1s.forEach((element) {
                          element.value = false;
                        });
                        values1.value = v!;
                      });
                    },
                  ),
                  Expanded(
                    child: CustomText(
                      text: values1.text ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: data.values1s.map(
              (e) {
                return Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            value: e.value,
                            onChanged: !values1.value
                                ? null
                                : (v) {
                                    setState(() {
                                      e.value = v!;
                                    });
                                  },
                          ),
                          Expanded(
                            child: CustomText(
                              text: e.text ?? '',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    value: values2.value,
                    onChanged: (v) {
                      setState(() {
                        values1.value = false;
                        data.values1s.forEach((element) {
                          element.value = false;
                        });
                        values2.value = v!;
                      });
                    },
                  ),
                  Expanded(
                    child: CustomText(
                      text: values2.text ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildTextFieldWidget(
                controller: values2.controller,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                enabled: values2.value,
                validator: (value) {
                  if (values2.value! && value!.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _build256() {
    final data = Section2Model.s256;
    return Column(
      children: [
        ...data.values1.map(
          (e) {
            return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      value: e.value,
                      onChanged: (v) {
                        setState(() {
                          data.values1.forEach((element) {
                            element.value = false;
                          });
                          data.values2.forEach((element) {
                            element.value = false;
                          });
                          data.values3.forEach((element) {
                            element.value = false;
                          });
                          e.value = v!;
                        });
                      },
                    ),
                    CustomText(
                      text: e.text ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ],
            );
          },
        ).toList(),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: '- กรณีขายทั้งหมด',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.start,
              ),
              ...data.values2.map(
                (e) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            value: e.value,
                            onChanged: data.values1[1].value
                                ? null
                                : (v) {
                                    setState(() {
                                      data.values2.forEach((element) {
                                        element.value = false;
                                      });
                                      e.value = v!;
                                    });
                                  },
                          ),
                          CustomText(
                            text: e.text ?? '',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ).toList(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: '- กรณีเก็บทั้งหมด',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.start,
              ),
              ...data.values3.map(
                (e) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            value: e.value,
                            onChanged: data.values1[0].value
                                ? null
                                : (v) {
                                    setState(() {
                                      data.values3.forEach((element) {
                                        element.value = false;
                                      });
                                      e.value = v!;
                                    });
                                  },
                          ),
                          CustomText(
                            text: e.text ?? '',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _build255() {
    final data = Section2Model.s255;
    return Column(
      children: [
        ...data.values.map(
          (e) {
            return Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            data.values.forEach((element) {
                              element.value = false;
                            });
                            e.controller?.clear();

                            e.value = v!;
                          });
                        },
                      ),
                      Expanded(
                        child: CustomText(
                          text: e.text ?? '',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList(),
        Row(
          children: [
            const Expanded(
              child: CustomText(
                text: '- ตากแดด กลับกองข้าววันละ',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
            ),
            Expanded(
              child: _buildTextFieldWidget(
                controller: data.sunForDay,
                keyboardType: TextInputType.number,
                enabled: data.values.last.value,
                validator: (value) {
                  if (data.values.last.value! && value!.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const CustomText(
              text: 'ครั้ง',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
        Row(
          children: [
            const CustomText(
              text: 'ตากแดดจำนวน',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: _buildTextFieldWidget(
                controller: data.sunForCount,
                keyboardType: TextInputType.number,
                enabled: data.values.last.value,
                validator: (value) {
                  if (data.values.last.value! && value!.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const CustomText(
              text: 'วัน',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
        Row(
          children: [
            const CustomText(
              text: '- อื่นๆ',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: _buildTextFieldWidget(
                controller: data.other,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.text,
                enabled: data.values.last.value,
                validator: (value) {
                  if (data.values.last.value! && value!.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _build254() {
    final data = Section2Model.s254;
    return Column(
      children: [
        ...data.values.map(
          (e) {
            return Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            data.values.forEach((element) {
                              element.value = false;
                            });
                            e.controller?.clear();

                            e.value = v!;
                          });
                        },
                      ),
                      Expanded(
                        child: CustomText(
                          text: e.text ?? '',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: e.controller != null,
                  child: Expanded(
                    child: _buildTextFieldWidget(
                      controller: e.controller,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      enabled: e.value!,
                      validator: (value) {
                        if (e.value! && value!.isEmpty) {
                          return 'กรุณากรอกข้อมูล';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ],
    );
  }

  Widget _build251() {
    final data = Section2Model.s251;
    return Column(
      children: [
        ...data.values.map(
          (e) {
            return Column(
              children: [
                Row(
                  children: [
                    CustomText(
                      text: e.text ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextFieldWidget(
                        controller: e.controller,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CustomText(
                      text: e.suffix ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ],
            );
          },
        ).toList(),
      ],
    );
  }

  Widget _build252() {
    final data = Section2Model.s252;
    return Column(
      children: [
        ...data.values1.map(
          (e) {
            return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      value: e.value,
                      onChanged: (v) {
                        setState(() {
                          data.values1.forEach((element) {
                            element.value = false;
                            element.values.forEach((element) {
                              element.value = false;
                            });
                          });
                          e.controller?.clear();

                          e.value = v!;
                        });
                      },
                    ),
                    CustomText(
                      text: e.text ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      ...e.values.map(
                        (ev) {
                          return Row(
                            children: [
                              Checkbox(
                                value: ev.value,
                                onChanged: !e.value!
                                    ? null
                                    : (v) {
                                        setState(() {
                                          ev.value = v!;
                                        });
                                      },
                              ),
                              CustomText(
                                text: ev.text ?? '',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(width: 10),
                            ],
                          );
                        },
                      ).toList(),
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...data.values2.map(
              (e) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          value: e.value,
                          onChanged: (v) {
                            setState(() {
                              data.values2.forEach((element) {
                                element.value = false;
                                element.values.forEach((e) {
                                  e.value = false;
                                  e.values.forEach((e) {
                                    e.value = false;
                                  });
                                });
                              });
                              e.value = v!;
                            });
                          },
                        ),
                        CustomText(
                          text: e.text ?? '',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        children: [
                          ...e.values.map(
                            (ev) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        value: ev.value,
                                        onChanged: !e.value!
                                            ? null
                                            : (v) {
                                                setState(() {
                                                  ev.values.forEach((element) {
                                                    element.value = false;
                                                    element.controller?.clear();
                                                    element.values.forEach((e) {
                                                      e.value = false;
                                                    });
                                                  });

                                                  ev.value = !ev.value!;
                                                });
                                              },
                                      ),
                                      CustomText(
                                        text: ev.text ?? '',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                      ),
                                      const SizedBox(width: 10),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                  Visibility(
                                    visible: ev.controller != null,
                                    child: _buildTextFieldWidget(
                                      controller: ev.controller,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.text,
                                      enabled: ev.value,
                                      validator: (value) {
                                        if (ev.value! && value!.isEmpty) {
                                          return 'กรุณากรอกข้อมูล';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Column(
                                      children: [
                                        ...ev.values.map(
                                          (e) {
                                            return Row(
                                              children: [
                                                Checkbox(
                                                  value: e.value,
                                                  onChanged: !ev.value!
                                                      ? null
                                                      : (v) {
                                                          setState(() {
                                                            e.value = v!;
                                                          });
                                                        },
                                                ),
                                                CustomText(
                                                  text: e.text ?? '',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.visible,
                                                ),
                                              ],
                                            );
                                          },
                                        ).toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: data.values3.map(
              (e) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: e.value,
                          onChanged: (v) {
                            setState(() {
                              e.value = v!;
                            });
                          },
                        ),
                        CustomText(
                          text: e.text ?? '',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(width: 10),
                        Visibility(
                          visible: e.controller != null,
                          child: Expanded(
                            child: _buildTextFieldWidget(
                              controller: e.controller,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (e.value! && value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CustomText(
                          text: e.suffix ?? '',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _build253() {
    final data = Section2Model.s253;
    return Column(
      children: [
        ...data.values.map(
          (e) {
            return Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            data.values.forEach((element) {
                              element.value = false;
                            });
                            e.controller?.clear();

                            e.value = v!;
                          });
                        },
                      ),
                      Expanded(
                        child: CustomText(
                          text: e.text ?? '',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: e.controller != null,
                  child: Expanded(
                    flex: 2,
                    child: _buildTextFieldWidget(
                      controller: e.controller,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      enabled: e.value!,
                      validator: (value) {
                        if (e.value! && value!.isEmpty) {
                          return 'กรุณากรอกข้อมูล';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ],
    );
  }

  Widget _build24542() {
    final data = Section2Model.s224542;
    final values1 = data.values1;
    final values2 = data.values2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...values1.map(
          (e) {
            return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      value: e.value,
                      onChanged: (v) {
                        setState(() {
                          values1.forEach((element) {
                            element.value = false;
                          });
                          values2.forEach((element) {
                            element.value = false;
                            element.controller?.clear();
                          });
                          e.controller?.clear();

                          e.value = v!;
                        });
                      },
                    ),
                    CustomText(
                      text: e.text ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ],
            );
          },
        ).toList(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'แมลงศัตรูข้าวที่พบได้แก่ อะไรบ้าง',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.start,
              ),
              ...values2.map(
                (e) {
                  return Column(
                    children: [
                      Visibility(
                        visible: values2.indexOf(e) != values2.length - 1,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    value: e.value,
                                    onChanged: (v) {
                                      setState(() {
                                        e.value = v!;
                                      });
                                    },
                                  ),
                                  CustomText(
                                    text: e.text ?? '',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: _buildTextFieldWidget(
                                controller: e.controller,
                                enabled: e.value!,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: values2.indexOf(e) == values2.length - 1,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: e.text ?? '',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                            ),
                            _buildTextFieldWidget(
                              minLines: 5,
                              controller: e.controller,
                              enabled: values2.any((element) => element.value!),
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _build24541() {
    final data = Section2Model.s224541;
    final values1 = data.values1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: '2.4.5.4.1 ',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 10,
        ),
        ...values1.map(
          (e) {
            return Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      /*Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            values1.forEach((element) {
                              element.value = false;
                            });
                            e.value = v!;
                          });
                        },
                      ),*/
                      CustomText(
                        text: e.text ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        ...e.values.map(
                          (em) {
                            return Row(
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  value: em.value,
                                  onChanged: (v) {
                                    setState(() {
                                      e.values.forEach((element) {
                                        element.value = false;
                                      });

                                      em.value = v!;
                                    });
                                  },
                                ),
                                CustomText(
                                  text: em.text ?? '',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ],
    );
  }

  Widget _build2254() {
    final values = Section2Model.s254532.values;
    return Column(
      children: [
        ...values.map(
          (e) {
            return Column(
              children: [
                Row(
                  children: [
                    CustomText(
                      text: e.text ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildTextFieldWidget(
                        controller: e.controller,
                        //enabled: e.value!,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            if (e.controller!.text.isEmpty) {
                              e.values.forEach((element) {
                                element.value = false;
                              });
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    CustomText(
                      text: e.suffix ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      ...e.values.map(
                        (em) {
                          return Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                value: em.value,
                                onChanged: e.controller!.text.isEmpty
                                    ? null
                                    : (v) {
                                        setState(() {
                                          em.value = v!;
                                        });
                                      },
                              ),
                              CustomText(
                                text: em.text ?? '',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.visible,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Visibility(
                                  visible: em.controller != null,
                                  child: _buildTextFieldWidget(
                                    controller: em.controller,
                                    enabled: em.value! && e.controller!.text.isNotEmpty,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                    ],
                  ),
                )
              ],
            );
          },
        ).toList(),
      ],
    );
  }

  TextEditingController reasonDecision = TextEditingController();
  TextEditingController objective = TextEditingController();
  TextEditingController solution = TextEditingController();
  TextEditingController toolSource = TextEditingController();
  TextEditingController chemicalName = TextEditingController();

  final _keyCaseKillWeeds = GlobalKey<FormState>();

  Widget _buildCaseKillWeedsWidget(BuildContext context) {
    List<CaseKillWeedsModel> values = Section2Model.caseKillWeeds.values;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color(0xff194902),
                child: const CustomText(
                  text: 'เพิ่ม',
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    reasonDecision.clear();
                    objective.clear();
                    solution.clear();
                    toolSource.clear();
                    chemicalName.clear();
                  });
                  _addCaseKillWeedsModal(context: context);
                },
              ),
              const SizedBox(width: 10),
              const CustomText(
                text: 'กรุณาเพิ่มการกำจัดวัชพืช',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          values.isNotEmpty
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
                          //
                          label: Text(''),
                        ),
                        DataColumn(
                          label: Text('ครั้งที่'),
                        ),
                        DataColumn(
                          label: Text('เหตุผลตัดสินใจเริ่มการกำจัด'),
                        ),
                        DataColumn(
                          label: Text('วัตถุประสงค์ (คุม,ฆ่า)'),
                        ),
                        DataColumn(
                          label: Text('วิธีการ/เครื่องมือ'),
                        ),
                        DataColumn(
                          label: Text('แหล่งที่มาของเครื่องมือ'),
                        ),
                        DataColumn(
                          label: Text('ชื่อสารเคมี,ยี่ห้อ'),
                        ),
                      ],
                      rows: List.generate(
                        values.length,
                        (index) {
                          final was = values[index];
                          return DataRow(cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  values.removeAt(index);
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
                                text: was.reasonDecision,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.objective,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.solution,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.toolSource,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.chemicalName,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ]);
                        },
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void _addCaseKillWeedsModal({
    required BuildContext context,
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
          return StatefulBuilder(builder: (ctx, s) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                // height: 600,
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _keyCaseKillWeeds,
                    child: ListView(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: 'เพิ่มการกำจัดวัชพืช',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff194902),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'เหตุผลตัดสินใจเริ่มการกำจัด',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              controller: reasonDecision,
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseKillWeeds.currentState?.validate();
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'วัตถุประสงค์ (คุม,ฆ่า)',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: objective,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseKillWeeds.currentState?.validate();
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'วิธีการ/เครื่องมือ',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: solution,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseKillWeeds.currentState?.validate();
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'แหล่งที่มาของเครื่องมือ',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: toolSource,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseKillWeeds.currentState?.validate();
                                setState(() {});
                              },
                            ),

                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'ชื่อสารเคมี,ยี่ห้อ',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),

                            const SizedBox(height: 10),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: chemicalName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseKillWeeds.currentState?.validate();
                                setState(() {});
                              },
                            ),

                            const SizedBox(height: 29),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CupertinoButton(
                                    color: const Color(0xff194902),
                                    child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                                    onPressed: () {
                                      if (_keyCaseKillWeeds.currentState!.validate()) {
                                        Section2Model.caseKillWeeds.values.add(
                                          CaseKillWeedsModel(
                                            reasonDecision: reasonDecision.text,
                                            objective: objective.text,
                                            solution: solution.text,
                                            toolSource: toolSource.text,
                                            chemicalName: chemicalName.text,
                                          ),
                                        );
                                        setState(() {});

                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 10),
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  TextEditingController dmy = TextEditingController();
  TextEditingController decisionStart = TextEditingController();
  TextEditingController waterSource = TextEditingController();
  TextEditingController howToGiveWater = TextEditingController();
  TextEditingController waterAmount = TextEditingController();
  TextEditingController decisionStop = TextEditingController();
  TextEditingController totalWater = TextEditingController();
  final _keyHowToGivingWater = GlobalKey<FormState>();

  Widget _buildHowToGivingWaterWidget(BuildContext context) {
    List<CaseOfGivingWatersModel> values = Section2Model.caseOfGivingWaters.values;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color(0xff194902),
                child: const CustomText(
                  text: 'เพิ่ม',
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {});
                  _addHowToGivingWaterModal(context: context);
                },
              ),
              const SizedBox(width: 10),
              const CustomText(
                text: 'กรุณาเพิ่มการให้น้ำ',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          values.isNotEmpty
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
                          label: Text(''),
                        ),
                        DataColumn(
                          label: Text('ครั้งที่'),
                        ),
                        DataColumn(
                          label: Text('ว/ด/ป ที่ให้น้ำ (ต้น,กลาง ,ปลาย)'),
                        ),
                        DataColumn(
                          label: Text('การตัดสินใจ'),
                        ),
                        DataColumn(
                          label: Text('แหล่งน้ำ'),
                        ),
                        DataColumn(
                          label: Text('วิธีการการให้น้ำ'),
                        ),
                        DataColumn(
                          label: Text('ปริมาณ (วัน/ชั่วโมง)'),
                        ),
                        DataColumn(
                          label: Text('การตัดสินใจหยุด'),
                        ),
                        DataColumn(
                          label: Text('น้ำเพียงพอหรือไม่ อย่างไร'),
                        ),
                      ],
                      rows: List.generate(
                        values.length,
                        (index) {
                          final was = values[index];
                          return DataRow(cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  values.removeAt(index);
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
                              CustomText(text: was.dmy, fontSize: 16, color: Colors.black),
                            ),
                            DataCell(
                              CustomText(
                                text: was.decisionStart,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.waterSource,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.howToGiveWater,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.waterAmount,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.decisionStop,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.totalWater,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ]);
                        },
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void _addHowToGivingWaterModal({
    required BuildContext context,
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
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              // height: 600,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _keyHowToGivingWater,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: 'เพิ่มการให้น้ำ',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff194902),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ว/ด/ป ที่ให้น้ำ (ต้น,กลาง ,ปลาย)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            controller: dmy,
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowToGivingWater.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'การตัดสินใจ',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: decisionStart,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowToGivingWater.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'แหล่งน้ำ',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: waterSource,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowToGivingWater.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'วิธีการการให้น้ำ',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: howToGiveWater,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowToGivingWater.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ปริมาณ (วัน/ชั่วโมง)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: waterAmount,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowToGivingWater.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'การตัดสินใจหยุด',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: decisionStop,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowToGivingWater.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'น้ำเพียงพอ หรือไม่ อย่างไร',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: totalWater,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowToGivingWater.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 29),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CupertinoButton(
                                  color: const Color(0xff194902),
                                  child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                                  onPressed: () {
                                    if (_keyHowToGivingWater.currentState!.validate()) {
                                      Section2Model.caseOfGivingWaters.values.add(
                                        CaseOfGivingWatersModel(
                                          dmy: dmy.text,
                                          decisionStart: decisionStart.text,
                                          waterSource: waterSource.text,
                                          howToGiveWater: howToGiveWater.text,
                                          waterAmount: waterAmount.text,
                                          decisionStop: decisionStop.text,
                                          totalWater: totalWater.text,
                                        ),
                                      );
                                      setState(() {});

                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                const SizedBox(width: 10),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  TextEditingController timeToApply = TextEditingController();
  TextEditingController decision = TextEditingController();
  TextEditingController riceAge = TextEditingController();
  String fertilizerType = '';
  String timeToFertilizer = '';
  String decisionToFertilizer = '';
  TextEditingController formula1 = TextEditingController();
  TextEditingController formula2 = TextEditingController();
  TextEditingController formula3 = TextEditingController();
  TextEditingController amountToApply = TextEditingController();
  String howToUseFertilizer = '';
  TextEditingController fertilizerSource = TextEditingController();

  final _keyCaseOfApplyingFertilizers = GlobalKey<FormState>();

  Widget _buildCaseOfApplyingFertilizersWidget(BuildContext context) {
    List<CaseOfApplyingFertilizersModel> values = Section2Model.caseOfApplyingFertilizers.values;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color(0xff194902),
                child: const CustomText(
                  text: 'เพิ่ม',
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    timeToFertilizer = '';
                    decisionToFertilizer = '';
                    riceAge.clear();
                    fertilizerType = '';
                    formula1.clear();
                    formula2.clear();
                    formula3.clear();
                    amountToApply.clear();
                    howToUseFertilizer = '';
                    fertilizerSource.clear();
                    howToGiveWater.clear();
                    TimeToFertilizer.datas.forEach((element) {
                      element.value = false;
                    });
                    DecisionToApplyFertilizer.datas.forEach((element) {
                      element.value = false;
                    });
                  });

                  _addCaseOfApplyingFertilizersModal(context: context);
                },
              ),
              const SizedBox(width: 10),
              const CustomText(
                text: 'กรุณาเพิ่มการใส่ปุ๋ย',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          values.isNotEmpty
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
                          label: Text(''),
                        ),
                        DataColumn(
                          label: Text('ครั้งที่'),
                        ),
                        DataColumn(
                          label: Text('ช่วงเวลาที่ใส่ปุ๋ย'),
                        ),
                        DataColumn(
                          label: Text('ปัจจัยต่อการตัดสินใจใส่ปุ๋ย'),
                        ),
                        DataColumn(
                          label: Text('อายุข้าว (เดือน)'),
                        ),
                        DataColumn(
                          label: Text('ชนิดของปุ๋ย'),
                        ),
                        DataColumn(
                          label: Text('สูตรปุ๋ย'),
                        ),
                        DataColumn(
                          label: Text('ปริมาณที่ใส่ (กก./ไร่)'),
                        ),
                        DataColumn(
                          label: Text('วิธีการใส่ปุ๋ย'),
                        ),
                        DataColumn(
                          label: Text('แหล่งปุ๋ยที่มาของปุ๋ย'),
                        ),
                      ],
                      rows: List.generate(
                        values.length,
                        (index) {
                          final was = values[index];
                          return DataRow(cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  values.removeAt(index);
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
                              CustomText(text: was.timeToApply, fontSize: 16, color: Colors.black),
                            ),
                            DataCell(
                              CustomText(
                                text: was.decision,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.riceAge,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.fertilizerType,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.formula,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.amountToApply,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.howToUseFertilizer,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.fertilizerSource,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ]);
                        },
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void _addCaseOfApplyingFertilizersModal({
    required BuildContext context,
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
          return StatefulBuilder(builder: (ctx, s) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                // height: 600,
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _keyCaseOfApplyingFertilizers,
                    child: ListView(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text: 'เพิ่มการใส่ปุ๋ย',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff194902),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'ช่วงเวลาที่ใส่ปุ๋ย',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ...TimeToFertilizer.datas.map((e) {
                              return Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    value: e.value,
                                    onChanged: (v) {
                                      setState(() {
                                        TimeToFertilizer.datas.forEach((element) {
                                          element.value = false;
                                        });
                                        e.value = v!;
                                        timeToFertilizer = e.title;
                                      });
                                      s(() {});
                                    },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: e.title ?? '',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'ปัจจัยต่อการตัดสินใจใส่ปุ๋ย',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ...DecisionToApplyFertilizer.datas.map((e) {
                              return Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    value: e.value,
                                    onChanged: (v) {
                                      setState(() {
                                        DecisionToApplyFertilizer.datas.forEach((element) {
                                          element.value = false;
                                        });
                                        e.value = v!;
                                        decisionToFertilizer = e.title;
                                      });
                                      s(() {});
                                    },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: e.title ?? '',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'อายุข้าว (เดือน)',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: riceAge,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseOfApplyingFertilizers.currentState?.validate();
                                setState(() {});
                              },
                            ),
                            /*const SizedBox(height: 10),
                            const CustomText(
                              text: 'วิธีการการให้น้ำ',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: howToGiveWater,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseOfApplyingFertilizers.currentState?.validate();
                                setState(() {});
                              },
                            ),*/
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'ชนิดของปุ๋ย',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ...HowToUseFertilizer.datas.map((e) {
                              return Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    value: e.value,
                                    onChanged: (v) {
                                      setState(() {
                                        HowToUseFertilizer.datas.forEach((element) {
                                          element.value = false;
                                        });
                                        e.value = v!;
                                        fertilizerType = e.title;
                                      });
                                      s(() {});
                                    },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: e.title ?? '',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            // dropdown
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'สูตรปุ๋ย',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),

                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextFieldWidget(
                                    textAlign: TextAlign.start,
                                    controller: formula1,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'กรุณากรอกข้อมูล';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      _keyCaseOfApplyingFertilizers.currentState?.validate();
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '-',
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  child: _buildTextFieldWidget(
                                    textAlign: TextAlign.start,
                                    controller: formula2,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'กรุณากรอกข้อมูล';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      _keyCaseOfApplyingFertilizers.currentState?.validate();
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '-',
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  child: _buildTextFieldWidget(
                                    textAlign: TextAlign.start,
                                    controller: formula3,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'กรุณากรอกข้อมูล';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      _keyCaseOfApplyingFertilizers.currentState?.validate();
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'ปริมาณที่ใส่ (กก./ไร่)',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: amountToApply,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseOfApplyingFertilizers.currentState?.validate();
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 10),
                            // dropdown

                            const CustomText(
                              text: 'วิธีการใส่ปุ๋ย',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            ...Fertilizer.datas.map((e) {
                              return Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    value: e.value,
                                    onChanged: (v) {
                                      setState(() {
                                        Fertilizer.datas.forEach((element) {
                                          element.value = false;
                                        });
                                        e.value = v!;
                                        howToUseFertilizer = e.title;
                                      });
                                      s(() {});
                                    },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: e.title ?? '',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'แหล่งปุ๋ยที่มาของปุ๋ย (ธกส,เขต,ซื้อเอง)',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: fertilizerSource,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'กรุณากรอกข้อมูล';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                _keyCaseOfApplyingFertilizers.currentState?.validate();
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 29),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CupertinoButton(
                                    color: const Color(0xff194902),
                                    child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                                    onPressed: () {
                                      if (_keyCaseOfApplyingFertilizers.currentState!.validate() &&
                                          fertilizerType.isNotEmpty &&
                                          howToUseFertilizer.isNotEmpty &&
                                          timeToFertilizer.isNotEmpty &&
                                          decisionToFertilizer.isNotEmpty &&
                                          formula1.text.isNotEmpty &&
                                          formula2.text.isNotEmpty &&
                                          formula3.text.isNotEmpty) {
                                        Section2Model.caseOfApplyingFertilizers.values.add(
                                          CaseOfApplyingFertilizersModel(
                                            timeToApply: timeToFertilizer,
                                            decision: decisionToFertilizer,
                                            riceAge: riceAge.text,
                                            fertilizerType: fertilizerType,
                                            formula:
                                                '${formula1.text}-${formula2.text}-${formula3.text}',
                                            amountToApply: amountToApply.text,
                                            howToUseFertilizer: howToUseFertilizer,
                                            fertilizerSource: fertilizerSource.text,
                                          ),
                                        );
                                        setState(() {});

                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                  const SizedBox(width: 10),
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        }).whenComplete(() {
      HowToUseFertilizer.datas.forEach((element) {
        element.value = false;
      });
      Fertilizer.datas.forEach((element) {
        element.value = false;
      });
      setState(() {});
    });
  }

  Widget _build245() {
    S245 values = Section2Model.s245;
    S24511 s24511 = values.s2451.s24511;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: values.s2451.question,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
        ),
        CustomText(
          text: values.s2451.s24511.question,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
        ),
        Column(
          children: [
            ...s24511.values1
                .map(
                  (e) => Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            s24511.values2.forEach((element) {
                              element.value = false;
                              element.controller?.clear();
                            });

                            s24511.values1.forEach((element) {
                              element.value = false;
                            });
                            e.value = v!;
                          });
                        },
                      ),
                      Expanded(
                        child: CustomText(
                          text: e.text ?? '',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ...s24511.values2
                      .map(
                        (e) => Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  value: e.value,
                                  onChanged: s24511.values1[0].value
                                      ? null
                                      : (v) {
                                          setState(() {
                                            e.value = v!;
                                          });
                                        },
                                ),
                                Expanded(
                                  child: CustomText(
                                    text: e.text ?? '',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: e.controller != null,
                              child: _buildTextFieldWidget(
                                textAlign: TextAlign.start,
                                enabled: e.value,
                                controller: e.controller,
                                validator: (value) {
                                  if (e.value! && value!.isEmpty) {
                                    return 'กรุณากรอกข้อมูล';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _build24531() {
    S245 values = Section2Model.s245;
    S22453 s24511 = values.s2451.s22453;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ...s24511.values.values
                .map(
                  (e) => Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            value: e.value,
                            onChanged: (v) {
                              setState(() {
                                s24511.values.values.forEach((element) {
                                  element.value = false;
                                  element.controller?.clear();
                                });

                                e.value = v!;
                              });
                            },
                          ),
                          Expanded(
                            child: CustomText(
                              text: e.text ?? '',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: e.controller != null,
                        child: _buildTextFieldWidget(
                          textAlign: TextAlign.start,
                          enabled: e.value,
                          controller: e.controller,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }

  Widget _build24521() {
    S245 values = Section2Model.s245;
    S24512 s24511 = values.s2451.s24512;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: s24511.s24521.question,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
        ),
        Column(
          children: [
            ...s24511.s24521.values
                .map(
                  (e) => Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            value: e.value,
                            onChanged: (v) {
                              setState(() {
                                s24511.s24521.values.forEach((element) {
                                  element.value = false;
                                  element.controller?.clear();
                                });

                                e.value = v!;
                              });
                            },
                          ),
                          Expanded(
                            child: CustomText(
                              text: e.text ?? '',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: e.controller != null,
                        child: _buildTextFieldWidget(
                          textAlign: TextAlign.start,
                          enabled: e.value,
                          controller: e.controller,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }

  final TextEditingController _howToController = TextEditingController();
  final TextEditingController _timeRangeController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _caseController = TextEditingController();
  final TextEditingController _machineController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  final _keyHowPlat = GlobalKey<FormState>();

  Widget _buildHS23owToPlantInTheLastProductionYearsWidget(BuildContext context) {
    List<HowToPlantInTheLastProductionYearsModel> values =
        Section2Model.hS23owToPlantInTheLastProductionYears.values;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color(0xff194902),
                child: const CustomText(
                  text: 'เพิ่ม',
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _howToController.clear();
                    _timeRangeController.clear();
                    _monthController.clear();
                    _caseController.clear();
                    _machineController.clear();
                    _problemController.clear();
                  });
                  _addHS23owToPlantInTheLastProductionYearsModal(context: context);
                },
              ),
              const SizedBox(width: 10),
              const CustomText(
                text: 'กรุณาเพิ่มการปลูกข้าว',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          values.isNotEmpty
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
                          label: Text(''),
                        ),
                        DataColumn(
                          label: Text('ครั้งที่'),
                        ),
                        DataColumn(
                          label: Text('วิธีการปลูก (ดำ,หว่านแห้ง)'),
                        ),
                        DataColumn(
                          label: Text('ช่วงเวลา (ต้น,กลาง,ปลาย)'),
                        ),
                        DataColumn(
                          label: Text('เดือน'),
                        ),
                        DataColumn(
                          label: Text('สาเหตุปลูกช่วงดังกล่าว'),
                        ),
                        DataColumn(
                          label: Text('แหล่งเครื่องจักรกล'),
                        ),
                        DataColumn(
                          label: Text('ปัญหา/อุปสรรค'),
                        ),
                      ],
                      rows: List.generate(
                        values.length,
                        (index) {
                          final was = values[index];
                          return DataRow(cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  values.removeAt(index);
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
                              CustomText(text: was.howTo, fontSize: 16, color: Colors.black),
                            ),
                            DataCell(
                              CustomText(
                                text: was.timeRange,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.month,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(CustomText(
                                text: was.cause ?? '', fontSize: 16, color: Colors.black)),
                            DataCell(CustomText(
                                text: was.machine ?? '', fontSize: 16, color: Colors.black)),
                            DataCell(CustomText(
                                text: was.problemAndObstacle ?? '',
                                fontSize: 16,
                                color: Colors.black)),
                          ]);
                        },
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void _addHS23owToPlantInTheLastProductionYearsModal({
    required BuildContext context,
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
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              // height: 600,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _keyHowPlat,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: 'เพิ่มการปลูกข้าว',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff194902),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'วิธีการปลูก (ดำ,หว่านแห้ง)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            controller: _howToController,
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowPlat.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ช่วงเวลา (ต้น,กลาง,ปลาย)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: _timeRangeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowPlat.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'เดือน',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: _monthController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowPlat.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'สาเหตุปลูกช่วง ดังกล่าว',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: _caseController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowPlat.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'แหล่งเครื่องจักรกล',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: _machineController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowPlat.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ปัญหา/อุปสรรค',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: _problemController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keyHowPlat.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 29),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CupertinoButton(
                                  color: const Color(0xff194902),
                                  child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                                  onPressed: () {
                                    if (_keyHowPlat.currentState!.validate()) {
                                      Section2Model.hS23owToPlantInTheLastProductionYears.values
                                          .add(
                                        HowToPlantInTheLastProductionYearsModel(
                                          howTo: _howToController.text,
                                          timeRange: _timeRangeController.text,
                                          month: _monthController.text,
                                          cause: _caseController.text,
                                          machine: _machineController.text,
                                          problemAndObstacle: _problemController.text,
                                        ),
                                      );
                                      setState(() {});

                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                const SizedBox(width: 10),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _build244() {
    List<S221Model> values = Section2Model.s244.datas;
    return Column(
      children: [
        ...values
            .map(
              (e) => Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            values.forEach((element) {
                              element.value = false;
                              element.values.forEach((element) {
                                element.value = false;
                              });
                            });
                            e.value = v!;
                          });
                        },
                      ),
                      Expanded(
                        child: CustomText(
                          text: e.text ?? '',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        ...e.values
                            .map(
                              (em) => Row(
                                children: [
                                  Checkbox(
                                    value: em.value,
                                    onChanged: !e.value
                                        ? null
                                        : (v) {
                                            setState(() {
                                              em.value = v!;
                                            });
                                          },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: em.text ?? '',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _build243() {
    List<S221Model> values = Section2Model.s243.datas;

    return Column(
      children: [
        ...values
            .map(
              (e) => Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            values.forEach((element) {
                              element.value = false;
                              element.values.forEach((element) {
                                element.value = false;
                              });
                            });
                            e.value = v!;
                          });
                        },
                      ),
                      Expanded(
                        child: CustomText(
                          text: e.text ?? '',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        ...e.values
                            .map(
                              (em) => Row(
                                children: [
                                  Checkbox(
                                    value: em.value,
                                    onChanged: !e.value
                                        ? null
                                        : (v) {
                                            setState(() {
                                              em.value = v!;
                                            });
                                          },
                                  ),
                                  Expanded(
                                    child: CustomText(
                                      text: em.text ?? '',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _build242() {
    List<Section2ValueTextModel> values = Section2Model.s242.values;
    final s241 = Section2Model.s242;

    bool isSelected = values[1].value;
    return Column(
      children: [
        ...values
            .map(
              (e) => Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    value: e.value,
                    onChanged: (v) {
                      setState(() {
                        values.forEach((element) {
                          element.value = false;
                        });
                        e.value = v!;
                        s241.weedController?.clear();
                        s241.percentController?.clear();
                      });
                    },
                  ),
                  Expanded(
                    child: CustomText(
                      text: e.text ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: CustomText(
                      text: 'คือ',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: _buildTextFieldWidget(
                      textAlign: TextAlign.start,
                      enabled: isSelected,
                      controller: s241.weedController,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const CustomText(
                    text: 'คิดเป็นร้อยละ',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextFieldWidget(
                      textAlign: TextAlign.start,
                      enabled: isSelected,
                      controller: s241.percentController,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CustomText(
                    text: 'ของพื้นที่',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _build241() {
    List<Section2ValueTextModel> values = Section2Model.s241.values;
    final s241 = Section2Model.s241;

    bool isSelected = values[1].value;
    return Column(
      children: [
        ...values
            .map(
              (e) => Row(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            values.forEach((element) {
                              element.value = false;
                            });
                            e.value = v!;
                          });
                        },
                      ),
                      CustomText(
                        text: e.text ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            )
            .toList(),
      ],
    );
  }

  TextEditingController wayController = TextEditingController();
  TextEditingController timeRangeController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController machineController = TextEditingController();
  TextEditingController fromWhereController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();
  final _keySoilPreparationStep = GlobalKey<FormState>();

  Widget _buildSoilPreparationStepWidget(BuildContext context) {
    List<SoilPreparationStepsModel> values = Section2Model.s23SoilPreparationSteps.values;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: const Color(0xff194902),
                child: const CustomText(
                  text: 'เพิ่ม',
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    wayController.clear();
                    timeRangeController.clear();
                    monthController.clear();
                    countController.clear();
                    machineController.clear();
                    fromWhereController.clear();
                    servicePriceController.clear();
                  });
                  _addPreparationStepModal(context: context);
                },
              ),
              const SizedBox(width: 10),
              const CustomText(
                text: 'กรุณาเพิ่มขั้นตอนการเตรียมดิน',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 10),
          values.isNotEmpty
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
                          label: Text(''),
                        ),
                        DataColumn(
                          label: Text('ขั้นตอนที่'),
                        ),
                        DataColumn(
                          label: Text('วิธีการ'),
                        ),
                        DataColumn(
                          label: Text('ช่วงเวลา (ต้น,กลาง,ปลาย)'),
                        ),
                        DataColumn(
                          label: Text('เดือน'),
                        ),
                        DataColumn(
                          label: Text('จำนวนครั้ง'),
                        ),
                        DataColumn(
                          label: Text('เครื่องจักรที่ใช้'),
                        ),
                        DataColumn(
                          label: Text('แหล่งที่มา'),
                        ),
                        DataColumn(
                          label: Text('ค่าบริการ (ต่อไร่)'),
                        ),
                      ],
                      rows: List.generate(
                        values.length,
                        (index) {
                          final was = values[index];
                          return DataRow(cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  values.removeAt(index);
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
                                  text: was.wayController ?? '', fontSize: 16, color: Colors.black),
                            ),
                            DataCell(
                              CustomText(
                                text: was.timeRangeController ?? '',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(
                              CustomText(
                                text: was.monthController ?? '',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            DataCell(CustomText(
                                text: was.countController ?? '',
                                fontSize: 16,
                                color: Colors.black)),
                            DataCell(CustomText(
                                text: was.machineController ?? '',
                                fontSize: 16,
                                color: Colors.black)),
                            DataCell(CustomText(
                                text: was.fromWhereController ?? '',
                                fontSize: 16,
                                color: Colors.black)),
                            DataCell(CustomText(
                                text: was.servicePriceController ?? '',
                                fontSize: 16,
                                color: Colors.black)),
                          ]);
                        },
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void _addPreparationStepModal({
    required BuildContext context,
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
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              // height: 600,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _keySoilPreparationStep,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: 'เพิ่มขั้นตอนการเตรียมดิน',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff194902),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'วิธีการ',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            controller: wayController,
                            textAlign: TextAlign.start,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keySoilPreparationStep.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ช่วงเวลา (ต้น,กลาง,ปลาย)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: timeRangeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keySoilPreparationStep.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'เดือน',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: monthController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keySoilPreparationStep.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'จำนวนครั้ง',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: countController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _keySoilPreparationStep.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'เครื่องจักรที่ใช้',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: machineController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keySoilPreparationStep.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'แหล่งที่มา',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: fromWhereController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              _keySoilPreparationStep.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'ค่าบริการ (ต่อไร่)',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          _buildTextFieldWidget(
                            textAlign: TextAlign.start,
                            controller: servicePriceController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              _keySoilPreparationStep.currentState?.validate();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 29),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CupertinoButton(
                                  color: const Color(0xff194902),
                                  child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                                  onPressed: () {
                                    if (_keySoilPreparationStep.currentState!.validate()) {
                                      Section2Model.s23SoilPreparationSteps.values.add(
                                        SoilPreparationStepsModel(
                                          wayController: wayController.text,
                                          timeRangeController: timeRangeController.text,
                                          monthController: monthController.text,
                                          countController: countController.text,
                                          machineController: machineController.text,
                                          fromWhereController: fromWhereController.text,
                                          servicePriceController: servicePriceController.text,
                                        ),
                                      );
                                      setState(() {});

                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                                const SizedBox(width: 10),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _build211() {
    List<Section2ValueTextModel> values = Section2Model.s211.values;
    return Row(
      children: values
          .map(
            (e) => Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  value: e.value,
                  onChanged: (v) {
                    setState(() {
                      e.value = v!;
                      values.forEach((element) {
                        if (element.text != e.text) {
                          element.value = false;
                        }
                      });
                    });
                  },
                ),
                CustomText(
                  text: e.text,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _build212(RiceFieldModel? selectedRiceField) {
    List<Section2PVSModel> values = Section2Model.s212.values;
    return Column(
      children: values.map(
        (e) {
          final index = values.indexOf(e);

          return Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomText(
                    text: e.prefix ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: _buildTextFieldWidget(
                    controller: e.controller,
                    enabled: index != 2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกข้อมูล';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (index == 1) {
                        if (e.controller!.text.isNotEmpty) {
                          values[2].controller!.text = (double.parse(e.controller!.text) *
                                  double.parse(selectedRiceField?.riceFieldArea.toString() ?? '0'))
                              .toString();
                        } else {
                          values[2].controller!.clear();
                        }
                      }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomText(
                    text: e.suffix ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _build213() {
    Section2ValueTextModel? value1 = Section2Model.s213.values.value1;
    Section2CheckVSModel? value2 = Section2Model.s213.values.value2;

    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              value: value1!.value,
              onChanged: (v) {
                setState(() {
                  value1.value = v!;
                  value2!.value = false;
                  value2.controller?.clear();
                });
              },
            ),
            CustomText(
              text: value1.text,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              value: value2!.value,
              onChanged: (v) {
                setState(() {
                  value2.value = v;
                  value1.value = false;
                  _formKey.currentState?.validate();
                });
              },
            ),
            CustomText(
              text: value2.text ?? '',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildTextFieldWidget(
                controller: value2.controller,
                enabled: value2.value,
                validator: value1.value
                    ? null
                    : (value) {
                        if (value1.value && value!.isEmpty) {
                          return 'กรุณากรอกข้อมูล';
                        }
                        return null;
                      },
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _formKey.currentState?.validate();
                  setState(() {});
                },
              ),
            ),
            const SizedBox(width: 10),
            CustomText(
              text: value2.suffix ?? '',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ],
        ),
      ],
    );
  }

  Widget _build214() {
    List<Section2ValueTextModel> values = Section2Model.s214.values;
    return Column(
      children: values
          .map(
            (e) => Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  value: e.value,
                  onChanged: (v) {
                    setState(() {
                      e.value = v!;
                      values.forEach((element) {
                        if (element.text != e.text) {
                          element.value = false;
                        }
                      });
                    });
                  },
                ),
                CustomText(
                  text: e.text,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget _build232True() {
    List<Section2ValueTextModel> values = Section2Model.s232True.values;
    return Column(
      children: values
          .map(
            (e) => Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  value: e.value,
                  onChanged: (v) {
                    setState(() {
                      e.value = v!;
                      values.forEach((element) {
                        if (element.text != e.text) {
                          element.value = false;
                        }
                      });
                    });
                  },
                ),
                CustomText(
                  text: e.text,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  /* Widget _build215() {
    Section2ValueTextModel? value1 = Section2Model.s215.values.value1;
    Section2CheckVSModel? value2 = Section2Model.s215.values.value2;
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              value: value1!.value,
              onChanged: (v) {
                setState(() {
                  value1.value = !value1.value;
                  value2!.value = false;
                });
              },
            ),
            CustomText(
              text: value1.text,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              value: value2!.value,
              onChanged: (v) {
                setState(() {
                  value2.value = !value2.value!;
                  value1.value = false;
                });
              },
            ),
            CustomText(
              text: value2.text ?? '',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildTextFieldWidget(
                controller: value2.controller,
                enabled: value2.value,
                validator: (value) {
                  if (value2.value! && value!.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            const SizedBox(width: 10),
            CustomText(
              text: value2.suffix ?? '',
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
*/
  Widget _build221() {
    List<S221Model> values = Section2Model.s221.datas;
    return Column(
      children: values
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            e.value = !e.value;

                            if (!e.value) {
                              e.values.forEach((element) {
                                element.value = false;
                              });
                            }
                          });
                        },
                      ),
                      CustomText(
                        text: e.text ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Visibility(
                          visible: e.controller != null,
                          child: _buildTextFieldWidget(
                            controller: e.controller,
                            enabled: e.value,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        ...e.values
                            .map(
                              (em) => Row(
                                children: [
                                  Checkbox(
                                    value: em.value,
                                    onChanged: !e.value
                                        ? null
                                        : (v) {
                                            setState(() {
                                              em.value = !em.value;
                                            });
                                          },
                                  ),
                                  CustomText(
                                    text: em.text ?? '',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _build222() {
    List<Section2ValueTextModel> values = Section2Model.s222.values1;
    List<Section2CheckVSModel> values2 = Section2Model.s222.values2;

    return Column(
      children: [
        Column(
          children: values
              .map(
                (e) => Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      value: e.value,
                      onChanged: (v) {
                        setState(() {
                          values.forEach((element) {
                            element.value = false;
                          });
                          values2.forEach((element) {
                            element.value = false;
                            element.controller?.clear();
                          });
                          e.value = v!;
                        });
                      },
                    ),
                    CustomText(
                      text: e.text,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        Column(
          children: values2
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              value: e.value,
                              onChanged: (v) {
                                setState(() {
                                  values.forEach((element) {
                                    element.value = false;
                                  });
                                  values2.forEach((element) {
                                    element.value = false;
                                    element.controller?.clear();
                                  });
                                  e.value = v;
                                  e.controller?.clear();
                                });
                              },
                            ),
                            Expanded(
                              child: CustomText(
                                text: e.text ?? '',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTextFieldWidget(
                          controller: e.controller,
                          enabled: e.value,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        text: e.suffix ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _build223() {
    List<Section2ValueTextModel> values = Section2Model.s223.values1;
    List<Section2CheckVSModel> values2 = Section2Model.s223.values2;
    return Column(
      children: [
        Column(
          children: values
              .map(
                (e) => Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      value: e.value,
                      onChanged: (v) {
                        setState(() {
                          e.value = v!;
                        });
                      },
                    ),
                    CustomText(
                      text: e.text,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        Column(
          children: values2
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              value: e.value,
                              onChanged: (v) {
                                setState(() {
                                  e.value = !e.value!;
                                  e.controller?.clear();
                                });
                              },
                            ),
                            Expanded(
                              child: CustomText(
                                text: e.text ?? '',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildTextFieldWidget(
                          controller: e.controller,
                          enabled: e.value,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        text: e.suffix ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _build224() {
    List<Section2CheckVSModel> values = Section2Model.s224.values;
    return Column(
      children: values
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          value: e.value,
                          onChanged: (v) {
                            setState(() {
                              values.forEach((element) {
                                element.value = false;
                                element.controller?.clear();
                              });
                              e.value = v;
                              e.controller?.clear();
                            });
                          },
                        ),
                        Expanded(
                          child: CustomText(
                            text: e.text ?? '',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextFieldWidget(
                      controller: e.controller,
                      enabled: e.value,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomText(
                    text: e.suffix ?? '',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

/*
  Widget _build225() {
    List<Section2PVSModel> values = Section2Model.s225.values;
    return Column(
      children: values
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildTextFieldWidget(
                      controller: e.controller,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomText(
                      text: e.suffix ?? '',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
*/

  Widget _build225() {
    List<Section2ValueTextModel> values = Section2Model.s226.values1;
    List<Section2CheckVSModel> values2 = Section2Model.s226.values2;
    final q2 = Section2Model.s226.question2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: values
              .map(
                (e) => Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      value: e.value,
                      onChanged: (v) {
                        setState(() {
                          values.forEach((element) {
                            element.value = false;
                          });
                          values2.forEach((element) {
                            element.value = false;
                          });
                          e.value = v!;
                          if (values[0].value) {
                            values2.forEach((element) {
                              element.value = false;
                            });
                          }
                        });
                      },
                    ),
                    CustomText(
                      text: e.text,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        const SizedBox(width: 30),
        CustomText(
          text: q2,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        Column(
          children: values2
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              value: e.value,
                              onChanged: values[0].value
                                  ? null
                                  : (v) {
                                      setState(() {
                                        e.value = v;
                                        e.controller?.clear();
                                      });
                                    },
                            ),
                            Expanded(
                              child: CustomText(
                                text: e.text ?? '',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const SizedBox(width: 10),
                      SizedBox(width: 10),
                      Expanded(
                        child: Visibility(
                          visible: e.controller != null,
                          child: _buildTextFieldWidget(
                            controller: e.controller,
                            enabled: e.value,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      /*Visibility(
                        visible: values2.last == e,
                        child: Expanded(
                          child: _buildTextFieldWidget(
                            controller: e.controller,
                            enabled: e.value,
                            validator: (value) {
                              if (e.value! && value!.isEmpty) {
                                return 'กรุณากรอกข้อมูล';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),*/
                      const SizedBox(width: 10),
                      CustomText(
                        text: e.suffix ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _build231() {
    List<S221Model> values = Section2Model.s231.values;
    return Column(
      children: [
        ...values
            .map(
              (e) => Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: e.value,
                          onChanged: (v) {
                            setState(() {
                              values.forEach((element) {
                                element.value = false;
                                element.values.forEach((element) {
                                  element.value = false;
                                });
                              });

                              e.value = v!;
                            });
                          },
                        ),
                        Expanded(
                          child: CustomText(
                            text: e.text ?? '',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        children: [
                          ...e.values
                              .map(
                                (em) => Row(
                                  children: [
                                    Checkbox(
                                      value: em.value,
                                      onChanged: !e.value
                                          ? null
                                          : (v) {
                                              setState(() {
                                                em.value = !em.value;
                                              });
                                            },
                                    ),
                                    CustomText(
                                      text: em.text ?? '',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _build232() {
    S232 value = Section2Model.s232;

    List<String> monthsThai = [
      "มกราคม",
      "กุมภาพันธ์",
      "มีนาคม",
      "เมษายน",
      "พฤษภาคม",
      "มิถุนายน",
      "กรกฎาคม",
      "สิงหาคม",
      "กันยายน",
      "ตุลาคม",
      "พฤศจิกายน",
      "ธันวาคม"
    ];

    return Column(
      children: [
        ...value.begins
            .map(
              (e) => Container(
                //margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: e.value,
                          onChanged: (v) {
                            setState(() {
                              value.begins.forEach((element) {
                                element.value = false;
                              });

                              e.value = v!;
                            });
                          },
                        ),
                        Expanded(
                          child: CustomText(
                            text: e.text ?? '',
                            fontSize: 14,
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
            )
            .toList(),
        DropdownButton2(
            isExpanded: true,
            hint: const Text("เลือกเดือน"),
            buttonStyleData: ButtonStyleData(
              // width: MediaQuery.of(context).size.width / 1.5,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey[500]!.withOpacity(.3)),
              ),
            ),
            underline: Container(),
            items: monthsThai.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
            value: value.month,
            onChanged: (v) {
              setState(() {
                value.month = v!;
              });
            }),
      ],
    );
  }

  Widget _buildBgThemeWidget({
    required BuildContext context,
    required String title,
    required Widget child,
  }) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
            ),
            child,
          ],
        ));
  }

  Widget _buildDropdownSelectedRiceFieldWidget(BuildContext context) {
    return BlocBuilder<AgriInfoBloc, AgriInfoState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<RiceFieldModel>(
              isExpanded: true,
              value: state.selectedRiceField,
              hint: Text(
                "กรุณาเลือกแปลง",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.bold),
              ),
              items: RiceFieldModel.riceFields.map<DropdownMenuItem<RiceFieldModel>>((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      CustomText(
                        text: e.riceFieldName ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              }).toList(),
              isDense: true,
              onChanged: (v) => _onSelectedRiceField(context, v),
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.5,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xffD9D9D9),
                  // border: Border.all(color: Colors.grey[500]!.withOpacity(.3)),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Theme.of(context).primaryColor,
                ),
                maxHeight: 400,
                elevation: 8,
                offset: const Offset(0, -20),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                selectedMenuItemBuilder: (BuildContext context, Widget child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: child,
                  );
                },
              ),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextFieldWidget({
    required TextEditingController? controller,
    bool? enabled,
    String? Function(String?)? validator,
    Function(String?)? onChanged,
    TextInputType? keyboardType,
    int? minLines,
    TextAlign? textAlign,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
          enabled: enabled ?? true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          textAlign: textAlign ?? TextAlign.center,
          minLines: minLines ?? 1,
          maxLines: 10,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
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
                width: 0,
              ),
            ),
          )),
    );
  }
}
