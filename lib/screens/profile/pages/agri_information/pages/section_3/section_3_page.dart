import 'package:agri/screens/profile/pages/agri_information/bloc/agri_info_bloc.dart';
import 'package:agri/screens/profile/pages/agri_information/info_image.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_3_model.dart';
import 'package:agri/screens/profile/pages/agri_information/pages/section_2/widgets/section_2_rice_field_plot_widget.dart';
import 'package:agri/screens/profile/pages/agri_information/pages/section_3/widgets/section_3_add_machine_page.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Section3Page extends StatefulWidget {
  const Section3Page({super.key});

  @override
  State<Section3Page> createState() => _Section3PageState();
}

class _Section3PageState extends State<Section3Page> {
  final TextEditingController _controller41 = TextEditingController();
  final TextEditingController _controller42 = TextEditingController();
  final TextEditingController _controller43 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButtonWidget(),
        ),
        body: BlocBuilder<AgriInfoBloc, AgriInfoState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image.asset(InfoImages.section3, width: 150, height: 150),
                  const SizedBox(height: 20),
                  const CustomText(
                    text: 'ส่วนที่ 3',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff194902),
                  ),
                  const CustomText(
                    text: 'การตัดสินใจใช้บริการเครื่องจักรใน\nกระบวนการผลิตข้าวของครัวเรือน',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 30),
                  _buildBgThemeWidget(
                    context: context,
                    title: '3. การใช้งานเครื่องจักรในการผลิตข้าว',
                    titleColor: const Color(0xff194902),
                    fontSize: 18,
                    child: _build3(context),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: '4. ข้อมูลสนับสนุนอื่นๆ',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff194902),
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildBgThemeWidget(
                    context: context,
                    title: '4.1 แปลงนี้ได้รับการสนับสนุนจากภาครัฐอย่างไรบ้าง',
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: CupertinoTextField(
                        controller: Section3Model.part4[0],
                        minLines: 4,
                        maxLines: 20,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildBgThemeWidget(
                    context: context,
                    title: '4.1 4.2 ท่านพอใจกับผลผลิตข้าวที่ได้นี้หรือไม่ เพราะอะไร',
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: CupertinoTextField(
                        controller: Section3Model.part4[1],
                        minLines: 4,
                        maxLines: 20,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildBgThemeWidget(
                    context: context,
                    title: '4.3 ท่านคิดว่าข้าวหอมมะลิมีความหอมลดลง จากในอดีตหรือไม่ เพราะอะไร',
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: CupertinoTextField(
                        controller: Section3Model.part4[2],
                        minLines: 4,
                        maxLines: 20,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  CupertinoButton(
                    color: const Color(0xff194902),
                    onPressed: () {
                      if (Section3Model.data3.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'กรุณาเพิ่มการใช้งานเครื่องจักร',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        return;
                      }

                      if (Section3Model.part4[0].text.isEmpty ||
                          Section3Model.part4[1].text.isEmpty ||
                          Section3Model.part4[2].text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: 'กรุณากรอกข้อมูลให้ครบถ้วน',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        return;


                      }
                        state.isSection3Pending = true;
                      setState(() {});
                      print(state.isSection3Pending);
                        Navigator.pop(context);
                    },
                    child: const CustomText(
                      text: 'บันทึกข้อมูล',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Column _build3(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              color: const Color(0xff206102),
              child: const CustomText(
                text: 'เพิ่ม',
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const Section3AddMachinePage()));
                setState(() {});
              },
            ),
            const SizedBox(width: 16),
            const CustomText(
              text: 'กรุณาเพิ่มการใช้งานเครื่องจักร',
              fontSize: 16,
              color: Colors.red,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: Section3Model.data3.map((riceField) {
            return Section3HomeWidget(
              selectedRiceField: riceField,
              iconSuffix: ImageProviders.section3Head,
              onRemove: () {
                _showRemoveRiceField(
                  context: context,
                  riceField: riceField,
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showRemoveRiceField({
    required BuildContext context,
    required Section3Model riceField,
  }) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: CustomText(text: 'ต้องการลบ ${riceField.process} หรือไม่?'),
            actions: [
              CupertinoDialogAction(
                child: const CustomText(
                  text: 'ยกเลิก',
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: const CustomText(
                  text: 'ตกลง',
                  color: Colors.green,
                ),
                onPressed: () {
                  Section3Model.data3.remove(riceField);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget _buildBgThemeWidget({
    required BuildContext context,
    required String title,
    Color? titleColor,
    double? fontSize,
    required Widget child,
  }) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.bold,
              color: titleColor ?? Colors.black,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
            ),
            child,
          ],
        ));
  }
}
