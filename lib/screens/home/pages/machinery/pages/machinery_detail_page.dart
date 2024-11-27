import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_detail_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:agri/screens/home/pages/machinery/pages/machinery_borrow/bloc/machinery_borrow_bloc.dart';
import 'package:agri/screens/home/pages/machinery/widgets/custom_machinery_history_list_widget.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_machinery_card_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class MachineryDetailPage extends StatelessWidget {
  final MachineList machine;

  const MachineryDetailPage({
    super.key,
    required this.machine,
  });

  @override
  Widget build(BuildContext context) {
    final currentDay = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButtonWidget(),
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: ThemeConfig.primary,
            child: const CustomText(
              text: 'รายละเอียดเครื่องจักร',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.machineryInfoPage);
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                   // alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
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
                        CustomText(text: 'เพิ่มเติม'),
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
                CustomMachineryCardWidget(
                  machineImg: machine.machineImg!,
                  machineName: machine.machineName!,
                  groupName: machine.groupName!,
                  user: machine.user!,
                  message: machine.message!,
                  borrowingCount: machine.borrowingCount!,
                  numberFields: machine.numberFields!,
                  buttonText: 'จอง',
                  onPressed: () {
                    context.read<MachineryBorrowBloc>().add(BorrowInitialEvent());

                    Navigator.pushNamed(context, AppRoutes.machineryBorrowPage,
                        arguments: machine.machineId.toString());
                  },
                ),
                BlocBuilder<MachineryBloc, MachineryState>(
                  builder: (context, state) {
                    if (state is MachineryLoaded) {
                      return state.isDetailLoading
                          ? const Center(child: CircularProgressIndicator.adaptive())
                          : Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Divider(
                                        color: Colors.green.shade100,
                                        thickness: 2,
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: const CustomText(text: 'ตารางปฏิทิน'),
                                      ),
                                    ],
                                  ),
                                ),
                                _buildCalendarWorkerWidget(currentDay, state),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      _buildHistoryHeaderWidget(context, state),
                                      const SizedBox(height: 10),
                                      CustomMachineryHistoryListWidget(
                                        historyList: state.machineryDetailModel!.data!.history
                                            .take(3)
                                            .toList(),
                                        objectives: state.objectiveList!.data!.objectives,
                                        physics: const NeverScrollableScrollPhysics(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                    } else {
                      return const CustomText(text: 'Something went wrong!');
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHistoryHeaderWidget(BuildContext context, MachineryLoaded state) {
    final historyList = state.machineryDetailModel!.data!.history;
    final objectives = state.objectiveList!.data!.objectives;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: 'ประวัติการใช้งาน',
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 2,
              )
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.historyListPage, arguments: {
                'historyList': historyList,
                'objectives': objectives,
              });
            },
            child: const Row(
              children: [
                CustomText(text: 'เพิ่มเติม', fontSize: 14, color: Colors.black),
                SizedBox(width: 5),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xff0F2E00),
                  child: Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _buildCalendarWorkerWidget(
    DateTime currentDay,
    MachineryLoaded state,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
      ),
      child: TableCalendar(
        locale: 'th_TH',
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: false,
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: ThemeConfig.primary,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: ThemeConfig.primary,
            shape: BoxShape.circle,
          ),
          todayTextStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: currentDay,
        currentDay: currentDay,

        //rangeStartDay: DateTime.now(),
        //rangeEndDay: DateTime.now().add(const Duration(days: 7)),
        /*eventLoader: (day) {
                              return events.where((element) {
                                return day.isAfter(DateTime.parse(element['start_date']!)) &&
                                    day.difference(DateTime.parse(element['end_date']!)).inDays <=
                                        0;
                              }).toList();
                            },*/
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, date, _) => Container(
            //margin: EdgeInsets.all(0.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              date.day.toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          markerBuilder: (context, day, events) {
            if (state.machineryDetailModel!.data!.workCalendar.isEmpty) {
              // Return null or empty container for transparent cell
              return null;
            }
            for (var event in state.machineryDetailModel!.data!.workCalendar) {
              DateTime startDate = event.startDate!;
              DateTime endDate = event.endDate!;

              if (day.isAfter(startDate) &&
                      day.difference(endDate).inDays <= 0 &&
                      startDate.isBefore(currentDay) &&
                      endDate.isAfter(currentDay) ||
                  day.isAtSameMomentAs(currentDay)) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.2),
                  ),
                );
              } else if (day.isAfter(startDate) &&
                  day.difference(endDate).inDays <= 0 &&
                  startDate.isAfter(currentDay) &&
                  endDate.isAfter(currentDay)) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(.2),
                  ),
                );
              } else if (day.isAfter(startDate) &&
                  day.difference(endDate).inDays <= 0 &&
                  startDate.isBefore(currentDay) &&
                  endDate.isBefore(
                    currentDay,
                  )) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.2),
                  ),
                );
              } else if (day.isBefore(startDate)) {
                return Container(
                  //padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                );
              }
            }

            return const SizedBox();
          },
        ),
        calendarFormat: CalendarFormat.month,
      ),
    );
  }
}
