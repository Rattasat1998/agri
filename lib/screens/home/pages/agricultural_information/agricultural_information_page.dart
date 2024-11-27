import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/models/group_head_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_information_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_member_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/tabbar_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/widgets/gen_excel.dart';
import 'package:agri/screens/home/pages/agricultural_information/widgets/tabs/tab1.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/app_routers.dart';
import '../../../request_machine/bloc/request_machine_bloc.dart';
import '../machinery/bloc/machinery_bloc.dart';
import '../statistics/bloc/statistics_bloc.dart';
import 'widgets/tabs/tab2.dart';
import 'widgets/tabs/tab3.dart';
import 'widgets/tabs/tabbar_bloc.dart';

class AgriculturalInformationPage extends StatefulWidget {
  const AgriculturalInformationPage({Key? key}) : super(key: key);

  @override
  State<AgriculturalInformationPage> createState() => _AgriculturalInformationPageState();
}

class _AgriculturalInformationPageState extends State<AgriculturalInformationPage> {
  final _tabBloc = TabBloc();

  int _currentIndex = 0;
  List<Widget> pages = [];

  @override
  void dispose() {
    _tabBloc.dispose();
    super.dispose();
  }

  int currentCell = 1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgriculturalInformationBloc, AgriculturalInformationState>(
      builder: (context, state) {
        if (state is AgriculturalInformationLoading) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator.adaptive()),
          );
        }
        if (state is AgriculturalInformationLoaded) {
          final InformationModelData groupInformationModel =
              state.groupInformationModel.data!.information!;
          final GroupAddressModelGroupData groupAddressModel =
              state.groupAddressModel.data!.groupData!;
          final GroupHeadAddressModelData? groupHeadAddressModel =
              state.groupHeadAddressModel!.data;
          final List<GroupMachineModelDataMachine> groupMachineModel = state.groupMachineModel.data!.machines;
          print(groupMachineModel.length);
          final List<GroupMemberModelDataMember> groupMemberModel =
              state.groupMemberModel.data!.members;

          pages = [
            Tab1(address: groupAddressModel, headAddress: groupHeadAddressModel),
            Tab2(machines: groupMachineModel),
            Tab3(members: groupMemberModel),
          ];

          return Scaffold(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            body: NestedScrollView(
              headerSliverBuilder: (context, a) {
                return [
                  _buildSliverAppBarWidget(context, groupInformationModel),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              const CustomText(
                                text: 'กลุ่มข้อมูลเกษตรกร',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    margin: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: Colors.black, width: 2),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: Image.network(
                                              groupInformationModel.groupImg ?? '',
                                              fit: BoxFit.cover,
                                              height: 100,
                                              width: 120,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: groupInformationModel.groupName ?? '',
                                                fontSize: 16,
                                                color: Colors.black,
                                                overflow: TextOverflow.visible,
                                                textAlign: TextAlign.left,
                                              ),
                                              CustomText(
                                                text: groupInformationModel.usersCount.toString(),
                                                fontSize: 25,
                                                color: Colors.black,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(right: 16.0),
                                                child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: CustomText(
                                                    text: 'คน',
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                      ],
                                    ),
                                  ),
                                  const Positioned(
                                      top: 20,
                                      right: 20,
                                      child: Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                      ))
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                    margin: const EdgeInsets.only(
                                        left: 16, top: 4, bottom: 4, right: 50),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: const CustomText(
                                      text: 'รถไถทั้งหมดของกลุ่ม',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 10,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: Colors.green.shade300,
                                      child: CustomText(
                                        text: groupInformationModel.machineCount.toString(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    _buildStatusWidget(
                                      context: context,
                                      qty: groupInformationModel.machineStatus1.toString(),
                                      textStatus: 'ว่าง',
                                    ),
                                    _buildStatusWidget(
                                      context: context,
                                      qty: groupInformationModel.machineStatus2.toString(),
                                      textStatus: 'ติดจอง',
                                    ),
                                    _buildStatusWidget(
                                      context: context,
                                      qty: groupInformationModel.machineStatus3.toString(),
                                      textStatus: 'กำลังใช้งาน',
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.lightGreenAccent.shade100.withOpacity(.5),
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff223917),
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const CustomText(
                                        text: 'รายละเอียดเพิ่มเติม',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        // width: MediaQuery.of(context).size.width,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              _buildMoreDetailWidget(
                                                context: context,
                                                title: 'กลุ่ม',
                                                qty: groupInformationModel.groupFields ?? '0',
                                                textUnit: 'ไร่',
                                              ),
                                              const SizedBox(width: 16),
                                              _buildMoreDetailWidget(
                                                context: context,
                                                title: 'คุณ',
                                                qty: '${groupInformationModel.myFields ?? '0'}',
                                                textUnit: 'ไร่',
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _TabBarDelegate(
                      child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                        return Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                           /* borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              topLeft: Radius.circular(18),
                            ),*/
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: TabBarModel.tabs.map((e) {
                              int index = TabBarModel.tabs.indexOf(e);
                              return GestureDetector(
                                onTap: () {
                                  _tabBloc.mapEventToState(TabEvent.tabChanged, index);
                                  setState(() {
                                    _currentIndex = index; // Update _currentIndex
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: _currentIndex == index
                                        ? const Color(0xff203914)
                                        : Colors.grey,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(e.icon, color: Colors.white, size: 20),
                                      Visibility(
                                        visible: _currentIndex == index,
                                        child: const SizedBox(width: 8),
                                      ),
                                      AnimatedOpacity(
                                        duration: const Duration(milliseconds: 200),
                                        opacity: _currentIndex == index ? 1.0 : 0.0,
                                        child: Visibility(
                                          visible: _currentIndex == index,
                                          child: CustomText(
                                            text: e.title,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }),
                    ),
                  ),
                ];
              },
              body: StreamBuilder<int>(
                stream: _tabBloc.currentIndex,
                initialData: 0,
                builder: (context, snapshot) {
                  final currentIndex = snapshot.data ?? 0;
                  return pages[currentIndex];
                },
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: SizedBox(),
          );
        }
      },
    );
  }

  SliverAppBar _buildSliverAppBarWidget(BuildContext context, InformationModelData information) {
    final isAdmin = RoleStatus().getRoleAdmin(context);
    final isHead = RoleStatus().getRoleHead(context);
    return SliverAppBar(
      pinned: true,
      //expandedHeight: 240.0 + (100 * 3.5),
      leading: const BackButtonWidget(color: Color(0xff206102)),
      actions: [
        Visibility(
          visible: isAdmin,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ExcelGeneration(
                    groupId: int.parse(information.groupId.toString()),
                  ),
                ),
              );
              //generateExcel();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffE8FFDD),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  CustomText(
                    text: 'ดาวน์โหลด',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.download_rounded,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isHead,
          child: GestureDetector(
            onTap: () {
              context.read<MachineryBloc>().add(MachineryInitialEvent());
              context.read<StatisticsBloc>().add(StatisticsInitialEvent());
              context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
              Navigator.pushNamed(context, AppRoutes.requestMachineScreen);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffE8FFDD),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Row(
                children: [
                  CustomText(
                    text: 'แจ้งเตือน',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      // Your SliverAppBar content goes here
    );
  }

  Widget _buildMoreDetailWidget({
    required BuildContext context,
    required String title,
    required String qty,
    required String textUnit,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 16,
          child: CustomText(
            text: title,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
        Image.asset(
          ImageProviders.block,
          width: 30,
        ),
        const SizedBox(
          width: 20,
        ),
        Row(
          children: [
            CustomText(
              text: qty,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText(
              text: textUnit,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }

  Widget _buildStatusWidget({
    required BuildContext context,
    required String qty,
    required String textStatus,
  }) {
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: MediaQuery.of(context).size.width / 3.5,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  CustomText(
                    text: qty,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    text: textStatus,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const CustomText(
                text: 'สถานะ',
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _TabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
