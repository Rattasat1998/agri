import 'dart:async';

import 'package:agri/screens/register/bloc/register_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../repository/register_repository.dart';

class OTPVerifyPage extends StatefulWidget {
  const OTPVerifyPage({super.key});

  @override
  State<OTPVerifyPage> createState() => _OTPVerifyPageState();
}

class _OTPVerifyPageState extends State<OTPVerifyPage> {
  Timer? _timer;
  final RegisterRepository _registerRepository = RegisterRepository();

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButtonWidget(),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                    child: CustomText(
                  text: '2/3',
                  color: Colors.white,
                )),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
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
                        const CustomText(
                          text: 'กรุณากรอกรหัส OTP เพื่อยืนยันตัวตน',
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
                            context.read<RegisterBloc>().add(RegisterOTPChanged(code));
                            //handle validation or checks here
                          },
                          onSubmit: (String code) {
                            context.read<RegisterBloc>().add(RegisterOTPChanged(code));
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
                              text: 'หากยังไม่ได้รับหรัส',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            _timer?.tick == null || _timer!.tick >= 60
                                ? GestureDetector(
                                    onTap: () async {
                                      EasyLoading.show(status: 'กำลังส่ง OTP...');
                                      await _registerRepository
                                          .sendOTP(state.phoneNumber)
                                          .then((value) {
                                        if (value['result']) {
                                          EasyLoading.showSuccess(value['message']);
                                          startTimer();
                                        } else {
                                          EasyLoading.showError(value['message']);
                                        }
                                      });
                                      // context.read<RegisterBloc>().stream.first;
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
                        _buildNextButtonWidget(context),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNextButtonWidget(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: CupertinoButton(
            color: ThemeConfig.buttonColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            onPressed: () async {
              print(state.otp);
              // Navigator.of(context).pushNamed(AppRoutes.setPasswordPage);
              if (state.otp.length == 4) {
                context.read<RegisterBloc>().add(RegisterConfirmOTP(state.otp, context));
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                state.isNextStepLoading
                    ? const Center(child: CupertinoActivityIndicator(color: Colors.white))
                    : const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: 'ยืนยัน',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
