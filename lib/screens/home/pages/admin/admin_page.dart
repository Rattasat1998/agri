import 'package:agri/screens/home/pages/admin/bloc/admin_bloc.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

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
      body: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          if (state is AdminLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is AdminLoaded) {
            final adminList = state.adminModel.data!.adminList;
            return Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: MediaQuery.of(context).size.width,
                  color: ThemeConfig.primary,
                  child: const CustomText(
                    text: 'แอดมินในระบบ',
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xffB5D6D9),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.settings_outlined, color: ThemeConfig.primary, size: 30),
                      const SizedBox(width: 10),
                      CustomText(
                          text: 'รายการ',
                          color: ThemeConfig.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                /*Wrap(
                  direction: Axis.horizontal,
                  children: [
                    ...adminList
                        .map((item) => Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xff303030), borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(item.profileImg!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: '${item.firstname!} ${item.lastname!} dasdadsasdasdadasd',
                            fontSize: 18,
                            color: const Color(0xffFFED7A),
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ),)
                        .toList()
                  ],
                ),*/
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: adminList.length,
                  itemBuilder: (context, index) {
                    final item = adminList[index];
                    return  Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xff303030), borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(item.profileImg!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: '${item.firstname!} ${item.lastname!}',
                            fontSize: 14,
                            color: const Color(0xffFFED7A),
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
