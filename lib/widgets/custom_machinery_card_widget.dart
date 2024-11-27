import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomMachineryCardWidget extends StatelessWidget {
  final String machineImg;
  final String machineName;
  final String groupName;
  final String message;
  final String user;
  final int borrowingCount;
  final int numberFields;
  final Function()? onPressed;
  final String buttonText;
  final double? rating;

  const CustomMachineryCardWidget({
    super.key,
    required this.machineImg,
    required this.machineName,
    required this.groupName,
    required this.message,
    required this.user,
    required this.borrowingCount,
    required this.numberFields,
    this.onPressed,
    this.buttonText = 'รายละเอียด/จอง',
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xff303030),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        color: Colors.white,
                        child: Image.network(
                          machineImg,
                          fit: BoxFit.fill,
                          height: 100,
                          //width: 100,
                          width: double.infinity,
                        ),
                      )),
                  const SizedBox(height: 5),
                  CustomText(
                    text: machineName,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  CustomText(
                    text: groupName,
                    color: ThemeConfig.textPrimary,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    fontSize: 14,
                  ),
                  CustomText(
                    text: 'รถของ : $user',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  Visibility(
                    visible: rating != null,
                    child: RatingBar.builder(
                      initialRating: rating ?? 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 14,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Color(0xffC5DFC3),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                border: Border(
                  right: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(
                        text: 'สถานะการใช้งาน : ',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xff303030),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomText(
                          text: message,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCountOfUsageWidget(
                        text: 'ใช้งาน/ครั้ง',
                        borrowingCount: borrowingCount,
                      ),
                      const SizedBox(width: 10),
                      _buildCountOfUsageWidget(
                        text: 'ใช้งาน/ไร่',
                        borrowingCount: numberFields,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: const Color(0xff0F2E00),
                        onPressed: onPressed,
                        child: CustomText(
                          text: buttonText,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountOfUsageWidget({
    required int borrowingCount,
    required String text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          color: Colors.black,
          fontSize: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomText(
            text: '$borrowingCount',
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
