import 'package:agri/models/home_menu_model.dart';
import 'package:agri/models/home_model.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/statistics/bloc/statistics_bloc.dart';
import 'package:agri/screens/home/widgets/custom_home_menu.dart';
import 'package:agri/screens/news/blocs/news_bloc/news_bloc.dart';
import 'package:agri/screens/notification/bloc/notification_bloc.dart';
import 'package:agri/screens/request_machine/bloc/request_machine_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/widgets/custom_profile_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/machinery/bloc/machinery_bloc.dart';
import 'pages/training_schedule/bloc/training_bloc.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({Key? key}) : super(key: key);

  @override
  State<HomeUserScreen> createState() => _HomeUserScreenState();
}

class _HomeUserScreenState extends State<HomeUserScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
    //context.read<NotificationBloc>().add(NotificationStarted());
    context.read<StatisticsBloc>().add(StatisticsInitialEvent());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
      context.read<NotificationBloc>().add(NotificationStarted());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = RoleStatus().getRoleAdmin(context);
    final isHead = RoleStatus().getRoleHead(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: isHead,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                color: const Color(0xff242623),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    const CustomText(
                      text: 'คำขอยืมเครื่องจักร',
                      fontSize: 20,
                      color: Color(0xff9ABC95),
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.read<MachineryBloc>().add(MachineryInitialEvent());
                        context.read<StatisticsBloc>().add(StatisticsInitialEvent());
                        context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
                        Navigator.pushNamed(context, AppRoutes.requestMachineScreen);
                      },
                      child: Stack(
                        children: [
                          Image.asset(ImageProviders.email, width: 30, height: 30),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: BlocBuilder<RequestMachineBloc, RequestMachineState>(
                              builder: (context, state) {
                                if (state is RequestMachineLoading) {
                                  return const CircularProgressIndicator.adaptive();
                                }
                                if (state is RequestMachineLoaded) {
                                  final count = state.requestList.length;
                                  return Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 16,
                                      minHeight: 16,
                                    ),
                                    child: Text(
                                      count.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: isHead ? 0 : 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomHomeMenu(
                        title: 'ข้อมูล',
                        subtitle: 'กลุ่มเกษตรกรของคุณ',
                        bg: ImageProviders.homeMenu1,
                        isBgText: true,
                        onPressed: () {
                          context.read<MachineryBloc>().add(MachineryInitialEvent());
                          context
                              .read<AgriculturalInformationBloc>()
                              .add(AgriculturalInformationInitialEvent(
                                isAdmin: isAdmin,
                                isHead: isHead,
                              ));
                          return Navigator.pushNamed(
                              context, AppRoutes.agriculturalInformationPage);
                        },
                      ),
                      const SizedBox(width: 5),
                      CustomHomeMenu(
                        title: 'สถิติ',
                        titleFontSize: 25,
                        subtitle: 'การใช้งานเครื่องจักร',
                        subtitleFontSize: 14,
                        bg: ImageProviders.homeMenu2,
                        iconImage: ImageProviders.homeMenuIncress,
                        onPressed: () {
                          context.read<StatisticsBloc>().add(StatisticsInitialEvent());
                          return Navigator.pushNamed(context, AppRoutes.statisticsPage);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      CustomHomeMenu(
                        title: 'ข่าวสาร/\nประชาสัมพันธ์',
                        subtitle: '',
                        height: 150,
                        titleFontSize: 18,
                        textColor: Colors.black,
                        verticalPadding: 10,
                        horizontalPadding: 25,
                        marginBottom: 20,
                        bg: ImageProviders.homeMenu3,
                        isBgText: true,
                        onPressed: () async {
                          context.read<NewsBloc>().add(NewsInitialEvent());
                          await Navigator.pushNamed(context, AppRoutes.newsPage);
                        },
                      ),
                      const SizedBox(width: 5),
                      CustomHomeMenu(
                        title: 'ตารางฝึกอบรม',
                        titleFontSize: 20,
                        subtitle: '',
                        height: 150,
                        subtitleFontSize: 14,
                        verticalPadding: 7,
                        horizontalPadding: 16,
                        textColor: Colors.black,
                        isBgText: true,
                        marginBottom: 35,
                        bg: ImageProviders.homeMenu4,
                        onPressed: () {
                          context.read<TrainingBloc>().add(TrainingInitialEvent());
                          Navigator.pushNamed(context, AppRoutes.trainingSchedulePage);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomHomeMenu(
                    title: 'เครื่องจักร',
                    titleFontSize: 20,
                    subtitle: '',
                    subtitleFontSize: 14,
                    verticalPadding: 7,
                    horizontalPadding: 16,
                    textColor: Colors.black,
                    isBgText: true,
                    marginBottom: 35,
                    height: 187,
                    bg: ImageProviders.homeMenu5,
                    width: MediaQuery.of(context).size.width,
                    onPressed: () {
                      context.read<MachineryBloc>().add(MachineryInitialEvent());
                      return Navigator.pushNamed(context, AppRoutes.machineryPage);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   isExtended: true,
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 100,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 10),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is HomeLoaded) {
              final account = state.homeModel!.data!.homeData!;
              return Padding(
                padding: const EdgeInsets.only(top: 20, right: 16, left: 20),
                child: Row(
                  children: [
                    CustomProfileWidget(profileImg: account.profileImg),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: account.fullname ?? '',
                            fontSize: 20,
                            color: Colors.white,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.start,
                          ),
                          CustomText(
                            text: account.groupName ?? '',
                            fontSize: 16,
                            color: const Color(0xffFFE500),
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<NotificationBloc>().add(NotificationStarted());
                            Navigator.pushNamed(context, AppRoutes.notificationScreen);
                          },
                          icon: const Icon(
                            Icons.notifications_rounded,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: BlocBuilder<NotificationBloc, NotificationState>(
                            builder: (context, state) {
                              if (state is NotificationLoaded) {
                                final count = state.count;
                                return Visibility(
                                  visible: count > 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 16,
                                      minHeight: 16,
                                    ),
                                    child: Text(
                                      count.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
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
}


