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
import '../../info_image.dart';
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

  @override
  Widget build(BuildContext context) {
    const headColor = Color(0xff103300);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
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
                                child: _build212(),
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
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s215.question,
                                child: _build215(),
                              ),
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
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s225.question,
                                child: _build225(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s226.question,
                                child: _build226(),
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
                                    '2.3.3 วิธีการปลูกในปีการผลิตที่ผ่านมาท่านทำการปลูกข้าวกี่ครั้ง',
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
                                title: Section2Model.s242.question,
                                child: _build242(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s243.question,
                                child: _build243(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s244.question,
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
                                title: Section2Model.s245.s2451.s22453.question,
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
                                title: Section2Model.s254532.question,
                                child: _build2254(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s224541.question,
                                child: _build24541(),
                              ),
                              const SizedBox(height: 10),
                              _buildBgThemeWidget(
                                context: context,
                                title: Section2Model.s224542.question,
                                child: _build24542(),
                              ),
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

                                    bool s211 = Section2Model.s211.values.where((e) => e.value == true).isEmpty;

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

                                    riceField.s11 =
                                        Section2Model.s211.values.where((e) => e.value == true).first.text;
                                    print('s11: ${riceField.s11}');

                                    bool s212 = Section2Model.s212.values.any((e) => e.controller!.text.isEmpty);
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
                                    print('s12: ${riceField.s12}');

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
                                      if (Section2Model.s213.values.value2!.controller!.text.isEmpty) {
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

                                    print('s13: ${riceField.s13}');

                                    /// 2.1.4
                                    bool s214 = Section2Model.s214.values.where((e) => e.value == true).isEmpty;
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

                                    final s214d = Section2Model.s214.values.where((e) => e.value == true).first;

                                    riceField.s14 = s214d.text;

                                    print('s14: ${riceField.s14}');

                                    /// 2.1.5
                                    bool s215v1 = Section2Model.s215.values.value1!.value;
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

                                    print('s15: ${riceField.s15}'); // 2.1.5

                                    /// 2.2.1
                                    bool s221AllTrue = Section2Model.s221.values.any((e) => e.value == true);

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
                                        List<Section2CheckVSModel> result = [];
                                        List<Section2CheckVSModel> s21 =
                                        Section2Model.s221.values.where((e) => e.value == true).toList();
                                        for (var item in s21) {
                                          if (item.value! && item.controller!.text.isNotEmpty) {
                                            result.add(item);
                                          } else {
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
                                        }
                                        riceField.s21 =
                                            result.map((e) => '${e.text} ${e.controller!.text}').toList().join(' ');
                                      } catch (e) {
                                        print(e);
                                      }
                                    }
                                    print('s21: ${riceField.s21}'); // 2.2.1

                                    /// 2.2.2
                                    String s222 = '';
                                    List<Section2ValueTextModel> values = Section2Model.s222.values1;
                                    List<Section2CheckVSModel> values2 = Section2Model.s222.values2;

                                    bool s222AllTrue = values.where((e) => e.value == true).isEmpty &&
                                        values2.where((e) => e.value! && e.controller!.text.isNotEmpty).isEmpty;

                                    if (s222AllTrue) {
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

                                    for (var item in values) {
                                      if (item.value) {
                                        s222 = item.text;
                                        break;
                                      }
                                    }

                                    for (var item in values2) {
                                      if (item.value! && item.controller!.text.isNotEmpty) {
                                        s222 = ' ${item.text} ${item.controller!.text}';
                                        break;
                                      }
                                    }

                                    riceField.s22 = s222;
                                    print('s22: $s222'); // 2.2.2

                                    /// 2.2.3

                                    List<Section2ValueTextModel> values223 = Section2Model.s223.values1;
                                    List<Section2CheckVSModel> values2223 = Section2Model.s223.values2;

                                    List<String> s223 = [];
                                    bool values223All = values223.where((e) => e.value == true).isEmpty &&
                                        values2223.where((e) => e.value! && e.controller!.text.isNotEmpty).isEmpty;
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
                                    print('s23: ${riceField.s23}'); // 2.2.3

                                    /// 2.2.4
                                    List<String> s224 = [];
                                    List<Section2CheckVSModel> values224 = Section2Model.s224.values;
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

                                    List<Section2CheckVSModel> values224v =
                                    Section2Model.s224.values.where((e) => e.value == true).toList();

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
                                    print('s24: ${riceField.s24}'); // 2.2.4

                                    String s225 = '';
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
                                    print('s25: $s225'); // 2.2.5

                                    /// 2.2.6
                                    List<Section2ValueTextModel> values226 = Section2Model.s226.values1;
                                    List<Section2CheckVSModel> values2226 = Section2Model.s226.values2;

                                    String s226 = '';
                                    List<String> s2261 = [];
                                    String s2261Text = '';
                                    bool s226All = values226.where((e) => e.value == true).isEmpty;

                                    if (s226All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.2.6',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    List<Section2ValueTextModel> values226v =
                                    Section2Model.s226.values1.where((e) => e.value == true).toList();
                                    List<Section2CheckVSModel> values2226v =
                                    Section2Model.s226.values2.where((e) => e.value == true).toList();

                                    s226 = values226v.first.text;

                                    for (var item in values2226v) {
                                      if (item.value!) {
                                        if (item.controller != null && item.controller!.text.isEmpty) {
                                          Fluttertoast.showToast(
                                            msg: 'กรุณากรอกข้อมูลในข้อ 2.2.6',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          return;
                                        } else {
                                          if (values226[1].value || values226[2].value) {
                                            for (var item in values2226v) {
                                              s2261.add('${item.text} ${item.controller?.text ?? ''}');
                                            }
                                          }
                                        }

                                        break;
                                      }
                                    }

                                    riceField.s26 = s226;
                                    riceField.s261 = s2261.join(' ');
                                    print('s26: $s226'); // 2.2.6
                                    print('s261: ${riceField.s261}'); // 2.2.6

                                    /// 2.3.1
                                    String s231 = '';
                                    String? s2311;
                                    List<Section2ValueTextModel> values231 = Section2Model.s231.values;
                                    bool s231All = values231.where((e) => e.value == true).isEmpty;

                                    if (s231All) {
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

                                    if (values231[0].value) {
                                      s231 = values231[0].text;
                                      s2311 = null;
                                    }
                                    if (values231[1].value) {
                                      if (Section2Model.s231.yearController!.text.isEmpty ||
                                          Section2Model.s231.detailController!.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.3.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                      s231 = values231[1].text;
                                      s2311 = '- ระยะเวลาที่ท่านต้องบำรุงดิน ${Section2Model.s231.yearController!.text} ปี \n- ท่านมีการบำรุงดินด้วยวิธีใด และทำอย่างไร(ไถกลบตอซัง/ปุ๋ยคอก/พืชบำรุงดิน)\n${Section2Model.s231.detailController!.text}';
                                    }

                                    riceField.s31 = s231;
                                    riceField.s311 = s2311 ;
                                    print('s31: $s231'); // 2.3.1 ขั้นตอนการเตรียมดิน
                                    print('s311: $s2311'); // 2.3.1 ขั้นตอนการเตรียมดิน

                                    /// 311
                                    /// SoilPreparationStepsModel
                                    List<SoilPreparationStepsModel> s23SoilPreparationSteps =
                                        Section2Model.s23SoilPreparationSteps.values;

                                    if (values231[0].value && s23SoilPreparationSteps.isEmpty) {
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

                                    if (values231[0].value) {
                                      riceField.s321 = [];
                                    } else {
                                      riceField.s321 = s23SoilPreparationSteps.map((e) => e.toJson()).toList();
                                    }

                                    print(
                                        's321: ${riceField.s321}'); // 2.3.3 วิธีการปลูกในปีการผลิตที่ผ่านมาท่านทำการปลูกข้าวกี่ครั้ง

                                    /// 2.3.2
                                    S232 value232 = Section2Model.s232;
                                    String s232 = '';

                                    if (value232.startMonthController!.text.isNotEmpty &&
                                        value232.monthController!.text.isNotEmpty) {
                                      s232 =
                                      '${value232.startMonthController!.text} เดือน ${value232.monthController!.text}';
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.3.2',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    riceField.s32 = s232;
                                    print(
                                        's32: $s232'); // 2.3.2 วิธีการปลูกในปีการผลิตที่ผ่านมาท่านทำการปลูกข้าวกี่ครั้ง

                                    List<HowToPlantInTheLastProductionYearsModel>
                                    hS23owToPlantInTheLastProductionYears =
                                        Section2Model.hS23owToPlantInTheLastProductionYears.values;

                                    if (hS23owToPlantInTheLastProductionYears.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg:
                                        '2.3.3 กรุณาเพิ่มขวิธีการปลูกในปีการผลิตที่ผ่านมาท่านทำการปลูกข้าวกี่ครั้ง',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    riceField.s33 =
                                        hS23owToPlantInTheLastProductionYears.map((e) => e.toJson()).toList();
                                    print('s33: ${riceField.s33}');

                                    /// 2.4.1
                                    List<Section2ValueTextModel> values241 = Section2Model.s241.values;
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

                                    if (values241[0].value) {
                                      s241Text = values241[0].text;
                                      s2411Text = null;
                                    }

                                    if (values241[1].value) {
                                      if (s241.weedController?.text == '' ||
                                          s241.percentController?.text == '' ||
                                          s241.controlWeedController?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.4.1',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                      s241Text = values241[1].text;
                                      s2411Text =
                                      'คือ ${s241.weedController!.text} \nคิดเป็นร้อยละ ${s241.percentController!.text} ของพื้นที่ \nและท่านกำจัดวัชพืชหรือไม่อย่างไร ${s241.controlWeedController!.text}';
                                    }

                                    riceField.s41 = s241Text;
                                    riceField.s411 = s2411Text;
                                    print('s41: ${riceField.s41}'); // 2.4.1
                                    print('s411: ${riceField.s411}'); // 2.4.1

                                    /// 2.4.2
                                    List<Section2ValueTextModel> values242 = Section2Model.s242.values;
                                    String s242Text = '';
                                    String? s2421Text;
                                    final s242 = Section2Model.s242;
                                    bool s242All = values242.where((e) => e.value == true).isEmpty;

                                    if (s242All) {
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

                                    if (values242[0].value) {
                                      s242Text = values242[0].text;
                                      s2421Text = null;
                                    }
                                    if (values242[1].value) {
                                      if (s242.weedController?.text == '' || s242.percentController?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.4.2',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                      s242Text = values242[1].text;
                                      s2421Text =
                                      'คือ ${s242.weedController!.text} \nคิดเป็นร้อยละ ${s242.percentController!.text} ของพื้นที่';
                                    }

                                    riceField.s42 = s242Text;
                                    riceField.s421 = s2421Text;
                                    print('s42: ${riceField.s42}'); // 2.4.1
                                    print('s421: ${riceField.s421}'); // 2.4.1

                                    /// 2.4.3
                                    List<Section2ValueTextModel> values243 = Section2Model.s243.values;
                                    String s243Text = '';
                                    final s243 = Section2Model.s243;
                                    bool s243All = values243.where((e) => e.value == true).isEmpty;

                                    if (s243All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.4.3',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    if (values243[0].value) {
                                      s243Text = values243[0].text;
                                    }
                                    if (values243[1].value) {
                                      if (s243.controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ 2.4.3',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      s243Text = '${values243[1].text} ${s243.controller!.text}';
                                    }

                                    riceField.s43 = s243Text;
                                    print('s43: ${riceField.s43}');
                                    // print('s43: ${riceField.s43}');

                                    List<Section2CheckVSModel> values44 = Section2Model.s244.values;
                                    String s244Text = '';
                                    bool s244All = values44.where((e) => e.value == true).isEmpty;

                                    if (s244All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.4.4',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    final currentValues = values44.where((e) => e.value == true).first;

                                    if (currentValues.controller!.text.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.4',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    s244Text = '${currentValues.text} ${currentValues.controller!.text}';
                                    riceField.s44 = s244Text;
                                    print('s44: ${riceField.s44}'); // 2.4.4

                                    /// 2.4.5.1
                                    S245 values45 = Section2Model.s245;
                                    S24511 s24511 = values45.s2451.s24511;
                                    List<Section2ValueTextModel> s24511values1 = s24511.values1;
                                    List<Section2CheckVSModel> s24511values2 = s24511.values2;
                                    String s24511Text = '';
                                    String? s24512Text;

                                    bool s24511All = s24511values1.where((e) => e.value == true).isEmpty;

                                    bool s24511All2 = s24511values2.where((e) => e.value! == true).isEmpty;

                                    if (s24511All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.5.1.1',
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
                                      s24511Text = s24511values1[1].text;
                                    }

                                    if (s24511values1[1].value) {
                                      if (s24511All2) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ ',
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
                                          if (item.controller?.text == '') {
                                            Fluttertoast.showToast(
                                              msg: 'กรุณากรอกข้อมูลในข้อ',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 3,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                            return;
                                          }

                                          s24512Texts.add('${item.text} ${item.controller?.text ?? ''}');
                                        }
                                      }
                                      s24512Text = s24512Texts.join('');
                                    }

                                    riceField.s4511 = s24511Text;
                                    riceField.s4512 = s24512Text;
                                    print('s4511: ${riceField.s4511}'); //
                                    print('s4512: ${riceField.s4512}'); //

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

                                    riceField.s513 = caseOfGivingWaters.map((e) => e.toJson()).toList();
                                    print('s4513: ${riceField.s513}'); //

                                    ///
                                    S245 values4512 = Section2Model.s245;
                                    S24512 s245112 = values4512.s2451.s24512;
                                    List<Section2CheckVSModel> s24512values = s245112.s24521.values;
                                    String s24521Text = '';

                                    bool s24512All = s24512values.where((e) => e.value == true).isEmpty;

                                    if (s24512All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.5.2.1',
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
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
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
                                    print('ss4521: $s24521Text'); //

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

                                    riceField.s522 = caseOfApplyingFertilizers.map((e) => e.toJson()).toList();
                                    print('s4522: ${riceField.s522}'); //

                                    S245 values4531 = Section2Model.s245;
                                    S22453 s245311 = values4531.s2451.s22453;
                                    List<Section2CheckVSModel> s24531values = s245311.values.values;
                                    String s24531Text = '';

                                    bool s24531All = s24531values.where((e) => e.value == true).isEmpty;

                                    if (s24531All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.5.3.1',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }
                                    if (s24531values[0].value!) {
                                      s24531Text = s24531values[0].text!;
                                    }

                                    if (s24531values[1].value!) {
                                      if (s24531values[1].controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      s24531Text =
                                      '${s24531values[1].text} ${s24531values[1].controller?.text ?? ''}';
                                    }
                                    riceField.s4531 = s24531Text;
                                    print('s4531: ${riceField.s4531}'); //

                                    bool isCaseKillWeeds = s24531values[0].value!;
                                    List<CaseKillWeedsModel> caseKillWeeds = Section2Model.caseKillWeeds.values;
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

                                    riceField.s45311 = caseKillWeeds.map((e) => e.toJson()).toList();
                                    print('s45311: ${riceField.s45311}'); //

                                    //
                                    final values254 = Section2Model.s254532.values;
                                    final s254532All = values254.where((e) => e.value == true).isEmpty;
                                    if (s254532All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณาเลือกข้อมูลในข้อ 2.5.3.2',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    String s4532 = '';
                                    List<S2TVTVModel> v1 = values254[1].values ?? [];
                                    if (values254[0].value!) {
                                      if (values254[0].controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      s4532 = '${values254[0].text} ${values254[0].controller?.text ?? ''}';
                                    }

                                    List<String> s4532s = [];

                                    if (values254[1].value!) {
                                      if (values254[1].controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      s4532s
                                          .add('${values254[1].text} ${values254[1].controller?.text ?? ''} ครั้ง');

                                      for (var item in v1) {
                                        if (item.controller1.text == '' || item.controller2.text == '') {
                                          Fluttertoast.showToast(
                                            msg: 'กรุณากรอกข้อมูลในข้อ',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          return;
                                        }
                                        s4532s.add(
                                            '${item.title} ${item.controller1.text} ${item.suffix1} ${item.controller2.text}');
                                      }

                                      s4532 = '${values254[1].text} \n${s4532s.join('\n')}';
                                    }

                                    riceField.s4532 = s4532;
                                    print('s4532: $s4532'); //

                                    final data = Section2Model.s224541;
                                    final s224541values1 = data.values1;
                                    final s224541values2 = data.values2;

                                    String s224541Text = '';
                                    String? s2245411Text;

                                    final s224541All = s224541values1.where((e) => e.value == true).isEmpty;
                                    if (s224541All) {
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

                                    if (s224541values1[0].value!) {
                                      s224541Text = s224541values1[0].text!;
                                      s2245411Text = null;
                                    }

                                    List<String> s224541Texts = [];

                                    if (s224541values1[1].value!) {
                                      bool s224541All2 = s224541values2.where((e) => e.value! == true).isEmpty;

                                      if (s224541All2) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      if (s224541values2.last.controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      s224541Text = s224541values1[1].text!;

                                      s224541Texts = ['โรคที่พบได้แก่ โรคอะไรบ้าง'];
                                      for (var i in s224541values2) {
                                        if (i.value!) {
                                          s224541Texts.add('${i.text} ${i.controller?.text ?? ''}');
                                        }
                                      }
                                      final vLast = s224541values2.last;
                                      s224541Texts.add('${vLast.text} ${vLast.controller?.text ?? ''}');
                                      // s224541Text = '${s224541values1[1].text} ${item.text} ${item.controller?.text ?? ''}';

                                      s2245411Text = s224541Texts.join('\n');
                                    }

                                    riceField.s4541 = s224541Text;
                                    riceField.s45411 = s2245411Text;
                                    print('s4541: ${riceField.s4541}'); //
                                    print('s45411: ${riceField.s45411}'); //

                                    final data1 = Section2Model.s224542;
                                    final s224542values1 = data1.values1;
                                    final s224542values2 = data1.values2;

                                    String s224542Text = '';
                                    String? s2245421Text;

                                    final s224542All = s224542values1.where((e) => e.value == true).isEmpty;
                                    if (s224542All) {
                                      Fluttertoast.showToast(
                                        msg: 'กรุณากรอกข้อมูลในข้อ 2.4.5.4.2',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                      return;
                                    }

                                    if (s224542values1[0].value!) {
                                      s224542Text = s224542values1[0].text!;
                                      s2245421Text = null;
                                    }

                                    List<String> s224542Texts = [];

                                    if (s224542values1[1].value!) {
                                      bool d = s224542values2.where((e) => e.value! == true).isEmpty;

                                      if (d) {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }

                                      if (s224542values2.last.controller?.text == '') {
                                        Fluttertoast.showToast(
                                          msg: 'กรุณากรอกข้อมูลในข้อ',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                        return;
                                      }
                                      // s224542Texts.add('${item.text} ${item.controller?.text ?? ''}');
                                      // s224541Text = '${s224541values1[1].text} ${item.text} ${item.controller?.text ?? ''}';
                                      s224542Text = '${s224542values1[1].text}';
                                      s224542Texts = ['แมลงศัตรูข้าวที่พบได้แก่ อะไรบ้าง'];
                                      for (var i in s224542values2) {
                                        if (i.value!) {
                                          s224542Texts.add('${i.text} ${i.controller?.text ?? ''}');
                                        }
                                      }
                                      final vLast = s224542values2.last;
                                      s224542Texts.add('${vLast.text} ${vLast.controller?.text ?? ''}');

                                      s2245421Text = s224542Texts.join('\n');
                                    }

                                    riceField.s4542 = s224542Text;
                                    riceField.s45421 = s2245421Text;
                                    print('s4542: ${riceField.s4542}'); //
                                    print('s45421: ${riceField.s45421}'); //

                                    /// 2.5
                                    // 2.5.1
                                    final x1 = Section2Model.s251;
                                    List<Section2CheckVSModel> s251values1 = x1.values;
                                    String s251Text = '';
                                    List<String> s251Texts = ['ท่านเก็บเกี่ยวข้าว'];

                                    for (var item in s251values1) {
                                      if (item.controller?.text == '') {
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
                                      s251Texts.add('${item.text} ${item.controller?.text ?? ''}');
                                    }

                                    s251Text = s251Texts.join(' ');
                                    riceField.s51 = s251Text;
                                    print('s51: $s251Text'); //

                                    final y = Section2Model.s252;
                                    List<Section2CheckVSModel> s252values1 = y.values1;
                                    bool s252AAll = s252values1.where((e) => e.value == true).isEmpty;

                                    List<Section2CheckVSModel> s252values2 = y.values2;
                                    bool s252BAll = s252values2.where((e) => e.value == true).isEmpty;

                                    List<Section2CheckVSModel> s252values3 = y.values3;
                                    bool s252CAll = s252values3.first.controller?.text == '';

                                    List<Section2CheckVSModel> s252values4 = y.values4;
                                    bool s252DAll = s252values4.where((e) => e.value == true).isEmpty;


                                    if (s252AAll) {
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

                                    Section2CheckVSModel a = s252values1.where((e) => e.value == true).first;
                                    riceField.s52A = a.text ?? '';
                                    riceField.s521A = null;
                                    List<String> a1 = [];
                                    print('sdsfs');
                                    if(s252values1[4].value! && s252AAll && s252BAll && s252CAll && s252DAll){
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


                                    riceField.s52A = s252values1[4].text!;
                                    riceField.s521A = ' แหล่งที่มาของเครื่องจักร';

                                    for(var item in s252values2){
                                      if(item.value!){
                                        a1.add('${item.text} ${item.controller?.text ?? ''}');
                                      }
                                    }



                                    for(var item in s252values3){
                                      a1.add('${item.text} ${item.controller?.text ?? ''} ${item.suffix}');

                                    }

                                    a1.add('การชำระค่าบริการ');

                                    for(var item in s252values4){
                                      if(item.value!){
                                        a1.add('${item.text} ${item.controller?.text ?? ''}');
                                      }
                                    }

                                    riceField.s521A = '${riceField.s521A} ${a1.join(' ')}';

                                    print('s52A: ${riceField.s52A}');
                                    print('s521A: ${riceField.s521A}');



                                    final s53 = Section2Model.s253;

                                    String s253Text = '';

                                    final s253values1 = s53.values;
                                    bool s253All = s253values1.where((e) => e.value == true).isEmpty;

                                    if(s253All){
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


                                    final currentValues53 = s253values1.where((e) => e.value == true).first;
                                    final index = s253values1.indexOf(currentValues53);

                                    if(index == 4){
                                      if(currentValues53.controller?.text == ''){
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


                                    riceField.s53B = '${currentValues53.text} ${currentValues53.controller?.text ?? ''}';
                                    print('s53B: ${riceField.s53B}');




                                    final s54 = Section2Model.s254;

                                    final s254values1 = s54.values;
                                    bool s254All = s254values1.where((e) => e.value == true).isEmpty;

                                    if(s254All){
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

                                    final currentValues54 = s254values1.where((e) => e.value == true).first;
                                    final index54 = s254values1.indexOf(currentValues54);

                                    if(index54 == 1){
                                      if(currentValues54.controller?.text == ''){
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

                                    riceField.s54C = '${currentValues54.text} ${currentValues54.controller?.text ?? ''}';
                                    print('s54C: ${riceField.s54C}');



                                    final s55 = Section2Model.s255;
                                    final s255values1 = s55.values;
                                    bool s255All = s255values1.where((e) => e.value == true).isEmpty;

                                    if(s255All){
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

                                    final currentValues55 = s255values1.where((e) => e.value == true).first;
                                    final index55 = s255values1.indexOf(currentValues55);
                                    riceField.s55D = currentValues55.text!;
                                    riceField.s551D = null;
                                    if(index55 == 1){
                                      if(s55.sunForCount?.text == '' || s55.sunForDay?.text == '' || s55.other?.text == ''){
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
                                      riceField.s551D = '- ตากแดด กลับกองข้าววันละ ${s55.sunForDay?.text} ครั้ง\nตากแดดจำนวน ${s55.sunForCount?.text ?? ''} วัน\n- อื่นๆ ${s55.sunForDay?.text ?? ''} ${s55.other?.text ?? ''}';
                                    }

                                    print('s55D: ${riceField.s55D}');
                                    print('s551D: ${riceField.s551D}');




                                    final s56 = Section2Model.s256;
                                    final sv1 = s56.values1;
                                    final sv2 = s56.values2;
                                    final sv3 = s56.values3;



                                    bool s56All = sv1.where((e) => e.value == true).isEmpty;

                                    if(s56All){
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

                                    if(index56 == 0){
                                      bool s56All2 = sv2.where((e) => e.value == true).isEmpty;
                                      if(s56All2){
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

                                      for(var item in sv2){
                                        if(item.value){
                                          s56E.add('- กรณีขายทั้งหมด ${item.text}');
                                        }
                                      }


                                      riceField.s561E = currentValues56.text;
                                      riceField.s561E = s56E.join('\n');
                                    }
                                    if(index56 == 1){
                                      bool s56All3 = sv3.where((e) => e.value == true).isEmpty;
                                      if( s56All3){
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

                                      for(var item in sv3){
                                        if(item.value){
                                          s56E.add('- กรณีเก็บทั้งหมด ${item.text}');
                                        }
                                      }

                                      riceField.s561E = currentValues56.text;
                                      riceField.s561E = s56E.join('\n');
                                    }

                                    if(index56 == 2){
                                      bool s56All2 = sv2.where((e) => e.value == true).isEmpty;
                                      bool s56All3 = sv3.where((e) => e.value == true).isEmpty;
                                      if(s56All2 || s56All3){
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

                                      for(var item in sv2){
                                        if(item.value){
                                          s56E.add('- กรณีขายทั้งหมด ${item.text}');
                                        }
                                      }

                                      for(var item in sv3){
                                        if(item.value){
                                          s56E.add('- กรณีเก็บทั้งหมด ${item.text}');
                                        }
                                      }

                                      riceField.s561E = currentValues56.text;
                                      riceField.s561E = s56E.join('\n');
                                    }

                                    print('s56E: ${riceField.s56E}');
                                    print('s561E: ${riceField.s561E}');




                                    final s561 = Section2Model.s260;
                                    final vS561 = s561.values1;
                                    final vS561s = s561.values1s;
                                    final vS562 = s561.values2;

                                    if(!vS561.value && !vS562.value!){
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

                                    if(vS562.value!){
                                      if(vS562.controller?.text == ''){
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
                                      riceField.s61E = '${riceField.s61E} ${vS562.controller?.text ?? ''}';

                                    }

                                    bool s561All = vS561s.where((e) => e.value == true).isNotEmpty;

                                    print('vS561.value: ${vS561.value}');
                                    print('s561All: $s561All');
                                    if(vS561.value){


                                      if(!s561All){
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
                                      for(var item in vS561s){
                                        if(item.value){
                                          s561Text.add(item.text);
                                        }

                                      }
                                      riceField.s61E =  '${riceField.s61E} ${s561Text.join('\n')}';

                                    }

                                    print('s61E: ${riceField.s61E}');



                                    Section2DataModel.datas.add(riceField);
                                    state.isSection2Pending = true;
                                    setState(() {});
                                    Navigator.pop(context, true);



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
                            onChanged: data.values1[1].value ? null : (v) {
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
                            onChanged:data.values1[0].value ? null :  (v) {
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
                text: 'แหล่งที่มาของเครื่องจักร',
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
                            onChanged: (v) {
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
                          const SizedBox(width: 10),
                          Visibility(
                            visible: e.controller != null,
                            child: Expanded(
                              child: _buildTextFieldWidget(
                                controller: e.controller,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
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
            ],
          ),
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
                              keyboardType: TextInputType.text,
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'การชำระค่าบริการ',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.start,
              ),
              ...data.values4.map(
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
                                data.values4.forEach((element) {
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
                          const SizedBox(width: 10),
                          Visibility(
                            visible: e.controller != null,
                            child: Expanded(
                              child: _buildTextFieldWidget(
                                controller: e.controller,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.text,
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
            ],
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
    final values2 = data.values2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: '2.4.5.4.1 ในแปลงนี้ตรวจพบ โรคข้าวหรือไม่',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
        ),
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
                text: 'โรคที่พบได้แก่ โรคอะไรบ้าง',
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

  Widget _build2254() {
    final values = Section2Model.s254532.values;
    return Column(
      children: [
        ...values.map(
          (e) {
            final subValues = e.values ?? [];
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
                          subValues.clear();
                          values.forEach((element) {
                            element.value = false;
                            element.controller?.clear();
                          });
                          e.values?.clear();
                          e.controller?.clear();

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
                    Expanded(
                      child: _buildTextFieldWidget(
                        controller: e.controller,
                        enabled: e.value!,
                        textAlign: values[1].value! ? TextAlign.center : TextAlign.start,
                        keyboardType: values[1].value! ? TextInputType.number : TextInputType.text,
                        onChanged: (value) {
                          if (values[1].value! && value!.isNotEmpty) {
                            int count = int.parse(value);

                            for (var i = 0; i < count; i++) {
                              subValues.add(
                                S2TVTVModel(
                                  title: 'ครั้งที่ ${i + 1} ตัดช่วง',
                                  controller1: TextEditingController(),
                                  suffix1: 'เพราะ',
                                  controller2: TextEditingController(),
                                ),
                              );
                            }
                          } else {
                            subValues.clear();
                          }
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
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
                Visibility(
                  visible: subValues.isNotEmpty,
                  child: Column(
                    children: [
                      ...subValues
                          .map(
                            (sub) => Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: sub.title ?? '',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                                Expanded(
                                  child: _buildTextFieldWidget(
                                    controller: sub.controller1,
                                    enabled: values[1].value,
                                    textAlign: TextAlign.start,
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CustomText(
                                  text: sub.suffix1 ?? '',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: _buildTextFieldWidget(
                                    controller: sub.controller2,
                                    textAlign: TextAlign.start,
                                    enabled: values[1].value,
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
                ),
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
  TextEditingController formula = TextEditingController();
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
                    timeToApply.clear();
                    decision.clear();
                    riceAge.clear();
                    fertilizerType = '';
                    formula.clear();
                    amountToApply.clear();
                    howToUseFertilizer = '';
                    fertilizerSource.clear();
                    howToGiveWater.clear();
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
                          label: Text('ช่วงเวลาที่ใส่ปุ๋ย (ต้น,กลาง,ปลายเดือน)'),
                        ),
                        DataColumn(
                          label: Text('ปัจจัยต่อการตัดสินใจใส่ปุ๋ย (น้ำ,ความชื้น,ฝน)'),
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
                          label: Text('แหล่งปุ๋ยที่มาของปุ๋ย (ธกส.,เขต,ซื้อเอง)'),
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
                              text: 'ช่วงเวลาที่ใส่ปุ๋ย (ต้น, กลาง, ปลาย เดือน)',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              controller: timeToApply,
                              textAlign: TextAlign.start,
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
                            const CustomText(
                              text: 'ปัจจัยต่อการตัดสินใจใส่ปุ๋ย (น้ำ, ความชื้น ,ฝน)',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: decision,
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
                            _buildTextFieldWidget(
                              textAlign: TextAlign.start,
                              controller: formula,
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
                                          howToUseFertilizer.isNotEmpty) {
                                        Section2Model.caseOfApplyingFertilizers.values.add(
                                          CaseOfApplyingFertilizersModel(
                                            timeToApply: timeToApply.text,
                                            decision: decision.text,
                                            riceAge: riceAge.text,
                                            fertilizerType: fertilizerType,
                                            formula: formula.text,
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
                                  onChanged: (v) {
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
        CustomText(
          text: s24511.values.question,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
        ),
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
    List<Section2CheckVSModel> values = Section2Model.s244.values;

    return Column(
      children: [
        ...values
            .map(
              (e) => Row(
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
                              e.value = v!;
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
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildTextFieldWidget(
                      minLines: 1,
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
    );
  }

  Widget _build243() {
    List<Section2ValueTextModel> values = Section2Model.s243.values;
    final s241 = Section2Model.s243;

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
                        s241.controller?.clear();

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildTextFieldWidget(
                minLines: 1,
                textAlign: TextAlign.start,
                enabled: isSelected,
                controller: s241.controller,
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
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
                            s241.weedController?.clear();
                            s241.percentController?.clear();
                            s241.controlWeedController?.clear();
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
              Row(
                children: [
                  const Expanded(
                    child: CustomText(
                      text: 'และท่านกำจัดวัชพืชหรือไม่อย่างไร',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextFieldWidget(
                      textAlign: TextAlign.start,
                      enabled: isSelected,
                      controller: s241.controlWeedController,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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

  Widget _build212() {
    List<Section2PVSModel> values = Section2Model.s212.values;
    return Column(
      children: values
          .map(
            (e) => Container(
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
                      validator: (value) {
                        if (value!.isEmpty) {
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

  Widget _build215() {
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

  Widget _build221() {
    List<Section2CheckVSModel> values = Section2Model.s221.values;
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
                              e.value = !e.value!;

                              e.controller?.clear();
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

  Widget _build226() {
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
                      Visibility(
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

  Widget _build231() {
    List<Section2ValueTextModel> values = Section2Model.s231.values;
    return Column(
      children: [
        Column(
          children: values
              .map(
                (e) => Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        value: e.value,
                        onChanged: (v) {
                          setState(() {
                            Section2Model.s231.yearController?.clear();
                            Section2Model.s231.detailController?.clear();
                            values.forEach((element) {
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
                ),
              )
              .toList(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomText(
                    text: '- ระยะเวลาที่ท่านต้องบำรุงดิน',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextFieldWidget(
                      enabled: values[1].value,
                      controller: Section2Model.s231.yearController,
                      validator: (value) {
                        if (values[1].value && value!.isEmpty) {
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
                  const CustomText(
                    text: 'ปี',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ],
              ),
              const CustomText(
                text: '- ท่านมีการบำรุงดินด้วยวิธีใด และทำอย่างไร(ไถกลบตอซัง/ปุ๋ยคอก/พืชบำรุงดิน)',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.start,
              ),
              const SizedBox(width: 10),
              _buildTextFieldWidget(
                textAlign: TextAlign.start,
                enabled: values[1].value,
                controller: Section2Model.s231.detailController,
                /*validator: (value) {
                  if (values[1].value && value!.isEmpty) {
                    return 'กรุณากรอกข้อมูล';
                  }
                  return null;
                },*/
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _build232() {
    S232 value = Section2Model.s232;
    return Row(
      children: [
        Expanded(
          child: _buildTextFieldWidget(
            controller: value.startMonthController,
            validator: (value) {
              if (value!.isEmpty) {
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
        const SizedBox(width: 10),
        const CustomText(
          text: '(ต้น,กลาง,ปลาย) เดือน',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildTextFieldWidget(
            controller: value.monthController,
            validator: (value) {
              if (value!.isEmpty) {
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
