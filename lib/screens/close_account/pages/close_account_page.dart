import 'package:agri/bloc/auth/auth_bloc.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/profile/repository/profile_repository.dart';
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

class CloseAccountPage extends StatefulWidget {
  const CloseAccountPage({super.key});

  @override
  State<CloseAccountPage> createState() => _CloseAccountPageState();
}

class _CloseAccountPageState extends State<CloseAccountPage> {

  bool _isDelete = false;
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width,
              color: ThemeConfig.primary,
              child: const CustomText(
                text: 'ลบบัญชีผู้ใช้',
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'กรุณากรอกรหัสผ่าน',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  CupertinoTextField(
                    placeholder: 'รหัสผ่าน',
                    obscureText: _obscureText,
                    controller: _passwordController,
                    enableSuggestions: false,
                    placeholderStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _isDelete = true;
                        });
                      } else {
                        setState(() {
                          _isDelete = false;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: CupertinoButton(
                      color: Colors.red,
                      onPressed: _isDelete == false ? null :

                          () {
                        showDialog(
                            context: context,
                            builder: (context) {
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
                                        final homeState = context.read<HomeBloc>().state;
                                        final response = await ProfileRepository().closeAccount(password: _passwordController.text);
                                        print(response);
                                        if (response['result'] == true) {
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
                                        } else {
                                          EasyLoading.dismiss();
                                          EasyLoading.showError(response['message'] ?? '');
                                        }
                                      },
                                      child: const CustomText(
                                        text: 'ลบบัญชีผู้ใช้',
                                        color: Colors.white,
                                      )),
                                ],
                              );
                            });
                      },
                      child: const CustomText(
                        text: 'ลบบัญชีผู้ใช้',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
