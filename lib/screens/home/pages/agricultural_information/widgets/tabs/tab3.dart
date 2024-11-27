import 'package:agri/models/member_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_member_model.dart';
import 'package:agri/widgets/custom_profile_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  final List<GroupMemberModelDataMember> members;

  const Tab3({Key? key, required this.members}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    color: Colors.green.shade100,
                    thickness: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const CustomText(text: 'สมาชิกั้งหมด'),
                  ),
                ],
              ),
            ),
            members.isEmpty
                ? const SizedBox(
                    height: 200,
                    child: Center(
                        child: CustomText(
                      text: 'ไม่มีข้อมูลสมาชิกในกลุ่มนี้',
                      color: Colors.grey,
                    )))
                : Wrap(
                    direction: Axis.horizontal,
                    children: [
                      ...members
                          .map((e) => Container(
                                //alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: const Color(0xff303030),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    CustomProfileWidget(profileImg: e.profileImg ?? ''),
                                    const SizedBox(height: 5),
                                    CustomText(
                                      text: e.firstname!,
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    CustomText(
                                      text: 'ที่นา : ${e.numberFields} ไร่',
                                      color: Colors.yellow,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ))
                          .toList()
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
