import 'package:agri/models/group_model.dart';
import 'package:agri/screens/register/bloc/register_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButtonWidget(),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                    child: CustomText(
                  text: '1/3',
                  color: Colors.white,
                )),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: MediaQuery.of(context).size.width,
                color: ThemeConfig.primary,
                child: const CustomText(
                  text: 'สร้างบัญชีใหม่',
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        placeHolder: 'ชื่อ',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(RegisterFirstNameChanged(value));
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'กรุณากรอกชื่อ';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFieldWidget(
                        placeHolder: 'นามสกุล',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(RegisterLastNameChanged(value));
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'กรุณากรอกนามสกุล';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFieldWidget(
                        placeHolder: 'เบอร์โทร',
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(RegisterPhoneNumberChanged(value));
                        },
                        validator: (value) {
                          if (value.toString().length != 10) {
                            return 'กรุณากรอกเบอร์โทร';
                          }
                          return null;
                        },
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildDOB(context),
                      const SizedBox(height: 20),
                      _buildGroupWidget(context),
                      const SizedBox(height: 20),
                      CustomTextFieldWidget(
                        placeHolder: 'จำนวนที่นาปลูกข้าว/ไร่',
                        onChanged: (value) {
                          context
                              .read<RegisterBloc>()
                              .add(RegisterNumberFieldsChanged(double.parse(value)));
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'กรุณากรอกจำนวนที่นาปลูกข้าว/ไร่';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 30),
                      CupertinoButton(
                        color: ThemeConfig.buttonColor,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: const CustomText(text: 'แบบสอบถาม ข้อมูลด้านเกษตรกร', color: Colors.white),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.agriInformationScreen);
                        },
                      ),
                      SizedBox(height: 20),
                      _buildNextButtonWidget(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButtonWidget(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return CupertinoButton(
          color: ThemeConfig.buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          onPressed: () async {
            //Navigator.of(context).pushNamed(AppRoutes.optVerifyPage);
            if (_form.currentState!.validate()) {
              context.read<RegisterBloc>().add(RegisterNext(context));
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.isNextStepLoading
                  ? const Center(child: CupertinoActivityIndicator(color: Colors.white))
                  : const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          text: 'ถัดไป',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGroupWidget(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          //height: 50,
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ThemeConfig.primary, width: 2),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<GroupModelDatum>(
              isExpanded: true,
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
                offset: const Offset(0, -10),
              ),
              hint: Text(
                'เลือกกลุ่มของคุณ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              items: state.groups?.data
                  .map((GroupModelDatum item) => DropdownMenuItem<GroupModelDatum>(
                        value: item,
                        child: CustomText(
                          text: item.groupName ?? '',
                          color: Colors.black,
                          fontSize: 18,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.start,
                        ),
                      ))
                  .toList(),
              value: state.groupSelected,
              onChanged: (GroupModelDatum? value) {
                context.read<RegisterBloc>().add(RegisterGroupSelectedChanged(value!));
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                //height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                  // height: 40,
                  ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDOB(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            // context.read<RegisterBloc>().add(RegisterDateOfBirthChanged(DateTime.now().toString()));
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => Container(
                height: MediaQuery.of(context).size.height / 2.5,
                // padding: const EdgeInsets.only(top: 6.0),
                // The Bottom margin is provided to align the popup above the system
                // navigation bar.
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                // Provide a background color for the popup.
                color: CupertinoColors.systemBackground.resolveFrom(context),
                // Use a SafeArea widget to avoid system overlaps.
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomText(
                              text: 'เสร็จสิ้น',
                              color: ThemeConfig.primary,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                      Expanded(
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: selectedDate,
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (DateTime newDateTime) {
                            setState(() {
                              selectedDate = newDateTime;
                              context
                                  .read<RegisterBloc>()
                                  .add(RegisterDateOfBirthChanged(newDateTime));
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ThemeConfig.primary, width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: selectedDate.toString().split(' ')[0] ?? 'วันเกิด',
                  color: selectedDate != null ? Colors.black : Colors.grey,
                  fontSize: 20,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  color: ThemeConfig.primary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
