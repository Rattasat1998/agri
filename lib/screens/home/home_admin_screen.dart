import 'package:agri/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/news/blocs/news_bloc/news_bloc.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_profile_widget.dart';
import '../notification/bloc/notification_bloc.dart';
import 'pages/admin/bloc/admin_bloc.dart';
import 'pages/training_schedule/bloc/training_bloc.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          /*  Container(
              // margin: const EdgeInsets.only(top: 16),
              color: const Color(0xff496C39),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (state is HomeLoaded) {
                    final account = state.homeModel.data!.homeData!;
                    return  Padding(
                      padding: const EdgeInsets.only(top: 20, right: 16, left: 20),
                      child: Row(
                        children: [
                          Card(
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                            child: CircleAvatar(
                              radius: 43,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(account.profileImg),
                              ),
                            ),
                          ),
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
                                const CustomText(
                                  text: 'แอดมิน',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFE500),
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
                          )
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Stack(
                children: [
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2016/11/14/03/50/farmer-1822530_960_720.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: CustomText(
                          text: 'สำหรับแอดมิน',
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenuDataWidget(
                      title: 'ข้อมูลกลุ่มเกษตรกร\nในระบบ',
                      iconAssets: ImageProviders.adminHomeMenuF,
                      onPressed: () {
                        context.read<DashboardBloc>().add(DashboardInitialEvent(apiEndPoint: ApiEndPoint.getDashboardAdmin));
                        Navigator.pushNamed(context, AppRoutes.dashboardScreen);
                       /* context.read<AgriculturalInformationBloc>().add(AgriculturalInformationInitialEvent());
                        return Navigator.pushNamed(context, AppRoutes.agriculturalInformationPage);*/
                      },
                    ),
                    _buildMenuDataWidget(
                      title: 'ข่าวสาร/ประชาสัมพันธ์',
                      iconAssets: ImageProviders.adminHomeMenuN,
                      onPressed: () async {
                        context.read<NewsBloc>().add(NewsInitialEvent());
                        await Navigator.pushNamed(context, AppRoutes.newsPage);
                      },
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenuDataWidget(
                      title: 'การอบรม',
                      iconAssets: ImageProviders.adminHomeMenuP,
                      onPressed: () {
                        context.read<TrainingBloc>().add(TrainingInitialEvent());
                        Navigator.pushNamed(context, AppRoutes.trainingSchedulePage);
                      },
                    ),
                    _buildMenuDataWidget(
                      title: 'ผู้ใช้แอดมิน',
                      iconAssets: ImageProviders.adminHomeMenuG,
                      onPressed: () {
                        context.read<AdminBloc>().add(AdminInitialEvent());
                        Navigator.pushNamed(context, AppRoutes.adminPage);
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuDataWidget({
    required String title,
    required String iconAssets,
    required Function() onPressed,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 170,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white38, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                iconAssets,
                height: 50,
                width: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: title,
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {



    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      toolbarHeight: 100,

      flexibleSpace: Container(
        // margin: const EdgeInsets.only(top: 16),
        color: const Color(0xff496C39),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is HomeLoaded) {
              final account = state.homeModel!.data!.homeData!;
              return  Padding(
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
                          const CustomText(
                            text: 'แอดมิน',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFE500),
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
                    )
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
