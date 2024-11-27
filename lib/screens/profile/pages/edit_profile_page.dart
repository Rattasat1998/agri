import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/profile/bloc/profile_bloc.dart';
import 'package:agri/screens/profile/models/profile_model.dart';
import 'package:agri/utils/image_picker_providers.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_model.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/custom_profile_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff9ABC95),
        appBar: AppBar(
          backgroundColor: const Color(0xff9ABC95),
          elevation: 0,
          leading: const BackButtonWidget(),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileLoaded) {
              final profile = state.profileModel.data!.profile!;
              return ListView(
                children: [
                  _buildProfileWidget(context,profile),
                  const SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    //margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                            text: 'ชื่อ',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        _buildDataWidget(
                            context: context,
                            controller: state.firstnameController,
                            onTap: () {
                              _buildModal(
                                context: context,
                                title: 'แก้ไข ชื่อ',
                                placeHolder: 'ชื่อ',
                                state: state,
                                controller: state.firstnameController,
                                onTap: () {
                                  context.read<ProfileBloc>().add(EditFirstName());
                                  Get.back();
                                },
                              );
                            }),

                        /**/
                        const SizedBox(height: 20),
                        const CustomText(
                            text: 'นามสกุล',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        _buildDataWidget(
                            context: context,
                            controller: state.lastnameController,
                            onTap: () {
                              _buildModal(
                                context: context,
                                title: 'แก้ไข นามสกุล',
                                placeHolder: 'นามสกุล',
                                state: state,
                                controller: state.lastnameController,
                                onTap: () {
                                  context.read<ProfileBloc>().add(EditLastName());
                                  Get.back();
                                },
                              );
                            }),
                        const SizedBox(height: 20),
                        const CustomText(
                            text: 'วันเกิด',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        _buildDateOfBirthWidget(context, state),
                        const SizedBox(height: 20),
                        const CustomText(
                            text: 'เบอร์โทรศัพท์',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        _buildDataWidget(
                          context: context,
                          controller: state.telController,
                          onTap: () {},
                          isEditable: false,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildDataWidget({
    required BuildContext context,
    required TextEditingController controller,
    required Function()? onTap,
    bool? isEditable = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: ThemeConfig.primary,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: controller.text,
              textAlign: TextAlign.start,
              color: Colors.black,
              fontSize: 20,
            ),
            Visibility(
              visible: isEditable!,
              child: Icon(
                Icons.edit,
                color: ThemeConfig.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildDateOfBirthWidget(BuildContext context, ProfileLoaded state) {
    return GestureDetector(
      onTap: () {
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
                          Navigator.of(context).pop();
                          context.read<ProfileBloc>().add(EditDateOfBirth());
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.parse(state.dateOfBirth),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        context.read<ProfileBloc>().add(ChangeDateOfBirth(dateOfBirth: newDateTime.toString()));
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: CupertinoButton(
                      color: ThemeConfig.primary,
                      onPressed: (){
                        Navigator.of(context).pop();
                        context.read<ProfileBloc>().add(EditDateOfBirth());
                      },
                      child: const CustomText(
                        text: 'บันทึก',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
              text: state.dateOfBirth.split(' ')[0],
              color: state.dateOfBirth.isNotEmpty ? Colors.black : Colors.grey,
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
  }


  Container _buildProfileWidget(BuildContext context,ProfileModel profile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff496C39),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {

                  CustomModal().showModal(
                      context: context,
                      child: Column(
                        children: [
                          const CustomText(
                            text: 'เลือกรูปภาพจาก',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 16),
                          ListTile(
                            title: const CustomText(
                              text: 'รูปภาพ',
                              fontSize: 18,
                              textAlign: TextAlign.start,
                            ),
                            onTap: () async {
                              Get.back();
                              XFile? file = await ImagePickerProvider().photoPicker();
                              if (file != null) {
                               context.read<ProfileBloc>().add(ChangeProfile(profileImg: file.path));
                               await context.read<ProfileBloc>().stream.first;
                               context.read<HomeBloc>().add(HomeInitialEvent());
                              }
                            },
                            trailing: const Icon(Icons.image),
                          ),
                          const Divider(),
                          ListTile(
                            title: const CustomText(
                              text: 'กล้อง',
                              fontSize: 18,
                              textAlign: TextAlign.start,
                            ),
                            onTap: () async {
                              Get.back();
                              XFile? file = await ImagePickerProvider().cameraPicker();
                              if (file != null) {
                                context.read<ProfileBloc>().add(ChangeProfile(profileImg: file.path));
                                await context.read<ProfileBloc>().stream.first;
                                context.read<HomeBloc>().add(HomeInitialEvent());
                              }
                            },
                            trailing: const Icon(Icons.camera_alt),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ));

                   context.read<ProfileBloc>().add(ChangeProfile(profileImg: ''));
                },
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child:  CustomProfileWidget(profileImg: profile.profileImg ?? ''),
                    ),
                    Positioned(
                      bottom: -10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xff206102),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomText(
                  text: '${profile.firstname!} ${profile.lastname!}',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void _buildModal({
    required BuildContext context,
    required String title,
    required String placeHolder,
    required ProfileLoaded state,
    required TextEditingController controller,
    required Function() onTap,
  }) {
    CustomModal().showModal(
        context: context,
        child: Column(
          children: [
            CustomText(
              text: title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            CustomTextFieldWidget(
              placeHolder: placeHolder,
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                color: ThemeConfig.primary,
                onPressed: onTap,
                child: const CustomText(
                  text: 'บันทึก',
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ));
  }
}
