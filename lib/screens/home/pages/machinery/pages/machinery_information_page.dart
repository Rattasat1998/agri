import 'package:agri/screens/home/pages/machinery/bloc/machinery_bloc.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class MachineryInformationPage extends StatelessWidget {
  const MachineryInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final machineState = context.watch<MachineryBloc>().state;
    if (machineState is MachineryLoaded) {
      return machineState.isDetailLoading
          ? const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            )
          : Scaffold(
              body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const BackButtonWidget(),
                  expandedHeight: 300,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      machineState.machineryInfoModel!.data!.machineInformation!.machineImg!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                height: 70,
                                color: const Color(0xff496C39),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: machineState.machineryInfoModel!.data!
                                          .machineInformation!.machineName!,
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                    CustomText(
                                      text: machineState
                                          .machineryInfoModel!.data!.machineInformation!.groupName!,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  _makePhoneCall(machineState
                                      .machineryInfoModel!.data!.machineInformation!.tel!);
                                },
                                child: Container(
                                  height: 70,
                                  padding: const EdgeInsets.all(10),
                                  color: const Color(0xff29411F),
                                  child: Image.asset(ImageProviders.phone),
                                ),
                              )),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
                        margin: const EdgeInsets.only(top: 16),
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: const Color(0xffC5E0E2),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: RatingBar.builder(
                                initialRating: machineState.machineryInfoModel!.data!.machineInformation!.rating!,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 30,
                                ignoreGestures: true,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const CustomText(
                              text: 'รายละเอียด',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff496C39),
                            ),
                            CustomText(
                              text: machineState
                                  .machineryInfoModel!.data!.machineInformation!.description!,
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                _buildDataWidget(
                                  value: machineState
                                      .machineryInfoModel!.data!.machineInformation!.borrowingCount
                                      .toString(),
                                  title: 'ใช้งานในระบบยืม',
                                  subTitle: 'ครั้ง',
                                ),
                                _buildDataWidget(
                                  value: machineState
                                      .machineryInfoModel!.data!.machineInformation!.numberFields
                                      .toString(),
                                  title: 'จำนวนงานในระบบ',
                                  subTitle: 'ไร่',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
    }

    return const Scaffold();
  }

  Widget _buildDataWidget({
    required String title,
    required String value,
    required String subTitle,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          children: [
            CustomText(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              overflow: TextOverflow.visible,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: value,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff496C39),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: subTitle,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
