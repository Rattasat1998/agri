import 'package:agri/screens/profile/pages/agri_information/info_image.dart';
import 'package:agri/screens/profile/pages/agri_information/models/staff_info_data_model.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../utils/themes.dart';
import '../bloc/agri_info_bloc.dart';
import '../models/staff_info_model.dart';

class InterviewStaffPage extends StatefulWidget {
  final List<Interviewer> staffs;
  final StaffInfoDataModel? staffData;

  const InterviewStaffPage({
    super.key,
    required this.staffs,
    this.staffData,
  });

  @override
  State<InterviewStaffPage> createState() => _InterviewStaffPageState();
}

class _InterviewStaffPageState extends State<InterviewStaffPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _staffNameController = TextEditingController();
  final TextEditingController _staffAddressController = TextEditingController();
  final TextEditingController _staffTambonController = TextEditingController();
  final TextEditingController _staffAmphurController = TextEditingController();
  final TextEditingController _staffProvinceController = TextEditingController();
  final TextEditingController _staffZipcodeController = TextEditingController();
  final TextEditingController _staffPhoneController = TextEditingController();
  Interviewer? _selectedStaff;
  DateTime? _interviewDate;

  _onSelectStaff(Interviewer? staff) {
    setState(() {
      _selectedStaff = staff;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.staffData != null) {
      _staffNameController.text = widget.staffData!.staffName;
      _staffAddressController.text = widget.staffData!.staffAddress;
      _staffTambonController.text = widget.staffData!.staffTambon;
      _staffAmphurController.text = widget.staffData!.staffAmphur;
      _staffProvinceController.text = widget.staffData!.staffProvince;
      _staffZipcodeController.text = widget.staffData!.staffZipcode;
      _staffPhoneController.text = widget.staffData!.staffPhone;
      _interviewDate = widget.staffData!.interviewDate;
      _selectedStaff = widget.staffData!.selectedStaff;
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButtonWidget(),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(InfoImages.interview, width: 200, height: 200),
                const SizedBox(height: 20),
                const CustomText(
                  text: 'บันทึกข้อมูลสำหรับพนักงานสัมภาษณ์',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                _buildDropdownInterviewStaffWidget(context),
                _buildInterviewPersonalWidget(context),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      color: const Color(0xff194902),
                      child: const CustomText(
                        text: 'บันทึกข้อมูล',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (_selectedStaff == null) {
                          Fluttertoast.showToast(
                            msg: 'กรุณาเลือกพนักงานสัมภาษณ์',
                            backgroundColor: Colors.red,
                            gravity: ToastGravity.CENTER,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 3,
                          );
                          return;
                        }
                        if (_interviewDate == null) {
                          Fluttertoast.showToast(
                            msg: 'กรุณาเลือกวันที่สัมภาษณ์',
                            backgroundColor: Colors.red,
                            gravity: ToastGravity.CENTER,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 3,
                          );
                          return;
                        }

                        if (_formKey.currentState!.validate()) {
                          context.read<AgriInfoBloc>().add(
                            AddInterviewDataEvent(
                              staffName: _staffNameController.text,
                              staffAddress: _staffAddressController.text,
                              staffTambon: _staffTambonController.text,
                              staffAmphur: _staffAmphurController.text,
                              staffProvince: _staffProvinceController.text,
                              staffZipcode: _staffZipcodeController.text,
                              staffPhone: _staffPhoneController.text,
                              interviewDate: _interviewDate!,
                              selectedStaff: _selectedStaff,
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInterviewPersonalWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'ข้อมูลผู้ให้สัมภาษณ์',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: 'ชื่อ-สกุล',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            _buildInputTextWidget(
              controller: _staffNameController,
              hintText: 'ชื่อ-สกุล',
              minLines: 1,
              maxLines: 1,
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: 'ที่อยู่',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            _buildInputTextWidget(
              controller: _staffAddressController,
              hintText: 'ที่อยู่',
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 10,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputTextWidget(
                        controller: _staffTambonController,
                        hintText: 'ตำบล',
                        minLines: 1,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputTextWidget(
                        controller: _staffAmphurController,
                        hintText: 'อำเภอ',
                        minLines: 1,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputTextWidget(
                        controller: _staffProvinceController,
                        hintText: 'จังหวัด',
                        minLines: 1,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputTextWidget(
                        controller: _staffZipcodeController,
                        hintText: 'รหัสไปรษณีย์',
                        minLines: 1,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputTextWidget(
                        controller: _staffPhoneController,
                        hintText: 'เบอร์โทรศัพท์',
                        minLines: 1,
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ThemeConfig.primary, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: _interviewDate != null
                                    ? _interviewDate.toString().substring(0, 10)
                                    : 'วันที่สัมภาษณ์',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: _interviewDate != null ? Colors.black : Colors.grey[600],
                              ),
                              Icon(
                                Icons.timer,
                                color: _interviewDate != null ? Colors.black : Colors.grey[600],
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => _showDialog(context),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildInputTextWidget({
    required TextEditingController controller,
    required String hintText,
    required int maxLines,
    required int minLines,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: (v) => setState(() {}),
      keyboardType: keyboardType ?? TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        hintText: hintText,
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
        suffixIcon: Visibility(
          visible: controller.text.isNotEmpty,
          child: GestureDetector(
              onTap: () {
                controller.clear();
                setState(() {});
              },
              child: const Icon(Icons.clear, color: Colors.green)),
        ),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'กรุณากรอกข้อมูล $hintText';
        }
        return null;
      },
      minLines: minLines,
      maxLines: maxLines,
    );
  }

  Widget _buildDropdownInterviewStaffWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'พนักงานสัมภาษณ์',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<Interviewer>(
              value: _selectedStaff,
              hint: Text(
                "กรุณาเลือกพนักงานสัมภาษณ์",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.bold),
              ),
              items: widget.staffs.map<DropdownMenuItem<Interviewer>>((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      CustomText(
                        text: e.interviewerName ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              }).toList(),
              isDense: true,
              onChanged: (v) => _onSelectStaff(v),
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Theme.of(context).primaryColor,
                  border: Border.all(color: Colors.grey[500]!.withOpacity(.3)),
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
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, s) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const CustomText(
                text: 'เลือกวันที่',
                color: Colors.black,
                fontSize: 24,
              ),
              content: SizedBox(
                height: 450,
                width: 450,
                child: TableCalendar(
                  locale: 'th_TH',
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronPadding: const EdgeInsets.all(0),
                    leftChevronMargin: const EdgeInsets.all(0),
                    rightChevronPadding: const EdgeInsets.all(0),
                    rightChevronMargin: const EdgeInsets.all(0),
                    rightChevronIcon: Icon(Icons.chevron_right, color: ThemeConfig.primary),
                    leftChevronIcon: Icon(Icons.chevron_left, color: ThemeConfig.primary),
                    titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Colors.black, fontSize: 14),
                    weekendStyle: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  calendarStyle: CalendarStyle(
                    todayTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    todayDecoration: BoxDecoration(
                      color: ThemeConfig.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _interviewDate ?? DateTime.now(),
                  currentDay: _interviewDate ?? DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _interviewDate = DateTime(
                        selectedDay.year,
                        selectedDay.month,
                        selectedDay.day,
                        DateTime.now().hour,
                        DateTime.now().minute,
                        DateTime.now().second,
                      );

                    });
                    s(() {});
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustomText(
                    text: 'ยกเลิก',
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: ThemeConfig.primary,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustomText(
                    text: 'ตกลง',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
