import 'package:agri/screens/login/repository/login_repository.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../widgets/custom_text.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  final LoginRepository _repository = LoginRepository();

  final TextEditingController phoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width,
            color: ThemeConfig.primary,
            child: const CustomText(
              text: 'ลืมรหัสผ่าน',
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    placeHolder: 'เบอร์โทร',
                    controller: phoneNumber,
                    keyboardType: TextInputType.phone,
                    validator:  (value) {
                      if (value == null || value.isEmpty || value.length < 10) {
                        return 'กรุณากรอกเบอร์โทร';
                      }
                      return null;
                    },
                    maxLength: 10,
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton(
                    color: ThemeConfig.subPrimary,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        EasyLoading.show(status: 'กำลังโหลด');

                        _repository.forgotPasswordGetOTP(phoneNumber: phoneNumber.text).then((value) {
                          EasyLoading.dismiss();
                          print(value);
                          if (value['result'] == true) {
                            EasyLoading.showSuccess(value['message'] ?? '');
                            Navigator.pushNamed(context, AppRoutes.forgetPasswordVerifyOTPPage, arguments: phoneNumber.text);
                          } else {
                            CustomDialog.showCustomDialog(
                              context: context,
                              title: '',
                              onPressed: () {
                                Navigator.of(context,rootNavigator: true).pop();
                              },
                              description: value['message'] ?? '',
                              icon: SizedBox(),
                            );
                          }
                        });


                      }
                    },
                    child: const CustomText(
                      text: 'ส่งรหัส OTP',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );

  }
}
