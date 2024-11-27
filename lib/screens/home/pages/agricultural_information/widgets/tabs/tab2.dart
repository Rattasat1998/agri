import 'package:agri/models/tractor_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/bloc/agricultural_information_bloc.dart';
import 'package:agri/screens/home/pages/agricultural_information/head/head_manage_machinery_page.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/role_status.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tab2 extends StatelessWidget {
  final List<GroupMachineModelDataMachine> machines;

  const Tab2({Key? key, required this.machines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHead = RoleStatus().getRoleHead(context);
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Visibility(
              visible: isHead,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'สำหรับหัวหน้ากลุ่มเกษตรกร',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: ThemeConfig.headButtonColor,
                      child: const CustomText(
                        text: 'บริหารเครื่องจักร',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        await Navigator.pushNamed(context, AppRoutes.headManageMachineryPage);

                      },
                    )
                  ],
                ),
              ),
            ),
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
                    child: const CustomText(text: 'เครื่องจักรทั้งหมด'),
                  ),
                ],
              ),
            ),
            machines.isEmpty
                ? const SizedBox(
                    height: 200,
                    child: Center(
                        child: CustomText(
                      text: 'ไม่มีเครื่องจักร',
                      color: Colors.grey,
                    )))
                : Wrap(
                    direction: Axis.horizontal,
                    // runAlignment: WrapAlignment.start,
                    children: [
                      ...machines
                          .map((e) {
                            print('star rating: ${e.rating}');
                            return GestureDetector(
                        onTap: (){

                          context.read<MachineryBloc>().add(MachineryGetMachineryByIdEvent(id: e.machineId.toString()));
                          Navigator.pushNamed(context, AppRoutes.machineryInfoPage);
                        },
                            child: Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff303030),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          e.machineImg!,
                                          height: 120,
                                          width: 180,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      CustomText(
                                        text: e.machineName ?? '',
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      CustomText(
                                        text: e.groupName ?? '',
                                        color: Colors.yellow,
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text: 'รถของ : ${e.user ?? ''}',
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      //RatingBarWidget(rating: e.rating ?? 0.0),
                                    ],
                                  ),
                                ),
                          );
                          })
                          .toList()
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
