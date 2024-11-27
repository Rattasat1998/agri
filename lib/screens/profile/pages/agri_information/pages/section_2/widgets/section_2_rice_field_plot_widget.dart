import 'package:agri/screens/profile/pages/agri_information/models/rice_field_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_3_model.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Section2RiceFieldPlotWidget extends StatelessWidget {
  final RiceFieldModel? selectedRiceField;

  const Section2RiceFieldPlotWidget({super.key, this.selectedRiceField});

  @override
  Widget build(BuildContext context) {
    String underscore = '_ _ _ _ _';
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffE2EAE1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CustomText(
                      text: 'แปลงที่    ',
                      fontSize: 16,
                      fontWeight: FontWeight.normal, // ! Change to normal
                      color: Colors.black,
                    ),
                    CustomText(
                      text: '${selectedRiceField?.riceFieldNumber ?? underscore}',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      // ! Change to normal
                      color: Colors.black,
                      decoration: selectedRiceField == null
                          ? TextDecoration.none
                          : TextDecoration.underline,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'ชื่อแปลง    ',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: selectedRiceField?.riceFieldName ?? underscore,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      decoration: selectedRiceField == null
                          ? TextDecoration.none
                          : TextDecoration.underline,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CustomText(
                      text: 'จำนวนพื้นที่    ',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: selectedRiceField?.riceFieldArea?.toStringAsFixed(2) ?? underscore,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      decoration: selectedRiceField == null
                          ? TextDecoration.none
                          : TextDecoration.underline,
                    ),
                    const CustomText(
                      text: '    ไร่',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            child: Image.asset(ImageProviders.section3Head, width: 80, height: 80),
          ),
        ],
      ),
    );
  }
}

class Section2RiceFieldPlotHomeWidget extends StatelessWidget {
  final RiceFieldModel? selectedRiceField;
  final Function()? onRemove;
  final String iconSuffix;

  const Section2RiceFieldPlotHomeWidget({
    super.key,
    this.selectedRiceField,
    this.onRemove,
    required this.iconSuffix,
  });

  @override
  Widget build(BuildContext context) {
    String underscore = '_ _ _ _ _';
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CustomText(
                          text: 'แปลงที่    ',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          // ! Change to normal
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                        CustomText(
                          text: '${selectedRiceField?.riceFieldNumber ?? underscore}',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          // ! Change to normal
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: 'ชื่อแปลง    ',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        CustomText(
                          text: selectedRiceField?.riceFieldName ?? underscore,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: 'จำนวนพื้นที่    ',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        CustomText(
                          text: selectedRiceField?.riceFieldArea?.toStringAsFixed(2) ?? underscore,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                        const CustomText(
                          text: '    ไร่',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Image.asset(iconSuffix, width: 70, height: 70),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 20,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onRemove,
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Section3HomeWidget extends StatelessWidget {
  final Section3Model? selectedRiceField;
  final Function()? onRemove;
  final String iconSuffix;

  const Section3HomeWidget({
    super.key,
    this.selectedRiceField,
    this.onRemove,
    required this.iconSuffix,
  });

  @override
  Widget build(BuildContext context) {
    String underscore = '_ _ _ _ _';
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: selectedRiceField?.process ?? '',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // ! Change to normal
                      color: const Color(0xff194902),
                      decoration: TextDecoration.none,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'ชนิดเครื่องจักร : ',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: CustomText(
                            text: '${selectedRiceField?.typeMachine}',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'ผู้ครอบครอง : ',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: CustomText(
                            text: '${selectedRiceField?.prossessor}',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Image.asset('assets/info/tractor.png', width: 50, height: 50),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onRemove,
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
