import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/head_add_edit_machinery_page.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/app_bar_title_widget.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../repository/agricultural_repository.dart';

class HeadManageMachineryPage extends StatefulWidget {
  const HeadManageMachineryPage({super.key});

  @override
  State<HeadManageMachineryPage> createState() => _HeadManageMachineryPageState();
}

class _HeadManageMachineryPageState extends State<HeadManageMachineryPage> {
  final AgriculturalRepository _agriculturalRepository = AgriculturalRepository();

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
      body: BlocBuilder<AgriculturalInformationBloc, AgriculturalInformationState>(
        builder: (context, state) {
          if (state is AgriculturalInformationLoaded) {
            List<GroupMachineModelDataMachine> machines = state.groupMachineHeadModel ?? [];

            return ListView(
              children: [
                AppBarTitleWidget(
                  title: 'บริหารเครื่องจักร',
                  action: CupertinoButton(
                    padding: EdgeInsets.zero,
                    color: const Color(0xff81C159),
                    onPressed: () async {
                      //state.mapController?.dispose();
                      context.read<AgriculturalInformationBloc>().add(LoadMachineryTypesEvent());
                      await Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const HeadAddEditMachineryPage(
                            isEdit: false,
                          ),
                        ),
                      );
                      //state.mapController?.dispose();
                      context
                          .read<AgriculturalInformationBloc>()
                          .add(BorrowAgriculturalResetEvent());
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.add, size: 15, color: Colors.black),
                          CustomText(
                            text: 'เพิ่ม',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(
                        color: Color(0xffC5E0E2),
                        thickness: 2,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xffC5E0E2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const CustomText(text: 'เครื่องจักรของกลุ่ม'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                machines.isEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const Center(
                          child: CustomText(
                            text: 'ไม่มีข้อมูลเครื่องจักร',
                            color: Colors.grey,
                          ),
                        ))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: machines.length,
                        itemBuilder: (context, index) {
                          final machine = machines[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff303030),
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          spreadRadius: 1,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Container(
                                              color: Colors.white,
                                              child: Image.network(
                                                machine.machineImg!,
                                                fit: BoxFit.contain,
                                                height: 100,
                                                width: double.infinity,
                                              ),
                                            )),
                                        const SizedBox(height: 5),
                                        CustomText(
                                          text: machine.machineName!,
                                          color: Colors.white,
                                          fontSize: 14,
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.left,
                                        ),
                                        CustomText(
                                          text: machine.groupName!,
                                          color: ThemeConfig.textPrimary,
                                          fontSize: 16,
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.left,
                                        ),
                                        CustomText(
                                          text: 'รถของ : ${machine.user!}',
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                        RatingBarWidget(rating: machine.rating ?? 0.0),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    decoration: const BoxDecoration(
                                      color: Color(0xffC5DFC3),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                      ),
                                      border: Border(
                                        right: BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                        top: BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: machine.machineName!,
                                          color: Colors.black,
                                          fontSize: 16,
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.left,
                                        ),
                                        /*const SizedBox(height: 5),
                                  const CustomText(
                                    text: 'ตัวดำเนินการ',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),*/
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            CupertinoButton(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 0),
                                              color: const Color(0xff303030),
                                              child: const CustomText(
                                                  text: 'แก้ไข',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              onPressed: () async {
                                                //state.mapController?.dispose();
                                                context.read<AgriculturalInformationBloc>().add(
                                                    BorrowAgriculturalEditEvent(
                                                        machineId: machine.machineId.toString()));
                                                await Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                    builder: (context) => HeadAddEditMachineryPage(
                                                      isEdit: true,
                                                      machine: machine,
                                                    ),
                                                  ),
                                                );
                                                // state.mapController?.dispose();
                                                state.machineDetailModel = null;
                                                state.selectedMachineType = null;
                                                state.selectedMember = null;
                                                state.headGroupImagePath = null;
                                                state.borrowGroupImageFile = null;
                                                state.currentEditId = null;
                                              },
                                            ),
                                            const SizedBox(width: 10),
                                            CupertinoButton(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 0),
                                              color: const Color(0xff5E0101),
                                              child: const CustomText(
                                                  text: 'ลบ',
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                              onPressed: () {
                                                CustomDialog.showCustomDeleteDialog(
                                                    context: context,
                                                    title: '',
                                                    description:
                                                        'คุณต้องการลบการอบรมนี้ใช่หรือไม่?',
                                                    icon: Image.asset(
                                                      ImageProviders.delete,
                                                      height: 100,
                                                      width: 100,
                                                    ),
                                                    onCancelPressed: () {
                                                      Get.back();
                                                    },
                                                    onPressed: () async {
                                                      Get.back();
                                                      EasyLoading.show(status: 'กำลังโหลด');
                                                      final response = await _agriculturalRepository
                                                          .deleteMachineById(
                                                              id: machine.machineId.toString());
                                                      if (response['result']) {
                                                       // Get.back();

                                                        state.groupMachineHeadModel = [];
                                                        final gh = await _agriculturalRepository
                                                            .getHeadMachineryList();
                                                        state.groupMachineHeadModel
                                                            .addAll(gh.data!.machines);
                                                        state.copyWith(
                                                            groupMachineHeadModel:
                                                                state.groupMachineHeadModel);
                                                        machines = state.groupMachineHeadModel;
                                                        EasyLoading.dismiss();
                                                        CustomDialog.showCustomDialog(
                                                          context: context,
                                                          title: '',
                                                          description: response['message'],
                                                          icon: Image.asset(ImageProviders.success),
                                                          onPressed: () {
                                                            setState(() {});
                                                            Get.back();
                                                          },
                                                        );
                                                      } else {}
                                                    });
                                              },
                                            ),
                                          ],
                                        )
                                        /*Row(
                                   children: [
                                     const CustomText(
                                       text: 'สถานะการใช้งาน : ',
                                       color: Colors.black,
                                       fontSize: 14,
                                     ),
                                     Container(
                                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                       decoration: BoxDecoration(
                                         color: const Color(0xff303030),
                                         borderRadius: BorderRadius.circular(8),
                                       ),
                                       child: CustomText(
                                         text: message,
                                         color: Colors.white,
                                         fontSize: 14,
                                       ),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(height: 16),*/
                                        /*Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     _buildCountOfUsageWidget(
                                       text: 'ใช้งาน/ครั้ง',
                                       borrowingCount: borrowingCount,
                                     ),
                                     const SizedBox(width: 10),
                                     _buildCountOfUsageWidget(
                                       text: 'ใช้งาน/ไร่',
                                       borrowingCount: numberFields,
                                     ),
                                   ],
                                 ),*/
                                        /*const SizedBox(height: 16),
                                 SizedBox(
                                   width: double.infinity,
                                   child: CupertinoButton(
                                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                       color: const Color(0xff0F2E00),
                                       onPressed: onPressed,
                                       child:  CustomText(
                                         text: buttonText,
                                         color: Colors.white,
                                         fontSize: 16,
                                       )),
                                 ),*/
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                const SizedBox(height: 10),
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

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    super.key,
    required this.rating,
    this.ignoreGestures = true,
  });

  final double rating;
  final bool ignoreGestures;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 16,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        ignoreGestures: ignoreGestures,
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }
}
