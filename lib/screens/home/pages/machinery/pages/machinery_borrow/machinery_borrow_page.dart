import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_detail_model.dart';
import 'package:agri/screens/home/pages/machinery/models/objectives_model.dart';
import 'package:agri/screens/home/pages/machinery/pages/machinery_borrow/bloc/machinery_borrow_bloc.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class MachineryBorrowPage extends StatefulWidget {
  final String machineryId;

  const MachineryBorrowPage({super.key, required this.machineryId});

  @override
  State<MachineryBorrowPage> createState() => _MachineryBorrowPageState();
}

class _MachineryBorrowPageState extends State<MachineryBorrowPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<Objective> objectiveList = [];
    List<WorkCalendar> workCalendar = [];
    final currentDay = DateTime.now();
    final machineryState = context.read<MachineryBloc>().state;
    if (machineryState is MachineryLoaded) {
      if (machineryState.objectiveList != null) {
        objectiveList.addAll(machineryState.objectiveList!.data!.objectives);
        workCalendar.addAll(machineryState.machineryDetailModel!.data!.workCalendar);
      }
    }

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
        body: BlocBuilder<MachineryBorrowBloc, MachineryBorrowState>(
          builder: (context, state) {
            return ListView(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConfig.primary,
                  child: const CustomText(
                    text: 'จองเครื่องจักร',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Container(
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
                    onCalendarCreated: (controller) {
                      state.pageController = controller;
                    },
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
                    calendarFormat: CalendarFormat.month,
                    onPageChanged: (date) {},
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
                    focusedDay: state.startDate ?? DateTime.now(),
                    currentDay: DateTime.now(),
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
                    rangeStartDay: state.startDate,
                    rangeEndDay: state.endDate,
                    onRangeSelected: (start, end, focusedDay) {
                      DateTime today = DateTime.now();

                      if (start != null && start.isBefore(today)) {
                        CustomToast.show('ไม่สามารถเลือกวันที่ก่อนวันปัจจุบันได้');
                        return;
                      }

                      if (end != null && end.isBefore(today)) {
                        CustomToast.show('ไม่สามารถเลือกวันที่ก่อนวันปัจจุบันได้');
                        return;
                      }

                      bool validateWorker = workCalendar.any((element) =>
                          element.startDate!.isBefore(end ?? focusedDay) &&
                          element.endDate!.isAfter(start ?? focusedDay));

                      if (validateWorker) {
                        CustomToast.show('ไม่สามารถเลือกวันที่ที่มีการใจองแล้ว');
                        return;
                      }

                      context
                          .read<MachineryBorrowBloc>()
                          .add(BorrowChangedStartDateEvent(startDate: start ?? focusedDay));
                      context
                          .read<MachineryBorrowBloc>()
                          .add(BorrowChangedEndDateEvent(endDate: end ?? focusedDay));
                    },
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
                        if (workCalendar.isEmpty) {
                          // Return null or empty container for transparent cell
                          return null;
                        }
                        for (var event in workCalendar) {
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
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffB6D6D9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                      )
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(ImageProviders.document),
                            const SizedBox(width: 10),
                            CustomText(
                              text: 'ใช้ทำงาน',
                              color: ThemeConfig.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          // padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<Objective>(
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
                                'วัตถุประสงค์',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Colors.grey),
                              ),
                              items: objectiveList
                                  .map((Objective item) => DropdownMenuItem<Objective>(
                                        value: item,
                                        child: CustomText(
                                          text: item.objectiveTitle ?? '',
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ))
                                  .toList(),
                              value: state.objective,
                              onChanged: (Objective? value) {
                                context
                                    .read<MachineryBorrowBloc>()
                                    .add(BorrowChangedObjectiveEvent(objective: value!));
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
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CustomTextFieldWidget(
                                placeHolder: 'ระบุจำนวนเนื้อที่',
                                controller: state.numberFields,
                                borderSideColor: Colors.grey,
                                onChanged: (value) {
                                  // context.read<NewsBloc>().add(RegisterLastNameChanged(value));
                                },
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'กรุณาระบุจำนวน';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            CustomText(
                              text: 'ไร่',
                              color: ThemeConfig.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CustomTextFieldWidget(
                            controller: state.description,
                            placeHolder: 'ระบุรายละเอียดเพิ่มเติม',
                            borderSideColor: Colors.grey,
                            onChanged: (value) {
                              // context.read<NewsBloc>().add(RegisterLastNameChanged(value));
                            },
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'กรุณาระบุรายละเอียดเพิ่มเติม';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            maxLine: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<MachineryBorrowBloc, MachineryBorrowState>(
          builder: (context, state) {
            return Container(
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff223917),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    onPressed: state.isLoading!
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<MachineryBorrowBloc>().add(BorrowConfirmEvent(
                                    machineryId: widget.machineryId,
                                    context: context,
                                  ));
                            }
                          },
                    child: state.isLoading!
                        ? const CupertinoActivityIndicator(
                            color: Colors.white,
                          )
                        : const CustomText(
                            text: 'จองใช้งาน',
                            color: Colors.white,
                            fontSize: 25,
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDateSelectWidget({
    required BuildContext context,
    required Function(DateTime) onDateChange,
    required Function()? onConfirm,
    required DateTime? date,
    required String title,
    required String hintText,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: const Color(0xffC5DFC3),
            child: Icon(
              icon,
              color: iconColor,
              size: 50,
            ),
          ),
          const SizedBox(width: 10),
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
                                onPressed: onConfirm,
                                child: CustomText(
                                  text: 'เสร็จสิ้น',
                                  color: ThemeConfig.primary,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: date,
                              maximumDate: DateTime(2030, 12, 30),
                              onDateTimeChanged: onDateChange,
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
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ThemeConfig.primary, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    CustomText(
                      text: date == null ? title : date.toString().split(' ')[0],
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: ThemeConfig.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
