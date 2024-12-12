import 'package:agri/app.dart';
import 'package:agri/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:agri/screens/profile/bloc/profile_bloc.dart';
import 'package:agri/screens/register/bloc/register_bloc.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../home/bloc/home_bloc.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC5DFC3),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: const Color(0xffC5DFC3),
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButtonWidget(),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: ThemeConfig.primary,
            child: const CustomText(
              text: 'ตั้งค่า',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.white,
            child: const Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.settings_outlined, color: Color(0xff184A01)),
                SizedBox(width: 10),
                CustomText(
                  text: 'รายการ',
                  color: Color(0xff184A01),
                  fontSize: 18,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildRowButtonWidget(
            title: 'ข้อมูลของฉัน',
            //icon: const Icon(Icons.lock, color: Colors.black),
            onTap: () async {
              context.read<ProfileBloc>().add(RefreshProfile());
              await Navigator.pushNamed(context, AppRoutes.editProfileScreen);
              context.read<ProfileBloc>().add(RefreshProfile());
              context.read<HomeBloc>().add(HomeInitialEvent());
              // Navigator.pushNamed(context, '/change-password');
            },
            color: Colors.black,
            icon: const Icon(CupertinoIcons.person_crop_circle, color: Color(0xff206200)),
          ),
          _buildRowButtonWidget(
            title: 'เปลี่ยนรหัสผ่าน',
            //icon: const Icon(Icons.lock, color: Colors.black),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.changePasswordPage);
            },
            color: Colors.black,
            icon: const Icon(CupertinoIcons.doc_text_fill, color: Color(0xff206200)),
          ),
          _buildRowButtonWidget(
            title: 'คำขอลบบัญชีผู้ใช้',
            //icon: const Icon(Icons.lock, color: Colors.black),
            onTap: () {
              //vNavigator.pushNamed(context, AppRoutes.changePasswordPage);
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: const Text('คำขอลบบัญชีผู้ใช้'),
                  content: const Text('คุณต้องการลบบัญชีผู้ใช้หรือไม่?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const CustomText(
                          text: 'ยกเลิก',
                          color: Colors.grey,
                        )),
                    CupertinoButton(
                        color: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () async {
                          EasyLoading.show(status: 'กำลังส่งคำขอลบบัญชีผู้ใช้...');
                          await Future.delayed(const Duration(seconds: 3));

                          EasyLoading.dismiss();
                          /*final response = await ApiEndPoint.deleteUser();
                          if (response.statusCode == 200) {
                            EasyLoading.dismiss();
                            await LocalStorage.removeToken();
                            Get.offAllNamed(AppRoutes.dashboardScreen);
                          } else {
                            EasyLoading.dismiss();
                            EasyLoading.showError('ไม่สามารถลบบัญชีผู้ใช้ได้');
                          }*/
                        },
                        child: const CustomText(
                          text: 'ลบบัญชีผู้ใช้',
                          color: Colors.white,
                        )),
                  ],
                );
              });
            },
            color: Colors.black,
            icon: const Icon(CupertinoIcons.delete, color: Color(0xff206200)),
          ),
          _buildRowButtonWidget(
            title: 'ออกจากระบบ',
            icon: const Icon(Icons.login, color: Color(0xffBF1D1D)),
            onTap: () {
              _logoutDialogWidget(context);
            },
            color: const Color(0xffBF1D1D),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _logoutDialogWidget(BuildContext context) {
    return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('ออกจากระบบ'),
                  content: const Text('คุณต้องการออกจากระบบหรือไม่?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const CustomText(
                          text: 'ยกเลิก',
                          color: Colors.grey,
                        )),
                    CupertinoButton(
                        color: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () async {
                          final homeState = context.read<HomeBloc>().state;
                          EasyLoading.show(status: 'กำลังออกจากระบบ...');
                          await LocalStorage.removeToken();


                          Get.clearRouteTree();
                          context.read<AuthBloc>().add(AuthLoginEvent());

                          await context.read<AuthBloc>().stream.first;
                          if(homeState is HomeLoaded){
                            homeState.homeModel = null;
                          }
                          EasyLoading.dismiss();
                          Get.back();
                          Get.offAllNamed(AppRoutes.dashboardScreen);
                          setState(() {
                            // ignore: avoid_print
                            print('logout');
                          });

                          //Navigator.pushNamed(context, AppRoutes.loginScreen);
                        },
                        child: const CustomText(
                          text: 'ออกจากระบบ',
                          color: Colors.white,
                        )),
                  ],
                );
              },
            );
  }

  Widget _buildRowButtonWidget({
    required String title,
    Widget? icon,
    required Function() onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: title, fontSize: 16, color: color,fontWeight: FontWeight.bold),
            icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
