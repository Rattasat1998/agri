import 'package:agri/models/group_model.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/permission_service.dart';

class GroupCardWidget extends StatelessWidget {
  const GroupCardWidget({
    super.key,
    required this.totalRiceFields,
    required this.allMember,
    required this.tractors,
    required this.cover,
    required this.profile,
    required this.address,
    required this.groupName,
    required this.groupId,
  });

  final double totalRiceFields;
  final int allMember;
  final int tractors;
  final String cover;
  final String profile;
  final String address;
  final String groupName;
  final String groupId;

  @override
  Widget build(BuildContext context) {
    // final isAdmin = RoleStatus().getRoleAdmin(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: const Color(0xffB3CBAF),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xff00630A))),
      child: Column(
        children: [
          SizedBox(
              width: 376,
              height: 214,
              child: Image.network(
                cover,
                fit: BoxFit.cover,
              )),
          const SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: const Color(0xff174800),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(profile),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomText(
                  text: groupName,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomText(
            text: address,
            fontSize: 16,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.group,
                        size: 25,
                        color: Colors.green.shade500,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            const CustomText(text: 'สมาชิก', textAlign: TextAlign.left),
                            Row(
                              children: [
                                Expanded(
                                    child: CustomText(
                                        text: allMember.toString(),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        overflow: TextOverflow.visible)),
                                const CustomText(text: '  คน'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.grid_on,
                        size: 25,
                        color: Colors.brown.shade500,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const CustomText(text: 'ที่นารวม', textAlign: TextAlign.left),
                                      CustomText(
                                        text: totalRiceFields.toStringAsFixed(0),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                                const CustomText(text: '  ไร่'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                    text: 'มีรถไถทั้งหมด ',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.visible),
                Row(
                  children: [
                    CustomText(
                      text: ' $tractors ',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    const CustomText(
                      text: ' คัน',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildSeeDataForAdminWidget(context),
        ],
      ),
    );
  }

  Widget _buildSeeDataForAdminWidget(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          final isAdmin = state.homeModel?.data?.role == 'ADM';
          final isHead = state.homeModel?.data?.role == 'HED';
          return Visibility(
            visible: isAdmin,
            child: GestureDetector(
              onTap: () async {
                context.read<AgriculturalInformationBloc>().add(AgriculturalInformationInitialEvent(
                      isAdmin: isAdmin,
                      gId: groupId,
                      isHead: isHead,
                    ));
                context.read<MachineryBloc>().add(MachineryInitialEvent());
                Navigator.pushNamed(context, AppRoutes.agriculturalInformationPage);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xff0F2E00),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const CustomText(
                    text: 'ดูข้อมูลกลุ่ม',
                    color: Colors.white,
                    fontSize: 20,
                    textAlign: TextAlign.center),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
