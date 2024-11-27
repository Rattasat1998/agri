import 'package:agri/bloc/auth/auth_bloc.dart';
import 'package:agri/models/group_model.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/group_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/bloc/register_bloc.dart';
import 'bloc/dashboard_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<DashboardBloc>()
        .add(DashboardInitialEvent(apiEndPoint: ApiEndPoint.getDashboard));

    context.read<RegisterBloc>().add(RegisterInitialEvent());

    _onRefresh();

  }


  void _onRefresh() {
    context
        .read<DashboardBloc>()
        .add(DashboardInitialEvent(apiEndPoint: ApiEndPoint.getDashboard));
    context.read<AuthBloc>().add(AuthLoginEvent());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<DashboardBloc>()
              .add(DashboardInitialEvent(apiEndPoint: ApiEndPoint.getDashboard));
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is DashboardLoaded) {
              final groups = state.dashboardModel.data?.groupsLists ?? [];

              return ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xffB5D6D9),
                    ),
                    child: Row(
                      children: [
                        Image.asset(IconsProviders.personfamily),
                        const SizedBox(width: 10),
                        const CustomText(text: 'รายการกลุ่มเกษตรกรนาแปลงใหญ่'),
                      ],
                    ),
                  ),
                  groups.isEmpty
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomText(
                                  text: 'ไม่มีข้อมูล',
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 20),
                                CupertinoButton(
                                  color: ThemeConfig.subPrimary,
                                  child: const CustomText(text: 'เข้าสู่ระบบ',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                  onPressed: () {
                                    Navigator.pushNamed(context, AppRoutes.loginScreen);
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: groups.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = groups[index];
                            return GroupCardWidget(
                              totalRiceFields: item.numberFields!.toDouble(),
                              allMember: item.usersCount!.toInt(),
                              tractors: item.machineCount!.toInt(),
                              cover: item.groupImg ?? 'https://cdn.pixabay.com/photo/2017/07/03/20/00/field-2468835_1280.jpg',
                              profile: item.groupImg ?? 'https://cdn.pixabay.com/photo/2017/07/03/20/00/field-2468835_1280.jpg',
                              address: item.groupAddress!,
                              groupName: item.groupName!,
                              groupId: item.groupId.toString(),
                            );
                          }),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final bool isLogin = context.read<AuthBloc>().state.isLoggedIn;
    print('isLogin: $isLogin');
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: !isLogin ? null : const BackButtonWidget(
        color: Color(0xff206102),
      ),
      title: Visibility(
        visible: !isLogin,
        child: Container(
            margin: const EdgeInsets.only(left: 0),
            child: Image.asset(
              ImageProviders.logo2,
              width: 70,
            )),
      ),
      toolbarHeight: 90,
      actions: [
        Visibility(
          visible: !isLogin,
          child: CupertinoButton(
            child: const Column(
              children: [
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                CustomText(
                  text: 'เข้าสู่ระบบ',
                  color: Colors.white,
                )
              ],
            ),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.loginScreen),
          ),
        )
      ],
    );
  }
}
