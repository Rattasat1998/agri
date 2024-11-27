import 'package:agri/screens/home/pages/machinery/models/machinery_detail_model.dart';
import 'package:agri/screens/home/pages/machinery/models/objectives_model.dart';
import 'package:agri/screens/home/pages/machinery/widgets/custom_machinery_history_list_widget.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HistoryListWidget extends StatelessWidget {
  final List<History> historyList;
  final List<Objective> objectives;

  const HistoryListWidget({
    super.key,
    required this.historyList,
    required this.objectives,
  });

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
      body: ListView(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: ThemeConfig.primary,
            child: const CustomText(
              text: 'ประวัติการใช้งานเครื่องจักร',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomMachineryHistoryListWidget(
              historyList: historyList,
              objectives: objectives,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
