import 'dart:async';

import 'package:agri/screens/login/repository/login_repository.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgetOtpVerifyPage extends StatefulWidget {
  final String phoneNumber;

  const ForgetOtpVerifyPage({super.key, required this.phoneNumber});

  @override
  State<ForgetOtpVerifyPage> createState() => _ForgetOtpVerifyPageState();
}

class _ForgetOtpVerifyPageState extends State<ForgetOtpVerifyPage> {

  final LoginRepository _repository = LoginRepository();

  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          setState(() {
            if (timer.tick >= 60) {
              timer.cancel();
            }
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //startTimer();
  }

  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  void verifyOTP({required String otp, required BuildContext context}) {
    EasyLoading.show(status: 'กำลังโหลด');
    _repository.forgotPasswordVerifyOTP(phoneNumber: widget.phoneNumber,otp: otp).then((value) {

      if (value['result'] == true) {
        EasyLoading.dismiss();
        EasyLoading.show(status: value['message'] ?? '');
         Navigator.pushNamed(context, AppRoutes.forgetChangeNewPasswordPage, arguments: widget.phoneNumber);
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(value['message'] ?? '');
      }
    });
  }


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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: ThemeConfig.primary,
            child: const CustomText(
              text: 'สร้างบัญชีใหม่',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'ยืนยันตัวตน',
                  fontSize: 32,
                ),
                 CustomText(
                  text: 'กรุณากรอกรหัส OTP ที่ส่งไปยังเบอร์ ${widget.phoneNumber}',
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: ThemeConfig.primary,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  enabledBorderColor: ThemeConfig.primary,
                  focusedBorderColor: ThemeConfig.primary,
                  fieldWidth: 60,
                  textStyle: const TextStyle(fontSize: 20),

                  //runs when a code is typed in
                  onCodeChanged: (String code) {

                    // context.read<RegisterBloc>().add(RegisterOTPChanged(code));
                    //handle validation or checks here
                  },
                  onSubmit: (String code) {
                    verifyOTP(otp: code, context: context);
                    //  context.read<RegisterBloc>().add(RegisterOTPChanged(code));
                    //runs when every textfield is filled
                  },
                  //runs when every textfield is filled
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: 'หากยังไม่ได้รับรหัส',
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _timer?.tick == null || _timer!.tick >= 60
                        ? GestureDetector(
                            onTap: () async {
                              EasyLoading.show(status: 'กำลังโหลด');
                              _repository.forgotPasswordGetOTP(phoneNumber: widget.phoneNumber).then((value) {
                                //Get.back();
                                print(value);
                                if (value['result'] == true) {
                                  EasyLoading.dismiss();
                                  EasyLoading.show(status: value['message'] ?? '');
                                } else {
                                  EasyLoading.dismiss();
                                  EasyLoading.showSuccess(value['message'] ?? '');
                                }
                              });

                              startTimer();
                            },
                            child: CustomText(
                              text: 'ส่งอีกครั้ง',
                              color: ThemeConfig.primary,
                              fontSize: 20,
                            ),
                          )
                        : Text(
                            '${60 - _timer!.tick} วินาที',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                //  _buildNextButtonWidget(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
