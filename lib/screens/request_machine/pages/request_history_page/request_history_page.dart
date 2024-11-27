import 'package:agri/screens/request_machine/models/approve_request_model.dart';
import 'package:agri/screens/request_machine/pages/request_history_page/bloc/request_history_bloc.dart';
import 'package:agri/utils/convert_date_time.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/smart_refresh_widget.dart';
import 'package:agri/utils/status_color.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../utils/app_routers.dart';
import '../../../../widgets/back_button_widget.dart';
import '../../bloc/request_machine_bloc.dart';

class RequestHistoryPage extends StatefulWidget {
  const RequestHistoryPage({super.key});

  @override
  State<RequestHistoryPage> createState() => _RequestHistoryPageState();
}

class _RequestHistoryPageState extends State<RequestHistoryPage> {

  final RefreshController refreshController = RefreshController(initialRefresh: false);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestHistoryBloc, RequestHistoryState>(
      builder: (context, state) {
        final requestList = state.requestList;
        return Scaffold(
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
              _buildHeaderWidget(context),
              const SizedBox(height: 16),
              _buildCustomTabBarWidget(state: state, context: context),
              Expanded(
                child: state.isTabLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                        child: requestList.isEmpty
                            ? const Center(
                                child: CustomText(
                                text: 'ไม่มีคำขอยืมเครื่องจักร',
                                color: Colors.grey,
                              ))
                            : SmartRefreshWidget(
                                onRefresh: () async {
                                  context.read<RequestHistoryBloc>().add(RequestHistoryRefreshEvent());
                                  await context.read<RequestHistoryBloc>().stream.first;
                                  refreshController.refreshCompleted();
                                },
                                onLoad: () async {
                                  context.read<RequestHistoryBloc>().add(RequestHistoryLoadMoreEvent());
                                  await context.read<RequestHistoryBloc>().stream.first;
                                  refreshController.loadComplete();
                                },
                                refreshController: refreshController,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    // physics: const NeverScrollableScrollPhysics(),
                                    itemCount: requestList.length,
                                    itemBuilder: (context, index) {
                                      final request = requestList[index];
                                      return _buildListDataWidget(request, context, state);
                                    }),
                              )),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomTabBarWidget({
    required RequestHistoryState state,
    required BuildContext context,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: state.currentTab == 0 ? const Color(0xff206102) : Colors.green.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  context.read<RequestHistoryBloc>().add(RequestHistoryChangedTabEvent(0));
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
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  context.read<RequestHistoryBloc>().add(RequestHistoryChangedTabEvent(1));
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
    );
  }

  Widget _buildListDataWidget(
      RequestList request, BuildContext context, RequestHistoryState state) {
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
                      children: [
                        const CustomText(
                          text: 'ยืม ',
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(width: 10),
                        CustomText(
                          text: request.machineName,
                          fontSize: 16,
                          color: Colors.black,
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    CustomText(
                      text: request.message,
                      fontSize: 16,
                      color: StatusColors().getColor(request.status),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                    ),
                    /*const SizedBox(width: 10),
                    CustomText(
                      text: ConvertDateTime.convertDate(DateTime.parse(request.)),
                      fontSize: 16,
                    ),*/
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
                context.read<RequestMachineBloc>().add(RequestMachineApproveDetailInGroupEvent(
                    request.borrowId.toString(), state.currentTab));
                await Navigator.pushNamed(context, AppRoutes.requestApproveDetailPage, arguments: {
                  'isFromHistory': true,
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
      width: double.infinity,
      color: const Color(0xffD9D9D9),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: const CustomText(
        text: 'คำขอยืมเครื่องจักร',
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
