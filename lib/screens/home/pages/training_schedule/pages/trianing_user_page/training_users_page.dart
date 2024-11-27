import 'package:agri/screens/home/pages/training_schedule/models/train_user_model.dart';
import 'package:agri/screens/home/pages/training_schedule/repository/training_repository.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../utils/custom_toast.dart';

class TrainingUsersPage extends StatefulWidget {
  final String id;

  const TrainingUsersPage({super.key, required this.id});

  @override
  State<TrainingUsersPage> createState() => _TrainingUsersPageState();
}

class _TrainingUsersPageState extends State<TrainingUsersPage> {
  final TrainingRepository _trainingRepository = TrainingRepository();

  bool isLoading = false;
  List<UserList> userList = [];
  InformationTrain? informationTrain;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() async {
    isLoading = true;
    TrainUserModel? response = await _trainingRepository.getUserRegisterTrainingById(id: widget.id);
    if (response != null) {
      setState(() {
        informationTrain = response.data?.informationTrain;
        userList = response.data?.userLists ?? [];
        isLoading = false;
      });
    } else {
      informationTrain = null;
      userList = [];
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const CustomText(
          text: 'รายชื่อผู้เข้าอบรม',
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : userList.isEmpty
              ? const Center(
                  child: Text('ไม่มีข้อมูลผู้เข้าอบรม'),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              child: CustomText(
                                text: informationTrain?.trainName ?? '',
                                fontSize: 18,
                                color: Colors.black,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: 'สถานที่ : ${informationTrain?.address ?? ''}',
                              fontSize: 16,
                              color: Colors.black,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.start,
                            ),
                            CustomText(
                              text: 'วันที่ : ${informationTrain?.trainDate.toString().substring(
                                    0,
                                    10,
                                  ).replaceAll(
                                    '-',
                                    '/',
                                  ) ?? ''} ${informationTrain?.trainTime ?? ''} น.',
                              fontSize: 16,
                              color: Colors.black,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      /*const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                       // margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child:  const CustomText(
                          text: 'รายชื่อผู้เข้าอบรม',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),*/
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: 'จำนวนผู้เข้าอบรม : ${userList.length} คน',
                            fontSize: 16,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: userList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final user = userList[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: .1,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: ThemeConfig.subPrimary,
                                  child: CustomText(
                                    text: '${index + 1}',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: '${user.firstname} ${user.lastname}',
                                        fontSize: 16,
                                        color: Colors.black,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.visible,
                                      ),
                                      Visibility(
                                        visible: user.groupName != '',
                                        child: CustomText(
                                          text: user.groupName,
                                          fontSize: 14,
                                          color: Colors.black,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}
