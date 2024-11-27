import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/section_3_model.dart';

class Section3AddMachinePage extends StatefulWidget {
  const Section3AddMachinePage({super.key});

  @override
  State<Section3AddMachinePage> createState() => _Section3AddMachinePageState();
}

class _Section3AddMachinePageState extends State<Section3AddMachinePage> {
  final TextEditingController _process = TextEditingController();
  final TextEditingController _typeMachine = TextEditingController();
  final TextEditingController _serviceFee = TextEditingController();
  final TextEditingController _other = TextEditingController();

  String _processor = '';
  String _processor1 = '';
  String _dicisionReason = '';

  final TextEditingController _name1 = TextEditingController();
  final TextEditingController _name2 = TextEditingController();
  final TextEditingController _name3 = TextEditingController();

  bool _isOwner = false;
  bool _isFamily = false;

  bool _isBigGroup = false;
  bool _isServiceForRent = false;

  bool _isInGroup = false;
  bool _isOutGroup = false;

  final List<bool> _reasonCheck = List.generate(12, (index) => false);

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
          title: const CustomText(
            text: 'เพิ่มการใช้งานเครื่องจักร',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff103300),
          ),
          leading: const BackButtonWidget(),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'กระบวนการผลิตข้าว',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                CupertinoTextField(
                  controller: _process,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: 'ชนิดเครื่องจักร',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                CupertinoTextField(
                  controller: _typeMachine,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: 'ผู้ครอบครองเครื่องจักร',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      value: _isOwner,
                      onChanged: (v) {
                        setState(() {
                          _isOwner = v!;
                          _isFamily = false;
                          _isBigGroup = false;
                          _isInGroup = false;
                          _isOutGroup = false;
                          _isServiceForRent = false;
                          _name1.clear();
                          _name2.clear();
                          _name3.clear();
                        });

                        if (_isOwner) {
                          _processor = 'ของตนเอง';
                          _processor1 = '';
                        } else {
                          _processor = '';
                        }
                      },
                    ),
                    const CustomText(
                      text: 'ของตนเอง',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      value: _isFamily,
                      onChanged: (v) {
                        setState(() {
                          _isFamily = v!;
                          _isOwner = false;
                          _isServiceForRent = false;
                          _isBigGroup = false;
                          _isInGroup = false;
                          _isOutGroup = false;
                          _name2.clear();
                          _name3.clear();
                        });

                        if (_isFamily) {
                          _processor = 'เพื่อนบ้าน/เครือญาติ';
                          _processor1 = '';
                        } else {
                          _processor = '';
                        }
                      },
                    ),
                    const CustomText(
                      text: 'เพื่อนบ้าน/เครือญาติ',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Row(
                    children: [
                      const CustomText(
                        text: 'ชื่อ',
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CupertinoTextField(
                          controller: _name1,
                          enabled: _isFamily,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      value: _isBigGroup,
                      onChanged: (v) {
                        setState(() {
                          _isBigGroup = v!;
                          _isOwner = false;
                          _isFamily = false;
                          _isServiceForRent = false;
                          _isInGroup = false;
                          _isOutGroup = false;
                          _name1.clear();
                          _name2.clear();
                          _name3.clear();
                        });

                        if (_isBigGroup) {
                          _processor = 'ของกลุ่มแปลงใหญ่';
                          _processor1 = '';
                        } else {
                          _processor = '';
                        }
                      },
                    ),
                    const CustomText(
                      text: 'ของกลุ่มแปลงใหญ่',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      value: _isServiceForRent,
                      onChanged: (v) {
                        setState(() {
                          _isServiceForRent = v!;
                          _isBigGroup = false;
                          _isOwner = false;
                          _isFamily = false;
                          _name1.clear();

                          if (_isServiceForRent == false) {
                            _isInGroup = false;
                            _isOutGroup = false;
                          }
                        });

                        if (_isBigGroup) {
                          _processor = 'ใช้บริการจ้าง (คนนอก)';
                        } else {
                          _processor = '';
                        }
                      },
                    ),
                    const CustomText(
                      text: 'ใช้บริการจ้าง (คนนอก)',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            value: _isInGroup,
                            onChanged: (v) {
                              setState(() {
                                _isInGroup = v!;
                                _isOutGroup = false;
                                _isBigGroup = false;
                                _isOwner = false;
                                _isFamily = false;
                                _name1.clear();
                                _name3.clear();
                              });

                              if (_isInGroup) {
                                _processor = 'ใช้บริการจ้าง (คนนอก)';
                              } else {
                                _processor = '';
                              }
                            },
                          ),
                          const CustomText(
                            text: 'ในชุมชน',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: 'ชื่อ',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CupertinoTextField(
                              controller: _name2,
                              enabled: _isInGroup,
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            value: _isOutGroup,
                            onChanged: (v) {
                              setState(() {
                                _isOutGroup = v!;
                                _isInGroup = false;
                                _isBigGroup = false;
                                _isOwner = false;
                                _isFamily = false;
                                _name2.clear();
                              });

                              if (_isOutGroup) {
                                _processor = 'ใช้บริการจ้าง (คนนอก)';
                              } else {
                                _processor = '';
                              }
                            },
                          ),
                          const CustomText(
                            text: 'นอกชุมชน',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: 'ชื่อ',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CupertinoTextField(
                              controller: _name3,
                              enabled: _isOutGroup,
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: 'ค่าบริการ (บาท)',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                CupertinoTextField(
                  controller: _serviceFee,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text:
                      'เหตุผลสำคัญในการตัดสินใจเลือกผู้ให้บริการเครื่องจักรของท่านที่ผ่านมา (เลือกได้หลายข้อตามข้อเท็จจริงที่เกิดขึ้น)',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                _buildReasonCheckWidget(
                  title: 'รักษาความสัมพันธ์ระหว่างเจ้าของแปลงกับผู้ให้บริการ',
                  value: _reasonCheck[0],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[0] = v!;
                      if(!_reasonCheck[0]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' รักษาความสัมพันธ์ระหว่างเจ้าของแปลงกับผู้ให้บริการ';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'เครื่องจักรกลมีประสิทธิภาพสูง',
                  value: _reasonCheck[1],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[1] = v!;
                      if(!_reasonCheck[1]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' เครื่องจักรกลมีประสิทธิภาพสูง';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'เครื่องจักรกลมีสภาพใหม่',
                  value: _reasonCheck[2],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[2] = v!;
                      if(!_reasonCheck[2]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' เครื่องจักรกลมีสภาพใหม่';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'ค่าบริการถูกกว่าเจ้าอื่นๆ',
                  value: _reasonCheck[3],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[3] = v!;
                      if(!_reasonCheck[3]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' ค่าบริการถูกกว่าเจ้าอื่นๆ';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'สามารถจ่ายค่าบริการเป็นระบบเงินเชื่อ',
                  value: _reasonCheck[4],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[4] = v!;
                      if(!_reasonCheck[4]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' สามารถจ่ายค่าบริการเป็นระบบเงินเชื่อ';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'สามารถให้บริการได้ตามวันและ/หรือเวลาตามที่เราจองไว้ได้',
                  value: _reasonCheck[5],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[5] = v!;
                      if(!_reasonCheck[5]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' สามารถให้บริการได้ตามวันและ/หรือเวลาตามที่เราจองไว้ได้';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'สามารถลัดคิวได้',
                  value: _reasonCheck[6],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[6] = v!;
                      if(!_reasonCheck[6]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' สามารถลัดคิวได้';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'ทักษะความชำนาญของผู้ขับรถ/ควบคุมเครื่องจักร',
                  value: _reasonCheck[7],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[7] = v!;
                      if(!_reasonCheck[7]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' ทักษะความชำนาญของผู้ขับรถ/ควบคุมเครื่องจักร';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'ทำงานได้เสร็จทันเวลาที่กำหนด',
                  value: _reasonCheck[8],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[8] = v!;
                      if(!_reasonCheck[8]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' ทำงานได้เสร็จทันเวลาที่กำหนด';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'ผู้ให้บริการสามารถให้บริการตามความต้องการของเราได้',
                  value: _reasonCheck[9],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[9] = v!;
                      if(!_reasonCheck[9]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' ผู้ให้บริการสามารถให้บริการตามความต้องการของเราได้';
                    });
                  },
                ),
                _buildReasonCheckWidget(
                  title: 'สะดวกในการเดินทางไปใช้บริการ',
                  value: _reasonCheck[10],
                  onChanged: (v) {
                    setState(() {
                      _reasonCheck[10] = v!;
                      if(!_reasonCheck[10]){
                        _dicisionReason = '';
                        return;
                      }
                      _dicisionReason += ' สะดวกในการเดินทางไปใช้บริการ';
                    });
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildReasonCheckWidget(
                        title: 'อื่นๆ (ระบุ)',
                        value: _reasonCheck[11],
                        onChanged: (v) {
                          setState(() {
                            _reasonCheck[11] = v!;
                            if(!_reasonCheck[11]){
                              _dicisionReason = '';
                              return;
                            }
                            _dicisionReason += ' อื่นๆ (ระบุ)';
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CupertinoTextField(
                        controller: _other,
                        enabled: _reasonCheck[11],
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                        color: const Color(0xff194902),
                        child: const CustomText(text: 'เพิ่ม', color: Colors.white),
                        onPressed: () {
                          if (kDebugMode) {
                            print('process : ${_process.text}');
                            print('typeMachine : ${_typeMachine.text}');
                          }

                          bool _isCheckReason =
                              _reasonCheck.where((element) => element == true).isEmpty;
                          print('isCheckReason : $_isCheckReason');
                          if (_process.text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกกระบวนการผลิตข้าว',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_typeMachine.text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกชนิดเครื่องจักร',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_isOwner) {
                            _processor = 'ของตนเอง';
                            _processor1 = '';
                          }

                          if (_isFamily) {
                            if (_name1.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: 'กรุณากรอกชื่อ',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              return;
                            }
                            _processor = 'เพื่อนบ้าน/เครือญาติ';
                            _processor1 = 'ชื่อ ${_name1.text}';
                          }

                          if (_isBigGroup) {
                            _processor = 'ของกลุ่มแปลงใหญ่';
                            _processor1 = '';
                          }

                          if (_isServiceForRent && !_isInGroup && !_isOutGroup) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกในชุมชนหรือนอกชุมชน',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_isServiceForRent && _isInGroup) {
                            if (_name2.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: 'กรุณากรอกชื่อ',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              return;
                            }
                            _processor = 'ใช้บริการจ้าง (คนนอก)';
                            _processor1 = 'ในชุมชน ชื่อ ${_name2.text}';
                          }
                          if (_isServiceForRent && _isOutGroup) {
                            if (_name3.text.isEmpty) {
                              Fluttertoast.showToast(
                                msg: 'กรุณากรอกชื่อ',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              return;
                            }
                            _processor = 'ใช้บริการจ้าง (คนนอก)';
                            _processor1 = 'นอกชุมชน ชื่อ ${_name3.text}';
                            setState(() {});
                          }

                          if (_serviceFee.text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกค่าบริการ',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_isCheckReason) {
                            Fluttertoast.showToast(
                              msg: 'กรุณาเลือกเหตุผลสำคัญในการตัดสินใจ',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }
                          if (_reasonCheck[11] && _other.text.isEmpty) {
                            Fluttertoast.showToast(
                              msg: 'กรุณากรอกเหตุผลอื่นๆ',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            return;
                          }

                          if (_reasonCheck[11] && _other.text.isNotEmpty) {
                            _dicisionReason = ' ${_other.text}';
                          }

                          print('processor : $_processor');
                          print('processor1 : $_processor1');
                          print('serviceFee : ${_serviceFee.text}');
                          print('dicisionReason : $_dicisionReason');

                          Section3Model.data3.add(Section3Model(
                            process: _process.text,
                            typeMachine: _typeMachine.text,
                            prossessor: _processor,
                            prossessor1: _processor1,
                            serviceFee: _serviceFee.text,
                            dicisionReason: _dicisionReason,
                          ));
                          setState(() {});
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 10),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                        color: Colors.grey,
                        child: const CustomText(text: 'ยกเลิก', color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReasonCheckWidget({
    required String title,
    required bool value,
    required void Function(bool?)? onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: CustomText(
            text: title,
            fontSize: 16,
            color: Colors.black,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
