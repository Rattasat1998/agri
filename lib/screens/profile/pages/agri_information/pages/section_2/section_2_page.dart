import 'package:agri/screens/profile/pages/agri_information/models/rice_field_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_2_data_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_2_model.dart';
import 'package:agri/screens/profile/pages/agri_information/pages/section_2/widgets/section_2_rice_field_plot_widget.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/agri_info_bloc.dart';
import '../../info_image.dart';

class Section2Page extends StatefulWidget {
  const Section2Page({super.key});

  @override
  State<Section2Page> createState() => _Section2PageState();
}

class _Section2PageState extends State<Section2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButtonWidget(),
      ),
      body: BlocBuilder<AgriInfoBloc, AgriInfoState>(builder: (context, state) {
        return SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(InfoImages.section2, width: 150, height: 150),
                const SizedBox(height: 20),
                const CustomText(
                  text: 'ส่วนที่ 2',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff194902),
                ),
                const CustomText(
                  text: 'ข้อมูลระบบการปลูกข้าว รายแปลง',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    color: const Color(0xff194902),
                    child: const CustomText(
                      text: 'เพิ่มแปลงปลูกข้าว',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    onPressed: () async {
                    final response =  await Navigator.pushNamed(context, AppRoutes.section2RiceFieldPage);
                    if(response != null){
                      print('response');
                      _clearSection2();
                      state.selectedRiceField =null;
                    }
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Section2DataModel.datas.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Column(
                          children: Section2DataModel.datas.map((riceField) {
                            return Section2RiceFieldPlotHomeWidget(
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
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/info/docn.png', width: 100, height: 100),
                            const SizedBox(height: 10),
                            const CustomText(
                              text: 'ไม่มีรายการ',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
        );
      }),
    );
  }

  void _showRemoveRiceField({
    required BuildContext context,
    required RiceFieldModel riceField,
  }) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: CustomText(text: 'ต้องการลบ ${riceField.riceFieldName} หรือไม่?'),
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
                  Section2DataModel.datas.remove(riceField);
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }


  void _clearSection2(){
    Section2Model.s211 = S211(
      question: '2.1.1 ประเภทการปลูกข้าว',
      values: [
        Section2ValueTextModel(text: '1. นาอินทรีย', value: false),
        Section2ValueTextModel(text: '2. นาสารเคมี', value: false),
        Section2ValueTextModel(text: '3. อื่นๆ', value: false),
      ],
    );
    Section2Model.s212 = S212(
      question: '2.1.2 ผลผลิตของข้าวเมื่อปีการผลิตที่แล้ว',
      values: [
        Section2PVSModel(
          prefix: 'ปีการผลิต พ.ศ.',
          controller: TextEditingController(),
          suffix: '',
        ),
        Section2PVSModel(
          prefix: 'ผลผลิตรวมต่อไร่',
          controller: TextEditingController(),
          suffix: 'กิโลกรัม/ไร่',
        ),
        Section2PVSModel(
          prefix: 'ผลผลิตรวมรายแปลง',
          controller: TextEditingController(),
          suffix: 'กิโลกรัม',
        ),
      ],
    );
    Section2Model.s213 = S213(
      question: '2.1.3 แปลงนานี้ได้ผลกระทบจากแล้งหรือไม่',
      values: S213Model(
        value1: Section2ValueTextModel(text: '1. ไม่ได้รับผลกระทบ', value: false),
        value2: Section2CheckVSModel(
          value: false,
          text: '2. ได้รับผลกระทบ ร้อยละ',
          controller: TextEditingController(),
          suffix: 'ของพื้นที',
        ),
      ),
    );
    Section2Model.s214 = S214(
      question: '2.1.4 ลักษณะของพื้นที่แปลง',
      values: [
        Section2ValueTextModel(text: '1. ที่ลุ่ม', value: false),
        Section2ValueTextModel(text: '2. ที่ทาม', value: false),
        Section2ValueTextModel(text: '3. ที่ดอน, โคก', value: false),
        Section2ValueTextModel(text: '4. แอ่งกระทะ', value: false),
        Section2ValueTextModel(text: '5. ราบ ขั้นบันได', value: false),
      ],
    );
   /* Section2Model.s215 = S215(
      question: '2.1.5 ปีที่ผ่านมาท่านได้ทำนาปรังหรือไม่',
      values: S213Model(
        value1: Section2ValueTextModel(text: '1. ไม่ได้ทำ', value: false),
        value2: Section2CheckVSModel(
          value: false,
          text: '2. ทำนาปรัง ได้ผลผลิต',
          controller: TextEditingController(),
          suffix: 'กิโลกรัม/ไร่',
        ),
      ),
    );*/
    Section2Model.s221 = S221(
      question: '2.2.1 ประเภทข้าวที่ปลูก',
      datas: [
        S221Model(
          text: '1. ข้าวเหนียว',
          value: false,
          values: [
            S221DataModel(
              text: 'พันธุ์กข.8',
              value: false,
            ),
            S221DataModel(
              text: 'พันธุ์หางยี 71',
              value: false,
            ),
            S221DataModel(
              text: 'พันธุ์เหนียวเขี้ยวงู',
              value: false,
            ),
            S221DataModel(
              text: 'พันธุ์ข้าวเหนียวดำ',
              value: false,
            ),
          ],
        ),
        S221Model(
          text: '2. ข้าวเจ้า',
          value: false,
          values: [
            S221DataModel(
              text: 'พันธุ์ขาวดอกมะลิ 105',
              value: false,
            ),
            S221DataModel(
              text: 'พันธุ์กข.6',
              value: false,
            ),
            S221DataModel(
              text: 'พันธุ์กข.15',
              value: false,
            ),
          ],
        ),
        S221Model(
          text: '3. พันธุ์ผสมระหว่าง',
          value: false,
          controller: TextEditingController(),
          values: [],
        ),
      ],
    );
    Section2Model.s222 = S222(
      question: '2.2.2 แหล่งที่มาของพันธุ์',
      values1: [
        Section2ValueTextModel(text: '1. เตรียมพันธุ์ด้วยตัวเอง', value: false),
        Section2ValueTextModel(text: '2. แลกเปลี่ยนกับเกษตรกรรายอื่น', value: false),
      ],
      values2: [
        Section2CheckVSModel(
          value: false,
          text: '3. ซื้อมาจากแหล่งอื่นๆ ระบุ',
          controller: TextEditingController(),
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: '4. อื่น ๆ โปรดระบุ',
          controller: TextEditingController(),
          suffix: '',
        ),
      ],
    );
    Section2Model.s223 = S223(
      question: '2.2.3 ปัจจัยที่มีผลต่อการคัดเลือกสายพันธุ์คืออะไร (ตอบได้มากกว่า 1 ข้อ)',
      values1: [
        Section2ValueTextModel(text: '1. ให้ผลผลิตต่อพื้นที่สูง', value: false),
        Section2ValueTextModel(text: '2. ทนทานต่อโรคระบาดในพื้นที่', value: false),
        Section2ValueTextModel(text: '3. ทนแล้ง', value: false),
        Section2ValueTextModel(text: '4. ทนเค็ม', value: false),
        Section2ValueTextModel(text: '5. หาพันธุ์ได้ง่ายในพื้นที่', value: false),
      ],
      values2: [
        Section2CheckVSModel(
          value: false,
          text: '6. อื่น ๆ',
          controller: TextEditingController(),
          suffix: '',
        ),
      ],
    );
    Section2Model.s224 = S224(
      question: '2.2.4 ท่านมีการเปลี่ยนพันธุ์ข้าวหรือไม่',
      values: [
        Section2CheckVSModel(
          value: false,
          text: '1. เปลี่ยนพันธุ์ ทุกๆ',
          controller: TextEditingController(),
          suffix: 'ปี',
        ),
        Section2CheckVSModel(
          value: false,
          text: '2. ไม่เปลี่ยนสายพันธุ์ เพราะ',
          controller: TextEditingController(),
          suffix: '',
        ),
      ],
    );
    /*Section2Model.s225 = S225(
      question: '2.2.5 ผลผลิตของข้าวเมื่อปีการผลิตที่แล้ว',
      values: [
        Section2PVSModel(
          prefix: '',
          controller: TextEditingController(),
          suffix: 'กิโลกรัม/ไร่',
        ),
      ],
    );*/
    Section2Model.s226 = S226(
      question: '2.2.6 ประเภทการใช้น้ำในแปลงนา',
      question2: 'กรณี อาศัยระบบชลประทาน ชลประทาน',
      values1: [
        Section2ValueTextModel(text: '1. อาศัยน้ำฝน', value: false),
        Section2ValueTextModel(text: '2. อาศัยระบบชลประทาน', value: false),
        Section2ValueTextModel(text: '3. ทั้งอาศัยน้ำฝนและระบบชลประทาน', value: false),
      ],
      values2: [
        Section2CheckVSModel(
          value: false,
          text: '1. คลองชลประทาน',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: '2. น้ำประปา',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: '3. น้ำบาดาล',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: '4. บ่อน้ำตื้น',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: '5. แม่น้ำลำคลอง',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: '6. อื่นๆ (ระบุ)',
          controller: TextEditingController(),
          suffix: '',
        ),
      ],
    );
    Section2Model.s231 = S231(
      question: '2.3.1 ก่อนการปลูกข้าว ท่านได้มีการบำรุงดิน หรือไม่',
      values: [
        S221Model(
          text: 'ไม่มีการบำรุงดิน',
          value: false,
          values: [],
        ),
        S221Model(
          text: 'มีการบำรุงดิน (ปุ๋ยพืชสด,ปุ๋ยคอก,พืชตระกูลถั่ว(ถั่วพร้า),ปอเทือง)',
          value: false,
          values: [
            S221DataModel(
              text: 'ปุ๋ยพืชสด',
              value: false,
            ),
            S221DataModel(
              text: 'ปุ๋ยคอก',
              value: false,
            ),
            S221DataModel(
              text: 'พืชตระกูลถั่ว(ถั่วพร้า)',
              value: false,
            ),
            S221DataModel(
              text: 'ปอเทือง',
              value: false,
            ),
          ],
        ),
      ],
    );
    Section2Model.s232True = S214(
      question: '2.3.2 ประเภทการปลูกข้าว ',
      values: [
        Section2ValueTextModel(text: 'นาหว่าน', value: false),
        Section2ValueTextModel(text: 'นาดำ', value: false),
        Section2ValueTextModel(text: 'นาหยอด', value: false),
      ],
    );

    Section2Model.s232 = S232(
      question: '2.3.3 ท่านเริ่มทำการปลูกข้าวช่วง',
      begins: [
        Section2ValueTextModel(
          value: false,
          text: 'ต้น',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'กลาง',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'ปลาย',
        ),
      ],
    );
    Section2Model.s23SoilPreparationSteps = S23SoilPreparationSteps(
      values: [],
    );
    Section2Model.hS23owToPlantInTheLastProductionYears = HS23owToPlantInTheLastProductionYears(
          values: [],
        );
    Section2Model.s241 = S241(
      question: '2.4.1 วัชพืชที่พบ ',
      values: [
        Section2ValueTextModel(text: 'หญ้าหวาย', value: false),
        Section2ValueTextModel(text: 'ผักบุ้ง', value: false),
        Section2ValueTextModel(text: 'หญ้าขาวนก', value: false),
        Section2ValueTextModel(text: 'หญ้าแพรก', value: false),
        Section2ValueTextModel(text: 'ต้นกระชับ', value: false),
        Section2ValueTextModel(text: 'โสนหางไก่', value: false),
        Section2ValueTextModel(text: 'หญ้ารังกา', value: false),
        Section2ValueTextModel(text: 'ข้าวแดง', value: false),
        Section2ValueTextModel(text: 'หญ้าตีนนก', value: false),
        Section2ValueTextModel(text: 'ข้าวหาง', value: false),
      ],
    );
    Section2Model.s242 = S242(
      question: '2.4.2 ในแปลงท่านพบพันธุ์ข้าวปนหรือไม่่',
      weedController: TextEditingController(),
      percentController: TextEditingController(),
      values: [
        Section2ValueTextModel(text: 'ไม่พบพันธุ์ข้าวปนในแปลง', value: false),
        Section2ValueTextModel(
            text: 'พบพันธุ์ข้าวปนในแปลง (ข้าวหาง,ข้าวดีด,ข้าวแดง ฯลฯ)', value: false),
      ],
    );
    Section2Model.s243 = S221(
      question: '2.4.3 ท่านได้กำจัดพันธุ์ปนในแปลงท่านพบพันธุ์ข้าวหรือไม่',
      datas: [
        S221Model(
          text: 'ไม่กำจัดพันธุ์ข้าวปนในแปลง',
          value: false,
          values: [],
        ),
        S221Model(
          text: 'กำจัดพันธุ์ข้าวปนในแปลง',
          value: false,
          values: [
            S221DataModel(
              text: 'การกำจัดด้วยมือ',
              value: false,
            ),
            S221DataModel(
              text: 'การใช้สารเคมี',
              value: false,
            ),
          ],
        ),
      ],
    );

    Section2Model.s244 = S221(
      question: '2.4.4 ข้าวมีการเจริญเติบโตเต็มแปลงหรือไม่',
      datas: [
        S221Model(
          text: 'ข้าวมีการเจริญเติบโตเต็มแปลง',
          value: false,
          values: [],
        ),
        S221Model(
          text: 'ข้าวเจริญเติบโตไม่เต็มแปลง',
          value: false,
          values: [
            S221DataModel(
              text: 'มีการปลูกเพิ่ม',
              value: false,
            ),
            S221DataModel(
              text: 'ไม่มีการปลูกเพิ่ม',
              value: false,
            ),
          ],
        ),
      ],
    );

    Section2Model.s245 = S245(
      question: '2.4.5 การดูแลรักษาข้าว',
      s2451: S2451(
        question: '2.4.5.1 การให้น้ำ',
        s24511: S24511(
          question: '2.4.5.1.1 ในการปลูกข้าวของท่าน ได้มีการให้น้ำหรือไม',
          values1: [
            Section2ValueTextModel(text: 'ให้น้ำ (กรอกรายละเอียดในตาราง กรณีให้น้ำ)', value: false),
            Section2ValueTextModel(text: 'ไม่ให้น้ำ สาเหตุเพราะ', value: false),
          ],
          values2: [
            Section2CheckVSModel(
              value: false,
              text: 'เกษตรกรไม่มีเวลา',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'อุปกรณ์ในการให้น้ำไม่พร้อม',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'ไม่มีน้ำในพื้นที่',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'ไม่มีแรงงาน',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'ดินมีความชุมชื้นเพียงพอ โดยทราบจาก',
              suffix: '',
              controller: TextEditingController(),
            ),
            Section2CheckVSModel(
              value: false,
              text: 'อื่นๆ',
              suffix: '',
              controller: TextEditingController(),
            ),
          ],
        ),
        s24512: S24512(
          question: '2.4.5.2 การให้ปุ๋ย',
          s24521: S24521(
            question: '2.4.5.2.2 ท่านปลูกข้าวโดยมีการใส่ปุ๋ยหลังจากปลูกแล้วหรือไม่',
            values: [
              Section2CheckVSModel(
                value: false,
                text: 'ใส่ปุ๋ย (กรอกรายละเอียดในตารางกรณีใส่ปุ๋ย)',
                suffix: '',
              ),
              Section2CheckVSModel(
                value: false,
                text: 'ไม่ใส่ปุ๋ย สาเหตุ',
                suffix: '',
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
        s22453: S22453(
          question: '2.4.5.3 การกำจัดวัชพืช',
          values: S224531(
            question: '2.4.5.3.1 ท่านได้มีการกำจัดวัชพืชหรือไม่',
            values: [
              Section2CheckVSModel(
                value: false,
                text: 'กำจัด (กรอกรายละเอียดในตารางกรณีกำจัดวัชพืช)',
                suffix: '',
              ),
              Section2CheckVSModel(
                value: false,
                text: 'ไม่กำจัด เพราะ',
                suffix: '',
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
    Section2Model.caseOfGivingWaters = CaseOfGivingWaters(
      question: 'กรณีให้น้ำ',
      values: [],
    );
    Section2Model.caseOfApplyingFertilizers = CaseOfApplyingFertilizers(
      question: 'กรณีใส่ปุ๋ย',
      values: [],
    );
    Section2Model.caseKillWeeds = CaseKillWeeds(
      question: 'กรณีกำจัดวัชพืช',
      values: [],
    );
    Section2Model.s254532 = S254532(
      question: '2.4.5.3.2 ท่านได้มีการตัดใบข้าว หรือไม่',
      values: [
        Section2CheckVSModel(
          value: false,
          text: 'ตัดใบข้าวครั้งที่ 1 อายุ',
          suffix: 'วัน',
          controller: TextEditingController(),
          values: [
            Section2CheckVSModel(
              value: false,
              text: 'กำจัดวัชพืช',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'ให้ปศุสัตว์ ',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'อื่นๆ ',
              suffix: '',
              controller: TextEditingController(),
            ),
          ],
        ),
        Section2CheckVSModel(
          value: false,
          text: 'ตัดใบข้าวครั้งที่ 2 อายุ',
          suffix: 'วัน',
          controller: TextEditingController(),
          values: [
            Section2CheckVSModel(
              value: false,
              text: 'กำจัดวัชพืช',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'ให้ปศุสัตว์ ',
              suffix: '',
            ),
            Section2CheckVSModel(
              value: false,
              text: 'อื่นๆ ',
              suffix: '',
              controller: TextEditingController(),
            ),
          ],
        ),
      ],
    );
    Section2Model.s224541 = S224541(
      question: '2.4.5.4 โรคและแมลง',
      values1: [
        Section2CheckVSModel(
          value: false,
          text: 'ไม่พบ',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'พบโรคข้าว',
          suffix: '',
        ),
      ],
      values2: [
        Section2CheckVSModel(
          value: false,
          text: '1. ',
          suffix: '',
          controller: TextEditingController(),
        ),
        Section2CheckVSModel(
          value: false,
          text: '2. ',
          suffix: '',
          controller: TextEditingController(),
        ),
        Section2CheckVSModel(
          value: false,
          text: 'ท่านมีวิธีการแก้ไขโรคที่พบอย่างไร (อธิบายทีละโรค)',
          suffix: '',
          controller: TextEditingController(),
        ),
      ],
    );
    Section2Model.s224542 = S224542(
      question: '2.4.5.4.2 ในแปลงนี้ตรวจพบ แมลงศัตรูข้าวหรือไม่',
      values1: [
        Section2CheckVSModel(
          value: false,
          text: 'ไม่พบ',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'พบแมลงศัตรูข้าว',
          suffix: '',
        ),
      ],
      values2: [
        Section2CheckVSModel(
          value: false,
          text: '1. ',
          suffix: '',
          controller: TextEditingController(),
        ),
        Section2CheckVSModel(
          value: false,
          text: '2. ',
          suffix: '',
          controller: TextEditingController(),
        ),
        Section2CheckVSModel(
          value: false,
          text: 'ท่านมีวิธีการแก้ไขปัญหาจากแมลงศัตรูข้าว ที่พบอย่างไร (อธิบายทีละชนิด)',
          suffix: '',
          controller: TextEditingController(),
        ),
      ],
    );
    Section2Model.s251 = S251(
      question: '2.5.1 ท่านเก็บเกี่ยวข้าวช่วง',
      values: [
        Section2CheckVSModel(
          value: false,
          text: 'ช่วง',
          suffix: '(ต้น,กลาง,ปลาย)',
          controller: TextEditingController(),
        ),
        Section2CheckVSModel(
          value: false,
          text: 'เดือน',
          suffix: '',
          controller: TextEditingController(),
        ),
      ],
    );
    Section2Model.s252 = S252(
      question: '2.5.2 การเก็บเกี่ยวข้าว',
      values1: [
        Section2CheckVSModel(
          value: false,
          text: 'ใช้แรงงานคน',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'แรงงานจ้างทั้งหมด',
          suffix: '',
        ),

        Section2CheckVSModel(
          value: false,
          text: 'แรงงานภายในครัวเรือนทั้งหมด',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'แรงงานภายในครัวเรือนและจ้าง',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'ใช้รถเกี่ยว',
          suffix: '',
        ),
      ],
      values2: [
        Section2CheckVSModel(
          value: false,
          text: 'กลุ่มเกษตรกร',
          suffix: '',
          controller: TextEditingController(),
        ),
        Section2CheckVSModel(
          value: false,
          text: 'เอกชน',
          suffix: '',
        ),

      ],
      values3: [
        Section2CheckVSModel(
          value: false,
          text: 'อัตราค่าให้บริหาร',
          controller: TextEditingController(),
          suffix: 'บาท/ไร่',
        ),
      ],
      values4: [
        Section2CheckVSModel(
          value: false,
          text: 'ทันทีหลังจากการเก็บเกี่ยว',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'หลังเสร็จสิ้นฤดูการเก็บเกี่ยว',
          suffix: '',
        ),
      ],
    );
    Section2Model.s253 = S253(
      question: '2.5.3 ท่านตัดสินใจเกี่ยวข้าวในวันดังกล่าว เพราะสาเหตุอะไร',
      values: [
        Section2CheckVSModel(
          value: false,
          text: 'ตามช่วงอายุที่เหมาะสม',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'สังเกตุจากลักษณะของรวงข้าวที่พร้อมเก็บเกี่ยว',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'ความพร้อมของแรงงานที่มี',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'เป็นช่วงเวลาที่รถเกี่ยวสามารถเข้ามาเกี่ยวในแปลงได้',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'อื่นๆ',
          controller: TextEditingController(),
          suffix: '',
        ),
      ],
    );
    Section2Model.s254 = S254(
      question: '2.5.4 ท่านทราบหรือไม่ว่าอายุข้าว มีผลต่อคุณภาพความหอมของข้าว',
      values: [
        Section2CheckVSModel(
          value: false,
          text: 'ไม่ทราบ',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'ทราบ อย่างไร',
          controller: TextEditingController(),
          suffix: '',
        ),
      ],
    );
    Section2Model.s255 = S255(
      question: '2.5.5 การลดความชื้น',
      values: [
        Section2CheckVSModel(
          value: false,
          text: 'ไม่มี',
          suffix: '',
        ),
        Section2CheckVSModel(
          value: false,
          text: 'มีการลดความชื้น',
          controller: TextEditingController(),
          suffix: '',
        ),
      ],
      sunForCount: TextEditingController(),
      sunForDay: TextEditingController(),
      other: TextEditingController(),
    );
    Section2Model.s256 = S256(
      question: '2.5.6 การใช้ประโยชน์จากเมล็ดข้าว',
      values1: [
        Section2ValueTextModel(
          value: false,
          text: 'ขายทั้งหมด',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'เก็บทั้งหมด',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'ทั้งเก็บและขาย (ให้ทำสัญลักษณ์ทั้งสองส่วน)',
        ),
      ],
      values2: [
        Section2ValueTextModel(
          value: false,
          text: 'ขายให้โรงสี',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'ขายให้เกษตรกร เพื่อทำพันธุ์',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'ขายให้ส่วนราชการ',
        ),
      ],
      values3: [
        Section2ValueTextModel(
          value: false,
          text: 'เก็บไว้บริโภค',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'เก็บไว้ทำพันธุ์',
        ),
      ],
    );
    Section2Model.s260 = S260(
      question: '2.6.1 ท่านมีการจัดการแปลงหลังปลูกหรือไม่',
      values1: Section2ValueTextModel(
        value: false,
        text: 'มีการจัดการ',
      ),
      values1s: [
        Section2ValueTextModel(
          value: false,
          text: 'การจัดการฟางข้าว(ฟางอัดก้อน)',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'ไถกลบตอซัง',
        ),
        Section2ValueTextModel(
          value: false,
          text: 'เผาตอซัง',
        ),
      ],
      values2: Section2CheckVSModel(
        value: false,
        text: 'ไม่มีการจัดการ เพราะ',
        controller: TextEditingController(),
        suffix: '',
      ),
    );
  }

}
