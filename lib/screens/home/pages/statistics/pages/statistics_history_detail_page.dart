import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/statistics/bloc/statistics_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/convert_date_time.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/app_bar_title_widget.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../widgets/custom_dialog.dart';

class StatisticsHistoryDetailPage extends StatefulWidget {
  final bool isFromNotification;
  const StatisticsHistoryDetailPage({super.key, required this.isFromNotification });

  @override
  State<StatisticsHistoryDetailPage> createState() => _StatisticsHistoryDetailPageState();
}

class _StatisticsHistoryDetailPageState extends State<StatisticsHistoryDetailPage> {


   double _rating = 0;

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
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        builder: (context, state) {
          if (state is StatisticsLoaded) {
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

  ListView _buildDataWidget(BuildContext context, StatisticsLoaded state) {
    final borrowDetail = state.borrowDetail!.data!.borrowDetail!;
    return ListView(
      children: [
        const AppBarTitleWidget(title: 'รายการประวัติการยืม'),
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
          child: Image.network(borrowDetail.machineImg!),
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
                        text: borrowDetail.machineName.toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<MachineryBloc>().add(
                            MachineryGetMachineryByIdEvent(
                              id: state.borrowDetail!.data!.borrowDetail!.machineId.toString(),
                            ),
                          );
                      Navigator.pushNamed(context, AppRoutes.machineryInfoPage);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.3,
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
                            CustomText(text: 'เพิ่มเติม', color: Colors.white, fontSize: 14),
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
                dateTime: ConvertDateTime.convertDate(borrowDetail.startDate!),
              ),
              const SizedBox(height: 10),
              _buildDateTimeWidget(
                title: 'วันคืนเครื่องจักร',
                dateTime: ConvertDateTime.convertDate(borrowDetail.endDate!),
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
                      subText: borrowDetail.objectiveTitle!,
                    ),
                    _buildRowTextWidget(
                      text: 'เนื้อที่ : ',
                      subText: '${borrowDetail.numberFields} ไร่',
                    ),
                    _buildRowTextWidget(
                      text: 'รายละเอียดเพิ่มเติม : ',
                      subText: borrowDetail.description!,
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
                      Image.asset(ImageProviders.waitConfirm, width: 50),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomText(
                          text: borrowDetail.message!,
                          fontSize: 20,
                          color: Colors.black,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 16),
              Visibility(
                visible: borrowDetail.status == 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: CupertinoButton(
                    color: const Color(0xff103300),
                    child: const CustomText(
                      text: 'คืนเครื่องจักร',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    onPressed: () {
                      CustomDialog.showCustomDeleteDialog(
                        context: context,
                        title: 'ยืนยันการคืนเครื่องจักร',
                        description: 'ประเมินระดับการใช้งานเครื่องจักร',
                        icon: Column(
                          children: [
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 30,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                _rating = rating;
                                print(_rating);
                              },
                            ),
                          ],
                        ),
                        onPressed: () {
                          Get.back();
                          context.read<StatisticsBloc>().add(ReturnMachineryEvent(
                                id: borrowDetail.borrowId.toString(),
                                context: context,
                                isFromNotification: widget.isFromNotification,
                                rating: _rating,
                              ));
                        },
                        onCancelPressed: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: borrowDetail.status == 3,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: CupertinoButton(
                    color: const Color(0xff103300),
                    child: const CustomText(
                      text: 'รับเครื่องจักร',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    onPressed: () {
                      CustomDialog.showCustomDeleteDialog(
                        context: context,
                        title: 'ยืนยันการรับเครื่องจักร',
                        description: 'คุณต้องการรับเครื่องจักรใช่หรือไม่',
                        icon: SizedBox(),
                        onPressed: () {
                          Get.back();
                          context.read<StatisticsBloc>().add(ReceiveMachineryEvent(
                                id: borrowDetail.borrowId.toString(),
                                context: context,
                                isFromNotification: widget.isFromNotification,
                              ));
                        },
                        onCancelPressed: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
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
