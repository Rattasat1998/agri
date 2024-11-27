import 'package:agri/screens/profile/bloc/profile_bloc.dart';
import 'package:agri/screens/profile/models/profile_model.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_profile_widget.dart';
import '../home/bloc/home_bloc.dart';
import '../register/pages/policy_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9ABC95),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            final profile = state.profileModel.data!.profile!;
            return ListView(
              children: [
                _buildProfileWidget(profile),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildMenuButtonWidget(
                        leadIcon: Icons.person,
                        title: 'ข้อมูลของฉัน',
                        onTap: () async {

                          context.read<ProfileBloc>().add(RefreshProfile());
                          await Navigator.pushNamed(context, AppRoutes.editProfileScreen);
                          context.read<ProfileBloc>().add(RefreshProfile());
                          context.read<HomeBloc>().add(HomeInitialEvent());
                        },
                        borderRadius: null,
                        subText: null,
                      ),
                      _buildMenuButtonWidget(
                        leadIcon: CupertinoIcons.doc_text,
                        title: 'ข้อมูลด้านเกษตรกร',
                        onTap: () {
                           Navigator.pushNamed(context, AppRoutes.agriInformationScreen);
                        },
                        borderRadius: null,
                        subText: 'กรอกข้อมูล !',
                      ),
                      _buildMenuButtonWidget(
                        leadIcon: CupertinoIcons.doc_text,
                        title: 'ข้อกำหนดและเงื่อนไข',
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context) =>  const PolicyPage(isAccepted: false,)));
                          // Navigator.pushNamed(context, AppRoutes.profileScreen);
                        },
                        borderRadius: null,
                        subText: null,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildMenuButtonWidget({
    required IconData leadIcon,
    required String title,
    required Function() onTap,
    required BorderRadiusGeometry? borderRadius,
    required String? subText,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        decoration: const BoxDecoration(
          color: Colors.transparent,
         // borderRadius: borderRadius,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            top: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  leadIcon,
                  color: const Color(0xff206200),
                  size: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: title,
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              children: [
                Visibility(
                  visible: subText != null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: CustomText(
                      text: subText ?? '',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_circle_right_outlined, size: 30, color: Colors.black),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildProfileWidget(ProfileModel profile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff496C39),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
          width: 5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child:  CustomProfileWidget(profileImg: profile.profileImg ?? ''),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomText(
                  text: '${profile.firstname!} ${profile.lastname!}',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
