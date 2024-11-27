import 'package:agri/screens/home/pages/training_schedule/bloc/training_bloc.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../repository/training_repository.dart';

class AddEditTrainingPage extends StatefulWidget {
  final bool isEdit;

  const AddEditTrainingPage({super.key, required this.isEdit});

  @override
  State<AddEditTrainingPage> createState() => _AddEditTrainingPageState();
}

class _AddEditTrainingPageState extends State<AddEditTrainingPage> {
  final _formKey = GlobalKey<FormState>();
  final TrainingRepository trainingRepository = TrainingRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButtonWidget(),
      ),
      body: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          if (state is TrainingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrainingLoaded) {
            final logo = state.logo?.data?.logoLists ?? [];
            return ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConfig.primary,
                  child: CustomText(
                    text: widget.isEdit ? 'แก้ไข การอบรม' : 'เพิ่ม การอบรม',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      state.selectedLogo == null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey.shade400,
                              child: const Icon(
                                Icons.photo,
                                color: Colors.white,
                                size: 60,
                              ),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey.shade400,
                              backgroundImage: NetworkImage(state.selectedLogo!.img!),
                            ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(text: 'Logo', fontSize: 16),
                          DropdownButton2(
                            underline: Container(),
                            buttonStyleData: ButtonStyleData(
                              // width: MediaQuery.of(context).size.width / 2.5,
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                              ),
                            ),
                            items: logo
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Row(
                                        children: [
                                          Image.network(e.img!, height: 50, width: 50),
                                          SizedBox(width: 16),
                                          CustomText(text: e.imgName!, fontSize: 16),
                                        ],
                                      ),
                                    ))
                                .toList(),
                            selectedItemBuilder: (context) => logo
                                .map((e) => Row(
                                      children: [
                                        //Image.network(e.img!, height: 50, width: 50),
                                        CustomText(text: e.imgName!, fontSize: 16),
                                      ],
                                    ))
                                .toList(),
                            onChanged: (value) {
                              context
                                  .read<TrainingBloc>()
                                  .add(TrainingOnSelectedLogoEvent(logo: value!));
                            },
                            value: state.selectedLogo,
                            hint: const CustomText(
                                text: 'เลือกโลโก้', fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                          placeHolder: 'ชื่อเรื่อง',
                          controller: state.trainingNameController,
                          // borderSideColor: Colors.grey,
                          onChanged: (value) {
                            // context.read<NewsBloc>().add(RegisterLastNameChanged(value));
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'กรุณากรอกชื่อเรื่อง';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFieldWidget(
                          placeHolder: 'สถานที่อบรม',
                          controller: state.trainingDetailController,
                          //borderSideColor: Colors.grey,
                          onChanged: (value) {
                            // context.read<NewsBloc>().add(RegisterLastNameChanged(value));
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'กรุณากรอกสถานที่อบรม';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          maxLine: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
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
                                      onPressed: () {
                                        if (state.date == null) {
                                         /* context
                                              .read<TrainingBloc>()
                                              .add(TrainingDateChangeEvent(date: DateTime.now()));*/
                                          setState(() {
                                            state.date = DateTime.now();
                                          });
                                        } else {
                                          setState(() {
                                            state.date = state.date;
                                          });
                                          /*context
                                              .read<TrainingBloc>()
                                              .add(TrainingDateChangeEvent(date: state.date!));*/

                                        }
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: state.date ?? DateTime.now(),
                                    maximumDate: DateTime(2030, 12, 30),
                                    onDateTimeChanged: (DateTime newDateTime) {
                                     /* context
                                          .read<TrainingBloc>()
                                          .add(TrainingDateChangeEvent(date: newDateTime));*/
                                      setState(() {
                                         state.date = newDateTime;
                                      });
                                      /*context
                                          .read<RegisterBloc>()
                                          .add(RegisterDateOfBirthChanged(newDateTime.toString()));*/
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
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ThemeConfig.primary, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Spacer(),
                          Expanded(
                            child: CustomText(
                              text: state.date != null
                                  ? state.date.toString().split(' ')[0]
                                  : 'วันอบรม',
                              color: state.date != null ? Colors.black : Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          // Spacer(),
                          Icon(
                            Icons.calendar_today_outlined,
                            color: ThemeConfig.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
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
                                      onPressed: () {
                                        if (state.time == null) {
                                          /*context
                                              .read<TrainingBloc>()
                                              .add(TrainingTimeChangeEvent(time: DateTime.now()));*/
                                          setState(() {
                                            state.time = DateTime.now();
                                          });
                                          Navigator.of(context).pop();
                                        } else {
                                          /*context
                                              .read<TrainingBloc>()
                                              .add(TrainingTimeChangeEvent(time: state.time!));*/
                                          setState(() {
                                            state.time = state.time;
                                          });
                                        Navigator.of(context).pop();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: state.time,
                                    use24hFormat: true,
                                    maximumDate:state.time ?? DateTime.now(),
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      /*context
                                          .read<TrainingBloc>()
                                          .add(TrainingTimeChangeEvent(time: newDateTime));*/
                                      setState(() {
                                        state.time = newDateTime;
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
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ThemeConfig.primary, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Spacer(),
                          Expanded(
                            child: CustomText(
                              text: state.time == null
                                  ? 'เวลาอบรม'
                                  : state.time.toString().split(' ')[1].substring(0, 5),
                              color: state.time != null ? Colors.black : Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          // Spacer(),
                          Icon(
                            Icons.timer_outlined,
                            color: ThemeConfig.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Spacer(),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CupertinoButton(
                      color: ThemeConfig.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: CustomText(
                        text: widget.isEdit ? 'บันทึก' : 'เพิ่มการอบรม',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      onPressed: () async {
                        try {
                          if (_formKey.currentState!.validate() &&
                              state.date != null &&
                              state.time != null &&
                              state.selectedLogo != null) {
                            setState(() {
                              state.isLoading = true;
                            });
                            try {
                              EasyLoading.show(status: 'กำลังโหลด');
                             final response =  await trainingRepository.addEditTraining(
                                date: state.date.toString().split(' ')[0],
                                time: DateFormat('HH:mm').format(state.time??DateTime.now()),
                                logoId: state.selectedLogo?.imgId.toString() ?? '',
                                title: state.trainingNameController.text,
                                detail: state.trainingDetailController.text,
                                isEdit: widget.isEdit,
                                trainingId: widget.isEdit ? state.trainingId : '',
                              );

                              if(response['result']){
                                if (widget.isEdit) {
                                  EasyLoading.dismiss();
                                  CustomDialog.showCustomDialog(
                                    context: context,
                                    title: '',
                                    description: 'แก้ไขข้อมูลการอบรมเรียบร้อยแล้ว',
                                    icon: Image.asset(
                                      ImageProviders.success,
                                      height: 100,
                                      width: 100,
                                    ),
                                    onPressed: () {
                                      //Get.back();
                                      Get.back();
                                      Get.back();
                                      context
                                          .read<TrainingBloc>()
                                          .add(GetTrainingByIdEvent(id: state.trainingId!));
                                      //context.read<TrainingBloc>().add(TrainingInitialEvent());
                                    },
                                  );
                                } else {
                                  EasyLoading.dismiss();
                                  CustomDialog.showCustomDialog(
                                    context: context,
                                    title: '',
                                    description: 'ได้เพิ่มข่าวสารเรียบร้อยแล้ว',
                                    icon: const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 100,
                                    ),
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                      context.read<TrainingBloc>().add(TrainingInitialEvent());
                                      // context.read<TrainingBloc>().add(NewsInitialEvent());
                                    },
                                  );
                                }
                              } else {
                                EasyLoading.dismiss();
                                CustomDialog.showCustomDialog(
                                  context: context,
                                  title: '',
                                  description: response['message'],
                                  icon: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 100,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                );
                              }

                              setState(() {
                                state.isLoading = false;
                              });
                            } catch (e,t) {
                              print(e);
                              print(t);
                            }
                            // context.read<NewsBloc>().add(RegisterButtonPressed());
                          } else {
                            print('add news called 3');
                            CustomDialog.showCustomDialog(
                              context: context,
                              title: '',
                              description: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                              icon: const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 100,
                              ),
                              onPressed: () {
                                Navigator.of(context,rootNavigator: true).pop();
                              },
                            );
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
