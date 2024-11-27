import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_detail_model.dart';
import 'package:agri/screens/home/pages/machinery/models/objectives_model.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomMachineryHistoryListWidget extends StatelessWidget {
  final List<History> historyList;
  final List<Objective> objectives;
  final ScrollPhysics? physics;

  const CustomMachineryHistoryListWidget({
    super.key,
    required this.historyList,
    required this.objectives,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: historyList.length,
      physics: physics,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        final history = historyList[index];
        final objectiveList = objectives;
        final objective = MachineryBloc().findObjectiveNameById(history.objectiveId!, objectiveList);
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 1,
              )
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: NetworkImage(history.profileImg),
            ),
            title: const CustomText(
              text: 'ใช้งาน ',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
            ),
            subtitle: CustomText(
              text: objective,
              color: Colors.green,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
            ),
            trailing: CustomText(
              text:
                  '${history.startDate.toString().split(' ')[0]} ถึง ${history.endDate.toString().split(' ')[0]}',
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.start,
            ),
          ),
        );
      },
    );
  }
}
