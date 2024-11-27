import 'package:agri/screens/home/pages/training_schedule/bloc/training_bloc.dart';
import 'package:agri/screens/home/pages/training_schedule/models/training_model.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../repository/training_repository.dart';

class TrainingDetailPage extends StatefulWidget {
  const TrainingDetailPage({super.key});

  @override
  State<TrainingDetailPage> createState() => _TrainingDetailPageState();
}

class _TrainingDetailPageState extends State<TrainingDetailPage> {
  final TrainingRepository trainingRepository = TrainingRepository();

  @override
  Widget build(BuildContext context) {
    bool isAdmin = RoleStatus().getRoleAdmin(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          if (state is TrainingLoaded) {
            String time;
            String date;
            Train? data;

            data = state.trainingDetailModel?.data?.train;
            time = DateFormat('HH:mm')
                .format(DateFormat('HH:mm:ss').parse(data?.trainTime ?? '00:00:00'));
            date = data?.trainDate.toString().split(' ')[0].replaceAll('-', '/') ?? '';
            bool isRegisterLoading = data?.isRegister ?? false;

            return state.isTrainingLoading
                ? const CircularProgressIndicator.adaptive()
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 250,
                        pinned: true,
                        leading: const BackButtonWidget(),
                        backgroundColor: const Color(0xff5B754F),
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(data?.img ?? ''),
                              ),
                              const SizedBox(height: 20),
                              CustomText(
                                text: data?.trainName ?? '',
                                color: Colors.white,
                                fontSize: 25,
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 26),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: 'รายละเอียด',
                                    color: Color(0xff133D00),
                                    fontSize: 24,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: Colors.grey.shade100),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        _buildRowData(
                                          context: context,
                                          title: 'เรื่อง :  ',
                                          subtitle: data?.trainName ?? '',
                                        ),
                                        const SizedBox(height: 20),
                                        _buildRowData(
                                          context: context,
                                          title: 'เวลาการอบรม :  ',
                                          subtitle: '$date $time น.',
                                        ),
                                        const SizedBox(height: 20),
                                        _buildRowData(
                                          context: context,
                                          title: 'สถานที่ :  ',
                                          subtitle: data?.address ?? '',
                                        ),
                                        const SizedBox(height: 50),
                                        isAdmin
                                            ? GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(context,
                                                      AppRoutes.registeredTrainingUsersPage,
                                                      arguments: data?.trainId.toString());
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 16, vertical: 8),
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xff206102),
                                                    borderRadius: BorderRadius.circular(16),
                                                  ),
                                                  child: const CustomText(
                                                    text: 'รายชื่อผู้ลงทะเบียนเข้าอบรม',
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    textAlign: TextAlign.center,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            : _buildIsRegistered(
                                                isRegisterLoading, context, state, data),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
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
      bottomNavigationBar: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          if (state is TrainingLoaded) {
            Train? data = state.trainingDetailModel?.data?.train;
            return state.isTrainingLoading
                ? const SizedBox()
                : Visibility(
                    visible: RoleStatus().getRoleAdmin(context),
                    child: BottomAppBar(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CupertinoButton(
                                color: const Color(0xffFFB800),
                                onPressed: () async {
                                  BlocProvider.of<TrainingBloc>(context).add(TrainingSetValuesEvent(
                                    trainingModel: data!,
                                  ));
                                  await Navigator.pushNamed(context, AppRoutes.addEditTrainingPage,
                                      arguments: true);
                                  context.read<TrainingBloc>().add(ResetAddEditTrainingEvent());
                                  // BlocProvider.of<NewsBloc>(context).add(NewsSetValueOnEditEnterEvent());
                                  //  await Navigator.pushNamed(context, AppRoutes.addEditNewsPage, arguments: true);
                                  //  context.read<NewsBloc>().add(NewsReSetValueOnEditEnterEvent());
                                },
                                child: const CustomText(
                                  text: 'แก้ไข',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CupertinoButton(
                                color: const Color(0xffBF1D1D),
                                onPressed: () {
                                  CustomDialog.showCustomDeleteDialog(
                                    context: context,
                                    title: '',
                                    description: 'คุณต้องการลบการอบรมนี้ใช่หรือไม่?',
                                    icon: Image.asset(
                                      ImageProviders.delete,
                                      height: 100,
                                      width: 100,
                                    ),
                                    onCancelPressed: () {
                                      Get.back();
                                    },
                                    onPressed: state.isLoading
                                        ? null
                                        : () async {
                                      Get.back();
                                      EasyLoading.show(status: 'กำลังโหลด');
                                            setState(() {
                                              state.isLoading = true;
                                            });
                                            final response = await trainingRepository
                                                .deleteTrainingById(id: data!.trainId.toString());
                                            setState(() {
                                              state.isLoading = false;
                                            });
                                            if (response['result']) {
                                              EasyLoading.dismiss();
                                              CustomDialog.showCustomDialog(
                                                context: context,
                                                title: '',
                                                description: 'ลบการอบรมสำเร็จแล้ว',
                                                icon: Image.asset(
                                                  ImageProviders.delete,
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                onPressed: () {
                                                  //Get.back();
                                                  Get.back();
                                                  Get.back();
                                                  context.read<TrainingBloc>().add(TrainingInitialEvent());
                                                  //context.read<TrainingBloc>().add(TrainingInitialEvent());
                                                },
                                              );
                                            }
                                          },
                                  );
                                },
                                child: state.isLoading
                                    ? const CupertinoActivityIndicator()
                                    : const CustomText(
                                        text: 'ลบ',
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildIsRegistered(
    bool isRegisterLoading,
    BuildContext context,
    TrainingLoaded state,
    Train? data,
  ) {
    return isRegisterLoading
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff5B754F).withOpacity(0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const CustomText(
              text: 'ลงชื่อเข้าร่วมการอบรมแล้ว',
              color: Colors.white,
              fontSize: 20,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
          )
        : GestureDetector(
            onTap: () async {
              context.read<TrainingBloc>().add(
                    RegisterTrainingEvent(
                      context: context,
                      id: data!.trainId.toString(),
                    ),
                  );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffC99100),
                borderRadius: BorderRadius.circular(16),
              ),
              child: state.isRegisterLoading
                  ? const CupertinoActivityIndicator()
                  : const CustomText(
                      text: 'ลงชื่อเข้าร่วมการอบรม',
                      color: Colors.white,
                      fontSize: 20,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
            ),
          );
  }

  Widget _buildRowData({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: CustomText(
              text: title,
              textAlign: TextAlign.right,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 4,
            child: CustomText(
              text: ' $subtitle',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
            )),
      ],
    );
  }
}
