import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/conclusion_bloc.dart';

class SystemRiceInfoPage extends StatefulWidget {
  const SystemRiceInfoPage({super.key});

  @override
  State<SystemRiceInfoPage> createState() => _SystemRiceInfoPageState();
}

class _SystemRiceInfoPageState extends State<SystemRiceInfoPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ConclusionBloc>().add(ConclusionInitialSystemRiceEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:_buildAppBar(),
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
          }  else {
            final questions = state.systemRiceModel!.data!.questions;
            print('questions: $questions');

            return SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/rice-info.png', width: 80),
                    const SizedBox(height: 16),
                    const CustomText(
                      text: 'ส่วนที่ 2 ข้อมูลเกี่ยวกับระบบการปลูกข้าว',
                      color: Color(0xff194902),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...questions.entries.map((e) {
                            return Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 8),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        text: '${e.key}.',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 8),
                                      CustomText(
                                        text: e.value.question.toString(),
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      CustomText(
                                        text: e.value.answer.toString(),
                                        fontSize: 14,
                                        textAlign: TextAlign.start,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    )

                  ],
                ),
              ),
            );
          }



        },
      ),

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
