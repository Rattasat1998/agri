import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/statistics/bloc/statistics_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/convert_date_time.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/smart_refresh_widget.dart';
import 'package:agri/utils/status_color.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/app_bar_title_widget.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StatisticsBorrowHistoryPage extends StatefulWidget {
  const StatisticsBorrowHistoryPage({super.key});

  @override
  State<StatisticsBorrowHistoryPage> createState() => _StatisticsBorrowHistoryPageState();
}

class _StatisticsBorrowHistoryPageState extends State<StatisticsBorrowHistoryPage> {
  final RefreshController refreshController = RefreshController(initialRefresh: false);

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
        body: SmartRefreshWidget(
          onRefresh: () async {
            context.read<StatisticsBloc>().add(StatisticsGetInGroupEvent(pageNumber: 1));
            context.read<StatisticsBloc>().stream.first;
            refreshController.refreshCompleted();
          },
          onLoad: () async {
            context.read<StatisticsBloc>().add(StatisticsHistoryLoadMoreEvent());
            context.read<StatisticsBloc>().stream.first;
            refreshController.loadComplete();
          },
          refreshController: refreshController,
          child: ListView(
            children: [
              const AppBarTitleWidget(title: 'รายการประวัติการยืม'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xffC5E0E2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(CupertinoIcons.doc_plaintext, size: 30),
                    SizedBox(width: 10),
                    CustomText(
                      text: 'รายการยืมในกลุ่ม',
                      color: Color(0xff0F2E00),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildCustomTabBarWidget(),
              const SizedBox(height: 10),
              BlocBuilder<StatisticsBloc, StatisticsState>(
                builder: (context, state) {
                  if (state is StatisticsLoaded) {
                    return state.isLoading
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : state.historyGroup!.isEmpty
                            ? const SizedBox(
                                height: 200,
                                child: Center(
                                  child: CustomText(
                                    text: 'ไม่มีรายการยืม',
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            :

                    ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.historyGroup!.length,
                            itemBuilder: (context, index) {
                              final item = state.historyGroup![index];
                              return GestureDetector(
                                onTap: () {
                                  context.read<StatisticsBloc>().add(StatisticsGetBorrowDetailByIdEvent(id: item.borrowId.toString()));
                                  Navigator.pushNamed(context, AppRoutes.statisticsHistoryDetailPage, arguments: false);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          item.machineImg!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: item.machineName!,
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.left,
                                              color: ThemeConfig.primary,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomText(
                                              text: item.groupName!,
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.left,
                                              fontSize: 12,
                                            ),
                                            CustomText(
                                              text:
                                                  'ยืมในระหว่าง ${ConvertDateTime.convertDate(item.startDate!)}',
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.left,
                                              fontSize: 12,
                                            ),
                                            CustomText(
                                              text:
                                                  'ถึง ${ConvertDateTime.convertDate(item.endDate!)}',
                                              overflow: TextOverflow.visible,
                                              textAlign: TextAlign.left,
                                              fontSize: 12,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(
                                                  text: 'สถานะ : ',
                                                  overflow: TextOverflow.visible,
                                                  textAlign: TextAlign.left,
                                                  fontSize: 12,
                                                ),
                                                Expanded(
                                                  child: CustomText(
                                                    text: item.message!,
                                                    overflow: TextOverflow.visible,
                                                    textAlign: TextAlign.left,
                                                    fontSize: 12,
                                                    color: StatusColors().getColor(item.status!),
                                                  ),
                                                ),
                                              ],
                                            ),



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  } else {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: CustomText(
                          text: 'ไม่มีรายการยืม',
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ));
  }

  Widget _buildCustomTabBarWidget() {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        if (state is StatisticsLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state is StatisticsLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children: state.tabs
                        .asMap()
                        .entries
                        .map(
                          (e) => _tab(
                            title: e.value,
                            color: state.currentTab == e.key
                                ? ThemeConfig.subPrimary
                                : ThemeConfig.primary,
                            onTap: () {
                              context
                                  .read<StatisticsBloc>()
                                  .add(StatisticsChangedTapEvent(currentTab: e.key));
                            },
                          ),
                        )
                        .toList()),
                Image.asset(ImageProviders.history, width: 30, height: 30)
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _tab({
    required String title,
    required Color color,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(CupertinoIcons.group_solid, size: 30, color: Colors.white),
            const SizedBox(width: 10),
            CustomText(
              text: title,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
