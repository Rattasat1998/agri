import 'package:agri/screens/home/pages/statistics/bloc/statistics_bloc.dart';
import 'package:agri/screens/notification/bloc/notification_bloc.dart';
import 'package:agri/screens/notification/models/notification_model.dart';
import 'package:agri/screens/request_machine/bloc/request_machine_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/convert_date_time.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/utils/smart_refresh_widget.dart';
import 'package:agri/widgets/app_bar_title_widget.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../home/pages/machinery/bloc/machinery_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    bool isHead = RoleStatus().getRoleHead(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const AppBarTitleWidget(title: 'การแจ้งเตือน'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
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
                Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Color(0xff0F2E00),
                ),
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
          BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if(state is NotificationLoading){
                return SizedBox(
                    height: MediaQuery.of(context).size.height /2,
                    child: const Center(child: CircularProgressIndicator.adaptive()));
              }
              if (state is NotificationLoaded) {
                return Expanded(
                  child: SmartRefreshWidget(
                    onRefresh: () async {
                      context.read<NotificationBloc>().add(NotificationRefresh());
                      context.read<NotificationBloc>().stream.first;
                      refreshController.refreshCompleted();
                    },
                    refreshController: refreshController,
                    onLoad: () async {
                      context.read<NotificationBloc>().add(NotificationLoadMore());
                      context.read<NotificationBloc>().stream.first;
                      refreshController.loadComplete();
                    },
                    child: state.notifications.isEmpty ? SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: CustomText(
                          text: 'ไม่มีข้อมูล',
                          color: Color(0xff0F2E00),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ) : ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.notifications.length,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final notification = state.notifications[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: notification.notiIsreaded != 1
                                ? const Color(0xffA4D2D0)
                                : Colors.white,
                            border: const Border(
                              left: BorderSide(
                                color: Color(0xffC5E0E2),
                                width: 10,
                              ),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: const Color(0xffC5E0E2),
                                  child: Image.asset(
                                    ImageProviders.notification,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: notification.notiTitle,
                                      color: const Color(0xff0F2E00),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    CustomText(
                                      text: notification.notiSub,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.75,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.calendar_today, size: 16),
                                              const SizedBox(width: 5),
                                              CustomText(
                                                text: ConvertDateTime.convertDate(
                                                    notification.createdAt!),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ],
                                          ),
                                          CupertinoButton(
                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                            color: const Color(0xff103300),
                                            child: const CustomText(
                                              text: 'กดดู',
                                              color: Colors.white,
                                            ),
                                            onPressed: () => _borrowDetailFunction(
                                                context, notification, isHead),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const BackButtonWidget(),
      actions: [
        BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoaded) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xffE98122),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 26),
                    CustomText(
                      text: state.count.toString(),
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }

  void _borrowDetailFunction(BuildContext context, NotificationData notification, bool isHead) {
    final inGroup = notification.notiType == 1 ? 0 : 1;
    print('notification type = : ${notification.notiType}');
    print('notification id = : ${notification.notiId}');
    context.read<MachineryBloc>().add(MachineryInitialEvent());
    context.read<NotificationBloc>().add(NotificationMarkAsRead(notification.notiId));
    if (isHead) {
      // context.read<>()
      context
          .read<RequestMachineBloc>()
          .add(RequestMachineApproveDetailInGroupEvent(notification.borrowId.toString(), inGroup));
      Navigator.pushNamed(context, AppRoutes.requestApproveDetailPage,arguments: {
      'isFromHistory':  true,
      'inGroup': inGroup,
      });
    } else {
      context
          .read<StatisticsBloc>()
          .add(StatisticsGetBorrowDetailByIdEvent(id: notification.borrowId.toString()));
      Navigator.pushNamed(context, AppRoutes.statisticsHistoryDetailPage, arguments: false);
    }
  }
}
