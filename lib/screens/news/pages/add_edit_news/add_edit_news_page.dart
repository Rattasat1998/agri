import 'dart:io';

import 'package:agri/models/category_model.dart';
import 'package:agri/screens/news/blocs/news_bloc/news_bloc.dart';
import 'package:agri/utils/image_picker_providers.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_model.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddEditNewsPage extends StatefulWidget {
  final bool isEdit;

  const AddEditNewsPage({super.key, required this.isEdit});

  @override
  State<AddEditNewsPage> createState() => _AddEditNewsPageState();
}

class _AddEditNewsPageState extends State<AddEditNewsPage> {
  final _formKey = GlobalKey<FormState>();

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
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButtonWidget(),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is NewsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width,
                      color: ThemeConfig.primary,
                      child: CustomText(
                        text: widget.isEdit
                            ? 'แก้ไข ข่าวสาร/ประชาสัมพันธ์'
                            : 'เพิ่ม ข่าวสาร/ประชาสัมพันธ์',
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: state.newImagePath != null
                          ? Image.file(File(state.newImagePath!.path), fit: BoxFit.contain)
                          : state.oldImagePath.isNotEmpty
                              ? Image.network(state.oldImagePath, fit: BoxFit.contain)
                              : Icon(
                                  Icons.photo,
                                  size: 100,
                                  color: Colors.grey[400],
                                ),
                    ),
                    const SizedBox(height: 10),
                    _buildSelectImageWidget(context),
                    const SizedBox(height: 10),
                    _buildTypeNewsWidget(context),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFieldWidget(
                              placeHolder: 'ชื่อข่าว',
                              controller: state.editNewsTitleController,
                              borderSideColor: Colors.grey,
                              onChanged: (value) {
                                // context.read<NewsBloc>().add(RegisterLastNameChanged(value));
                              },
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'กรุณากรอกชื่อข่าว';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFieldWidget(
                              placeHolder: 'รายละเอียดข่าว',
                              controller: state.editNewsDetailController,
                              borderSideColor: Colors.grey,
                              onChanged: (value) {
                                // context.read<NewsBloc>().add(RegisterLastNameChanged(value));
                              },
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'กรุณากรอกรายละเอียดข่าว';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.multiline,
                              maxLine: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CupertinoButton(
                          color: ThemeConfig.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: CustomText(
                            text: widget.isEdit ? 'แก้ไขข่าว' : 'เพิ่มข่าว',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          onPressed: () async {
                            print('add news called1');
                            try {
                              print(state.editNewsTitleController.text);
                              if (_formKey.currentState!.validate() &&
                                  state.categorySelected != null && state.editNewsTitleController.text.isNotEmpty && state.editNewsDetailController.text.isNotEmpty) {
                                if (widget.isEdit) {
                                  context.read<NewsBloc>().add(AddOrEditEvent(isEdit: widget.isEdit,context: context));
                                  // await context.read<NewsBloc>().stream.first;

                                } else {
                                  print('add news called 2');
                                  context.read<NewsBloc>().add(AddOrEditEvent(isEdit: widget.isEdit,context: context));
                                  //await context.read<NewsBloc>().stream.first;

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
                                    Get.back();
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
                    const SizedBox(height: 50),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildTypeNewsWidget(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          final category = state.categoryModel.data!.category;
          return Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<Category>(
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
                  'เลือกหมวดหมู่',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                items: category
                    .where((element) => element.categoryId != 9999)
                    .map((Category item) => DropdownMenuItem<Category>(
                          value: item,
                          child: CustomText(
                            text: item.categoryName ?? '',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ))
                    .toList(),
                value: state.categorySelected,
                onChanged: (Category? value) {
                  context.read<NewsBloc>().add(CategoryAddEditSelectedEvent(category: value!));
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Padding _buildSelectImageWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CupertinoButton(
        color: const Color(0xff787878),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: const CustomText(
          text: 'เลือกรูปภาพ',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        onPressed: () {
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
                        final croppedFile =
                            await ImagePickerProvider().cropPhoto(context: context, photo: file);
                        if (croppedFile != null) {
                          context.read<NewsBloc>().add(NewsSelectImageEvent(image: croppedFile!));
                        }
                        /*context.read<ProfileBloc>().add(ChangeProfile(profileImg: file.path));
                            await context.read<ProfileBloc>().stream.first;
                            context.read<HomeBloc>().add(HomeInitialEvent());*/
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
                        final croppedFile =
                            await ImagePickerProvider().cropPhoto(context: context, photo: file);
                        if (croppedFile != null) {
                          context.read<NewsBloc>().add(NewsSelectImageEvent(image: croppedFile));
                        }
                        // context.read<ProfileBloc>().add(ChangeProfile(profileImg: file.path));
                      }
                    },
                    trailing: const Icon(Icons.camera_alt),
                  ),
                  const SizedBox(height: 16),
                ],
              ));
        },
      ),
    );
  }
}
