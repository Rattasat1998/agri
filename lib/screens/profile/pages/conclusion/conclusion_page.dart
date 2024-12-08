import 'package:agri/screens/profile/pages/conclusion/bloc/conclusion_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'repository/conclusion_repository.dart';

class ConclusionPage extends StatefulWidget {
  const ConclusionPage({super.key});

  @override
  State<ConclusionPage> createState() => _ConclusionPageState();
}

class _ConclusionPageState extends State<ConclusionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIsSummary();
  }

  void _checkIsSummary() async {
    final json = await ConclusionRepository().checkIsSummary();
    if (!json['result']) {
      CustomDialog.showCustomDialog(
        context: context,
        title: '',
        description: json['message'],
        icon: Image.asset(ImageProviders.incorrect, width: 80),
        onPressed: () {
          Get.back();
          Get.back();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: /* Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Image.asset('assets/icons/conclusion.png', width: 200),
            const SizedBox(height: 16),
            const CustomText(
              text: 'สรุปข้อมูลด้านเกษตร',
              color: Color(0xff194902),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const CustomText(
              text: 'ของผู้ใช้',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              color: const Color(0xff496C39),
              child: const CustomText(
                text: 'ข้อมูลทรัพยากรครัวเรือน',
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.familyInfoPage),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              color: const Color(0xff496C39),
              child: const CustomText(
                text: 'ข้อมูลระบบการปลูกข้าว',
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.systemRiceInfoPage),
            ),
          ],
        ),
      ),*/

            FutureBuilder(
                future: ConclusionRepository().checkIsSummary(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    final json = snapshot.data as Map<String, dynamic>;
                    if (json['result']) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Image.asset('assets/icons/conclusion.png', width: 200),
                            const SizedBox(height: 16),
                            const CustomText(
                              text: 'สรุปข้อมูลด้านเกษตร',
                              color: Color(0xff194902),
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            const CustomText(
                              text: 'ของผู้ใช้',
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 16),
                            CupertinoButton(
                              color: const Color(0xff496C39),
                              child: const CustomText(
                                text: 'ข้อมูลทรัพยากรครัวเรือน',
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<ConclusionBloc>().add(ConclusionInitialFamilyEvent());
                                Navigator.pushNamed(context, AppRoutes.familyInfoPage);
                              },
                            ),
                            const SizedBox(height: 16),
                            CupertinoButton(
                              color: const Color(0xff496C39),
                              child: const CustomText(
                                text: 'ข้อมูลระบบการปลูกข้าว',
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.read<ConclusionBloc>().add(ConclusionInitialSystemRiceEvent());
                                Navigator.pushNamed(context, AppRoutes.systemRiceInfoPage);
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CustomText(
                          text: 'ไม่พบข้อมูล',
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  }
                  return const SizedBox();
                })

        /**/
        );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const BackButtonWidget(),
    );
  }
}
