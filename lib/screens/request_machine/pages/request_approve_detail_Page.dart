import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/statistics/bloc/statistics_bloc.dart';
import 'package:agri/screens/request_machine/bloc/request_machine_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/convert_date_time.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/app_bar_title_widget.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestApproveDetailPage extends StatelessWidget {
  final bool isFromHistory;
  final int inGroup;

  const RequestApproveDetailPage({
    super.key,
    this.isFromHistory = false,
    this.inGroup = 0,
  });

  @override
  Widget build(BuildContext context) {
    print(isFromHistory);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButtonWidget(),
      ),
      body: BlocBuilder<RequestMachineBloc, RequestMachineState>(
        builder: (context, state) {
          if (state is RequestMachineLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is RequestMachineLoaded) {
            return state.isDetailLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : _buildDataWidget(context, state);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildDataWidget(BuildContext context, RequestMachineLoaded state) {
    if (state.isDetailLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else {
      return ListView(
        children: [
          const AppBarTitleWidget(title: 'รายละเอียดคำขอ'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xffC5E0E2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                )
              ],
            ),
            child: const Row(
              children: [
                Icon(CupertinoIcons.doc_plaintext, size: 30),
                SizedBox(width: 10),
                CustomText(
                  text: 'รายละเอียด',
                  color: Color(0xff0F2E00),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            color: Colors.grey.shade200,
            child: Image.network(
                state.approveRequestDetailModel?.machineImg ?? ImageNetworkProviders.errorImage),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: state.approveRequestDetailModel?.machineName ?? '',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(
                            'Get Detail Machine : ${state.approveRequestDetailModel!.machineId.toString()}');

                        context.read<MachineryBloc>().add(
                              MachineryGetMachineryByIdEvent(
                                id: state.approveRequestDetailModel!.machineId.toString(),
                              ),
                            );
                        Navigator.pushNamed(context, AppRoutes.machineryInfoPage);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          //  width: MediaQuery.of(context).size.width * 0.3,
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xff848C81),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(text: 'เพิ่มเติม', color: Colors.white, fontSize: 16),
                              SizedBox(width: 5),
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Color(0xff0F2E00),
                                child: Icon(
                                  Icons.list_alt_rounded,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildDateTimeWidget(
                  title: 'วันเริ่มใช้งาน',
                  dateTime: ConvertDateTime.convertDate(
                      state.approveRequestDetailModel?.startDate ?? DateTime.now()),
                ),
                const SizedBox(height: 10),
                _buildDateTimeWidget(
                  title: 'วันคืนเครื่องจักร',
                  dateTime: ConvertDateTime.convertDate(
                      state.approveRequestDetailModel?.endDate ?? DateTime.now()),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffC5E0E2),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildRowTextWidget(
                        text: 'วัตถุประสงค์ : ',
                        subText: state.approveRequestDetailModel?.objectiveTitle ?? '',
                      ),
                      _buildRowTextWidget(
                        text: 'เนื้อที่ : ',
                        subText: '${state.approveRequestDetailModel?.numberFields} ไร่',
                      ),
                      _buildRowTextWidget(
                        text: 'รายละเอียดเพิ่มเติม : ',
                        subText: state.approveRequestDetailModel?.description ?? '',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xff9ABC95),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff206102),
                          backgroundImage: NetworkImage(
                            state.approveRequestDetailModel?.profileImg ??
                                'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg' ,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomText(
                          text:
                              '${state.approveRequestDetailModel?.firstname} ${state.approveRequestDetailModel?.lastname}',
                          fontSize: 20,
                          color: Colors.black,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse('tel:${state.approveRequestDetailModel?.tel}'));
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xff206102),
                          child: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isFromHistory,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xff9ABC95),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 2,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(ImageProviders.waitConfirm, width: 50),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomText(
                                  text: state.approveRequestDetailModel?.message ?? '',
                                  fontSize: 20,
                                  color: state.approveRequestDetailModel?.status == 6
                                      ? Colors.red
                                      : Colors.black,
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 16),
                      Visibility(
                        visible: state.approveRequestDetailModel?.status == 3,
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xff9ABC95),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 2,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(ImageProviders.waitConfirm, width: 50),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: CustomText(
                                    text: state.approveRequestDetailModel?.message ?? '',
                                    fontSize: 20,
                                    color: Colors.black,
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Visibility(
                        visible: state.approveRequestDetailModel?.status == 4,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CupertinoButton(
                            color: const Color(0xff103300),
                            child: const CustomText(
                              text: 'คืนเครื่องจักร',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Visibility(
                        visible: state.approveRequestDetailModel?.status == 5,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: CupertinoButton(
                            color: const Color(0xff103300),
                            child: const CustomText(
                              text: 'คืนเครื่องจักรเรียบร้อย',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !isFromHistory && state.approveRequestDetailModel?.status == 1 ||
                            state.approveRequestDetailModel?.status == 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: CupertinoButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                                  color: const Color(0xff103300),
                                  child: const CustomText(
                                    text: 'อนุมัติ',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  onPressed: () {
                                    CustomDialog.showCustomDeleteDialog(
                                      context: context,
                                      title: '',
                                      description: 'ยืนยันการอนุมัติหรือไม่?',
                                      icon: const CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.question_mark,
                                          color: Color(0xff103300),
                                          size: 50,
                                        ),
                                      ),
                                      onPressed: () {
                                        print('Here');
                                        // Get.back();
                                        context.read<RequestMachineBloc>().add(
                                              RequestMachineApproveInGroupEvent(
                                                state.approveRequestDetailModel!.borrowId,
                                                context,
                                              ),
                                            );
                                      },
                                      onCancelPressed: () => Get.back(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: SizedBox(
                                child: CupertinoButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                                  color: Colors.grey,
                                  child: const CustomText(
                                    text: 'ไม่อนุมัติ',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  onPressed: () {
                                    CustomDialog.showCustomDeleteDialog(
                                      context: context,
                                      title: '',
                                      description: 'ยืนยันการไม่อนุมัติหรือไม่?',
                                      icon: const CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.question_mark,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                        context.read<RequestMachineBloc>().add(
                                              RequestMachineRefuseInGroupEvent(
                                                state.approveRequestDetailModel!.borrowId,
                                                context,
                                              ),
                                            );
                                      },
                                      onCancelPressed: () => Get.back(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // in group => 2 อนุมัติแล้ว
                // out group >= 3 อนุมัติแล้ว

                Visibility(
                  visible:
                      isFromHistory && state.approveRequestDetailModel!.status >= 2 && inGroup == 0,
                  child: state.approveRequestDetailModel!.status == 6
                      ? _buildCardStatusWidget(
                          message: state.approveRequestDetailModel!.message,
                          status: state.approveRequestDetailModel!.status,
                        )
                      : Column(
                          children: [
                            _buildCardStatusWidget(
                              message: 'อนุมัติแล้ว',
                              status: state.approveRequestDetailModel!.status,
                            ),
                            _buildCardStatusWidget(
                              message: state.approveRequestDetailModel!.message,
                              status: state.approveRequestDetailModel!.status,
                            ),
                          ],
                        ),
                ),
                Visibility(
                  visible: isFromHistory &&
                      (state.approveRequestDetailModel!.status >= 3) &&
                      inGroup == 1,
                  child: state.approveRequestDetailModel!.status == 6
                      ? _buildCardStatusWidget(
                          message: state.approveRequestDetailModel!.message,
                          status: state.approveRequestDetailModel!.status,
                        )
                      : Column(
                          children: [
                            _buildCardStatusWidget(
                              message: 'อนุมัติแล้ว',
                              status: state.approveRequestDetailModel!.status,
                            ),
                            _buildCardStatusWidget(
                              message: state.approveRequestDetailModel!.message,
                              status: state.approveRequestDetailModel!.status,
                            ),
                          ],
                        ),
                ),

                ///
                !isFromHistory
                    ? const SizedBox()
                    : Visibility(
                        visible: state.approveRequestDetailModel?.status == 1 ||
                            state.approveRequestDetailModel?.status == 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: CupertinoButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                                  color: const Color(0xff103300),
                                  child: const CustomText(
                                    text: 'อนุมัติ',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  onPressed: () {
                                    CustomDialog.showCustomDeleteDialog(
                                      context: context,
                                      title: '',
                                      description: 'ยืนยันการอนุมัติหรือไม่?',
                                      icon: const CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          Icons.question_mark,
                                          color: Color(0xff103300),
                                          size: 50,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                        print(
                                            'Here 2 : ${state.approveRequestDetailModel!.borrowId}');
                                        state.currentTab = inGroup;
                                        context.read<RequestMachineBloc>().add(
                                              RequestMachineApproveInGroupEvent(
                                                state.approveRequestDetailModel!.borrowId,
                                                context,
                                              ),
                                            );
                                      },
                                      onCancelPressed: () => Get.back(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: SizedBox(
                                child: CupertinoButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                                  color: Colors.grey,
                                  child: const CustomText(
                                    text: 'ไม่อนุมัติ',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  onPressed: () {
                                    CustomDialog.showCustomDeleteDialog(
                                      context: context,
                                      title: '',
                                      description: 'ยืนยันการไม่อนุมัติหรือไม่?',
                                      icon: const CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.question_mark,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                        context.read<RequestMachineBloc>().add(
                                              RequestMachineRefuseInGroupEvent(
                                                state.approveRequestDetailModel!.borrowId,
                                                context,
                                              ),
                                            );
                                      },
                                      onCancelPressed: () => Get.back(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildCardStatusWidget({
    required String message,
    required int status,
  }) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xff9ABC95),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 2,
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(ImageProviders.waitConfirm, width: 50),
            const SizedBox(width: 16),
            Expanded(
              child: CustomText(
                text: message,
                fontSize: 20,
                color: status == 6 ? Colors.red : Colors.black,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ));
  }

  Widget _buildRowTextWidget({
    required String text,
    required String subText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: text,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xff0F2E00),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CustomText(
              text: subText,
              fontSize: 16,
              color: Colors.black,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeWidget({
    required String title,
    required String dateTime,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xff525252),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            color: Colors.white,
            child: Row(
              children: [
                CustomText(
                  text: dateTime,
                  fontSize: 16,
                  color: Colors.black,
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.black,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
