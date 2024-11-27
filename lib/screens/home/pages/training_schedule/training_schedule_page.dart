import 'package:agri/screens/home/pages/training_schedule/bloc/training_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TrainingSchedulePage extends StatelessWidget {
  const TrainingSchedulePage({Key? key}) : super(key: key);

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
        actions: [
          Visibility(
            visible: RoleStatus().getRoleAdmin(context),
            child: GestureDetector(
              onTap: () async {


                //context.read<NewsBloc>().add(NewsInitialEvent());
                 await Navigator.pushNamed(context, AppRoutes.addEditTrainingPage, arguments: false);
                 context.read<TrainingBloc>().add(ResetAddEditTrainingEvent());
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xff103300),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: const Row(
                  children: [
                    CustomText(
                      text: 'เพิ่ม',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          _buildHeaderWidget(context),
          _buildTrainingDataWidget(),
        ],
      ),
    );
  }

  Widget _buildHeaderWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: MediaQuery.of(context).size.width,
          color: ThemeConfig.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 70),
                child: const CustomText(
                  text: 'การอบรม',
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
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
                          child:  BlocBuilder<TrainingBloc, TrainingState>(
                            builder: (context, state) {
                              if (state is TrainingLoaded) {
                                return  TableCalendar(
                                  locale: 'th_TH',
                                  headerStyle:  HeaderStyle(
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
                                  focusedDay: state.selectedDate,
                                  currentDay: state.selectedDate,
                                  calendarFormat: CalendarFormat.month,
                                  onDaySelected: (selectedDay, focusedDay) {
                                    context
                                        .read<TrainingBloc>()
                                        .add(TrainingSelectedDateEvent(date: selectedDay));
                                  },
                                );
                              } else {
                                return const SizedBox();
                              }
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
                              context
                                  .read<TrainingBloc>()
                                  .add(TrainingSearchDateEvent());
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Row(
                    children: [
                      CustomText(
                        text: 'เดือน',
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                        size: 24,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrainingDataWidget() {
    return Expanded(
      child: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          if (state is TrainingLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is TrainingLoaded) {
            return state.trainingModel.data!.train.isEmpty
                ? const Center(
                    child: CustomText(
                        text: 'ไม่มีข้อมูล',
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold))
                : _buildTrainingList(state: state, context: context);
          } else {
            return const Center(child: CustomText(text: 'Error'));
          }
        },
      ),
    );
  }

  Widget _buildTrainingList({
    required TrainingLoaded state,
    required BuildContext context,
  }) {
    const fontColor = Color(0xff103300);

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<TrainingBloc>().add(TrainingInitialEvent());
        await context.read<TrainingBloc>().stream.first;
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.trainingModel.data!.train.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final training = state.trainingModel.data!.train[index];
          final time =
              DateFormat('HH:mm').format(DateFormat('HH:mm:ss').parse(training.trainTime!));
          return Container(
            margin: const EdgeInsets.only(top: 16),
            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff111F0A),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xffCFE1CC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Expanded(flex: 1, child: SizedBox()),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: CustomText(
                                          text: training.trainName!,
                                          color: fontColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Icon(Icons.timer,
                                                color: Colors.greenAccent.shade400, size: 40),
                                            CustomText(
                                              text: '$time น.',
                                              color: fontColor,
                                              fontSize: 20,
                                              textAlign: TextAlign.right,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text:
                                  'วันที่: ${training.trainDate.toString().split(' ')[0].replaceAll('-', '/')}',
                              color: const Color(0xff959595),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            GestureDetector(
                              onTap: () async {
                                context
                                    .read<TrainingBloc>()
                                    .add(GetTrainingByIdEvent(id: training.trainId.toString()));
                               await Navigator.pushNamed(context, AppRoutes.trainingDetailPage);
                                context.read<TrainingBloc>().add(TrainingInitialEvent());
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: const Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const CustomText(
                                  text: 'รายละเอียด',
                                  color: fontColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: -10,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(training.img!),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
