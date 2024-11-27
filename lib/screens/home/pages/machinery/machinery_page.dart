import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_machinery_card_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MachineryPage extends StatelessWidget {
  const MachineryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButtonWidget(),
      ),
      body: BlocBuilder<MachineryBloc, MachineryState>(
        builder: (context, state) {
          if (state is MachineryLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is MachineryLoaded) {
            final machinery = state.machineryModel.data!.machineList;
            return Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConfig.primary,
                  child: const CustomText(
                    text: 'จองใช้งานเครื่องจักร',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Divider(
                        color: Colors.green.shade100,
                        thickness: 2,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const CustomText(text: 'รายการเครื่องจักร'),
                      ),
                    ],
                  ),
                ),

                machinery.isEmpty ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: CustomText(
                      text: 'ไม่มีข้อมูลเครื่องจักร',
                      color: Colors.grey,
                    )
                  ),
                ) :

                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: machinery.length,
                    itemBuilder: (context, index) {
                      final item = machinery[index];
                      return CustomMachineryCardWidget(
                        machineImg: item.machineImg!,
                        machineName: item.machineName!,
                        groupName: item.groupName!,
                        user: item.user!,
                        message: item.message!,
                        borrowingCount: item.borrowingCount!,
                        numberFields: item.numberFields!,
                        rating: item.rating,
                        onPressed: () {
                          context.read<MachineryBloc>().add(
                                MachineryGetMachineryByIdEvent(
                                  id: item.machineId.toString(),
                                ),
                              );
                          Navigator.pushNamed(
                            context,
                            AppRoutes.machineryDetailPage,
                            arguments: item,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const CustomText(
                text: 'Something went wrong',
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold);
          }
        },
      ),
    );
  }
}
