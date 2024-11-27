import 'package:agri/screens/home/pages/statistics/bloc/statistics_bloc.dart';
import 'package:agri/screens/home/pages/statistics/models/statistics_model.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/app_bar_title_widget.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

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
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        builder: (context, state) {
          if (state is StatisticsLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is StatisticsLoaded) {
            final data = state.statisticsModel.data!.statistics!;
            return ListView(
              children: [
                const AppBarTitleWidget(title: 'สถิติการใช้งานของคุณ'),
                const SizedBox(height: 20),
                _buildMachineryInSyatemWidget(data),
                const SizedBox(height: 20),
                _buildMachineryGroupWidget(data),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: const Color(0xffC5E0E2),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTotalOfMachineryWorkWidget(data),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          color: const Color(0xff02613F),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                ImageProviders.document,
                                width: 50,
                                height: 50,
                              ),
                              const CustomText(
                                text: 'ประวัติการยืม',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          ),
                          onPressed: () {
                            context.read<StatisticsBloc>().add(StatisticsGetInGroupEvent(pageNumber: 1));
                            Navigator.pushNamed(context, AppRoutes.statisticsBorrowHistoryPage);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const CustomText(text: 'Error', color: Colors.red);
          }
        },
      ),
    );
  }

  Container _buildTotalOfMachineryWorkWidget(Statistics data) {
    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xff22361B), width: 3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'จำนวนงานทั้งหมด',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   CustomText(
                                    text: data.numberFields.toString(),
                                    fontSize: 30,
                                    color: const Color(0xff206102),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(width: 16),
                                  const CustomText(
                                    text: 'ไร่',
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(width: 50),
                                  Image.asset(
                                    ImageProviders.block,
                                    width: 50,
                                    height: 50,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
  }

  Padding _buildMachineryGroupWidget(Statistics data) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    _buildCardWidget(
                      count: data.borrowInGroup.toString(),
                      title: 'ยืมในกลุ่ม',
                    ),
                    const SizedBox(width: 10),
                    _buildCardWidget(
                      count: data.borrowOutGroup.toString(),
                      title: 'ยืมนอกกลุ่ม',
                    ),
                  ],
                ),
              );
  }

  Container _buildMachineryInSyatemWidget(Statistics data) {
    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff22361B),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                      child: Row(
                        children: [
                          Image.asset(ImageProviders.stack, width: 100, height: 100),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: 'ยืมเครื่องจักรในระบบ',
                                fontSize: 20,
                                color: Color(0xffFFE071),
                                fontWeight: FontWeight.bold,
                              ),
                              const CustomText(
                                text: 'จำนวน/ครั้ง',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              _buildCounterWidget(
                                count: data.borrowTotal.toString(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }

  Widget _buildCardWidget({
    required String count,
    required String title,
  }) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xffB0C7AC),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              )
            ],
          ),
          child: Column(
            children: [
              CustomText(
                text: title,
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildCounterWidget(count: count),
              ),
            ],
          )),
    );
  }

  Widget _buildCounterWidget({
    required String count,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xffC3FFF4),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xff6A9556), width: 4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(ImageProviders.ic01, width: 25, height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: CustomText(
              text: count,
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

