import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConclusionPage extends StatelessWidget {
  const ConclusionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Center(
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
      ),
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
