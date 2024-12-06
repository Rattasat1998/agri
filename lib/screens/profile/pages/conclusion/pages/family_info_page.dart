import 'package:agri/screens/profile/pages/conclusion/bloc/conclusion_bloc.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FamilyInfoPage extends StatefulWidget {
  const FamilyInfoPage({super.key});

  @override
  State<FamilyInfoPage> createState() => _FamilyInfoPageState();
}

class _FamilyInfoPageState extends State<FamilyInfoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ConclusionBloc>().add(ConclusionInitialFamilyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: BlocBuilder<ConclusionBloc, ConclusionState>(
        builder: (context, state) {
          if (state.isLoading) {
            return  Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 800,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    ),
                    const SizedBox(height: 4),

                  ],
                ),
              ),
            );
          } else {
            final interview = state.familyInfoModel!.data!.inerviw;
            final response = state.familyInfoModel!.data!.respon;
            final machineSummary = state.familyInfoModel!.data!.machineSummary;
            final totalMachine = state.familyInfoModel!.data!.totalMachines;

            return SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/vecvec.png', width: 50),
                    const SizedBox(height: 16),
                    const CustomText(
                      text: 'ส่วนที่ 1 ข้อมูลทรัพยากรครัวเรือน',
                      color: Color(0xff194902),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 16),
                    _buildBackGroundContainerWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: '1. ข้อมูลเบื้องต้นของการสัมภาษณ์',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 16),
                          _buildRowDataWidget(
                            title: 'ชื่อผู้สัมภาษณ์ : ',
                            value: interview?.interviewerName ?? '',
                          ),
                          _buildRowDataWidget(
                            title: 'หมายเลขโทรศัพท์ : ',
                            value: interview?.interviewerTel ?? '',
                          ),
                          _buildRowDataWidget(
                            title: 'สังกัด : ',
                            value: interview?.affiliation ?? '',
                          ),
                          _buildRowDataWidget(
                            title: 'วันที่สัมภาษณ์ : ',
                            value: interview?.date ?? '',
                          ),
                          const Divider(thickness: 1, color: Colors.black),
                          _buildRowDataWidget(
                            title: 'ชื่อผู้ให้สัมภาษณ์ : ',
                            value: response?.respondentName ?? '',
                          ),
                          _buildRowDataWidget(
                            title: 'ที่อยู่ : ',
                            value: response?.address ?? '',
                          ),
                          _buildRowDataWidget(
                            title: 'หมายเลขโทรศัพท์ : ',
                            value: response?.tel ?? '',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildBackGroundContainerWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: '2. ชนิดและจำนวนเครื่องจักรกลที่ครอบครอง',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 16),
                          _buildRowDataWidget(
                            title: 'รวมจำนวนเครื่องจักรทั้งหมด : ',
                            value: '$totalMachine คัน/เครื่อง',
                          ),
                          const CustomText(
                            text: 'จำแนกเป็น',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          const SizedBox(height: 8),
                          ...List.generate(
                            machineSummary.length,
                                (index) {
                              return Row(

                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: '${index+1}. ${machineSummary[index].machineType}',
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  CustomText(
                                    text: ' จำนวน ${machineSummary[index].numberOfMachines} คัน/เครื่อง',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            );
          }


        },
      ),
    );
  }

  Widget _buildRowDataWidget({
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 14,
          color: const Color(0xff206102),
          fontWeight: FontWeight.bold,
        ),
        Expanded(
          child: CustomText(
            text: value,
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildBackGroundContainerWidget({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const BackButtonWidget(),
    );
  }
}
