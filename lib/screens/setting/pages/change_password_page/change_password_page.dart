import 'package:agri/repository/repository.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../utils/themes.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final Repository _repository = Repository();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isOldPasswordVisible = true;
  bool _isNewPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  bool _isLoading = false;

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
              text: 'เปลี่ยนรหัสผ่าน',
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
                    obscureText: !_isOldPasswordVisible,
                    isObscureText: true,
                    controller: _oldPasswordController,
                    placeHolder: 'รหัสผ่านเดิม',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกรหัสผ่านเดิม';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isOldPasswordVisible = !_isOldPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isOldPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    maxLine: 1,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFieldWidget(
                    obscureText: !_isNewPasswordVisible,
                    isObscureText: true,
                    controller: _newPasswordController,
                    placeHolder: 'รหัสผ่านใหม่',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกรหัสผ่านใหม่';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    maxLine: 1,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFieldWidget(
                    obscureText: !_isConfirmPasswordVisible,
                    isObscureText: true,
                    controller: _confirmPasswordController,
                    placeHolder: 'ยืนยันรหัสผ่านใหม่',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณายืนยันรหัสผ่านใหม่';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    maxLine: 1,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CupertinoButton(
                      color: ThemeConfig.subPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_newPasswordController.text != _confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: CustomText(
                                  text: 'รหัสผ่านไม่ตรงกัน',
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            EasyLoading.show(status: 'กำลังโหลด');
                            _repository.changePassword(
                              oldPassword: _oldPasswordController.text,
                              newPassword: _newPasswordController.text,
                              confirmPassword: _confirmPasswordController.text,
                            ).then((value) {
                              setState(() {
                                _isLoading = false;
                              });
                              if (value['result'] == true) {
                                EasyLoading.dismiss();
                                CustomDialog.showCustomDialog(
                                  context: context,
                                  title: '',
                                  onPressed: () {
                                    Get.back();
                                    Get.back();
                                  },
                                  description: value['message'] ?? '',
                                  icon: Image.asset(ImageProviders.success),
                                );
                              } else {
                                EasyLoading.dismiss();
                                CustomDialog.showCustomDialog(
                                  context: context,
                                  title: '',
                                  onPressed: () {
                                    Get.back();
                                  },
                                  description: value['message'] ?? '',
                                  icon: SizedBox(),
                                );
                              }
                            });
                          }
                        }
                      },
                      child: _isLoading ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ) :  const CustomText(
                        text: 'เปลี่ยนรหัสผ่าน',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
