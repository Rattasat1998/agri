import 'package:agri/screens/request_machine/bloc/request_machine_bloc.dart';
import 'package:agri/screens/request_machine/models/approve_request_model.dart';
import 'package:agri/screens/request_machine/pages/request_history_page/bloc/request_history_bloc.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_routers.dart';

class RequestMachineScreen extends StatelessWidget {
  const RequestMachineScreen({super.key});

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
      body: BlocBuilder<RequestMachineBloc, RequestMachineState>(
        builder: (context, state) {
          if (state is RequestMachineLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is RequestMachineLoaded) {
            final requestList = state.requestList;

            return Column(
              children: [
                _buildHeaderWidget(context),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: state.currentTab == 0 ? const Color(0xff206102) : Colors.green.shade300,
                          borderRadius:  BorderRadius.circular(8),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              context.read<RequestMachineBloc>().add(RequestMachineChangedTabEvent(0));
                            },
                            child: CustomText(
                              text: state.tabList[0],
                              color: state.currentTab == 0 ? Colors.white : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: state.currentTab == 1 ? const Color(0xff206102) : Colors.green.shade300,
                          borderRadius:  BorderRadius.circular(8),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              context.read<RequestMachineBloc>().add(RequestMachineChangedTabEvent(1));
                            },
                            child: CustomText(
                              text: state.tabList[1],
                              color: state.currentTab == 1 ? Colors.white : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
                Expanded(
                  child: state.isTabLoading ? const Center(child: CircularProgressIndicator.adaptive()) : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    child: requestList.isEmpty
                        ? const Center(
                            child: CustomText(
                            text: 'ไม่มีคำขอยืมเครื่องจักร',
                            color: Colors.grey,
                          ))
                        : ListView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: requestList.length,
                            itemBuilder: (context, index) {
                              final request = requestList[index];
                              return _buildListDataWidget(request, context, state);
                            }),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
                child: CustomText(
                    text: 'Something went wrong.', fontSize: 20, fontWeight: FontWeight.bold));
          }
        },
      ),
    );
  }

  Widget _buildListDataWidget(RequestList request, BuildContext context, RequestMachineLoaded state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 00, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xffF6F6F6),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(ImageProviders.emailGreen, width: 50, height: 50),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: request.groupName,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'ยืม ',
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomText(
                            text: request.machineName,
                            fontSize: 16,
                            color: Colors.black,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () async {
                //context.read<NewsBloc>().add(NewsDeleteEvent(news.id));
                context
                    .read<RequestMachineBloc>()
                    .add(RequestMachineApproveDetailInGroupEvent(request.borrowId.toString(),state.currentTab));
                await Navigator.pushNamed(context, AppRoutes.requestApproveDetailPage,arguments: {
                  'isFromHistory':  false,
                  'inGroup': state.currentTab,
                });
                context.read<RequestMachineBloc>().add(RequestMachineInitialEvent());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff206102),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
                child: const CustomText(
                  text: 'รายละเอียด',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderWidget(BuildContext context) {
    return Container(
      color: const Color(0xffD9D9D9),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          const CustomText(text: 'คำขอยืมเครื่องจักร', fontSize: 20, fontWeight: FontWeight.bold),
          const Spacer(),
          GestureDetector(
            onTap: () async {
               context.read<RequestHistoryBloc>().add(RequestHistoryChangedTabEvent(0));
              Navigator.pushNamed(context, AppRoutes.requestHistoryPage);
              // await Navigator.pushNamed(context, AppRoutes.addEditNewsPage, arguments: false);
              //context.read<NewsBloc>().add(NewsReSetValueOnEditEnterEvent());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffA6C698),
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1,
                  )
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'ประวัติ',
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.history,
                    color: Colors.black,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
