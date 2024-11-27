import 'package:agri/app.dart';
import 'package:agri/screens/register/bloc/register_bloc.dart';
import 'package:agri/screens/register/pages/policy_page.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/back_button_widget.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({super.key});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool obscureText2 = true;

  bool isAcceptTerms = false;

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
                  text: '3/3',
                  color: Colors.white,
                )),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'ตั้งรหัสผ่าน',
                        fontSize: 32,
                      ),
                      const SizedBox(height: 20),
                      const CustomText(
                        text: 'รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร',
                        fontSize: 16,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFieldWidget(
                        placeHolder: 'รหัสผ่าน',
                        obscureText: obscureText,
                        isObscureText: true,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: Icon(obscureText ? Icons.remove_red_eye : Icons.visibility_off)),
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(RegisterPasswordChanged(value));
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'กรุณากรอกรหัสผ่าน';
                          }
                          return null;
                        },
                        maxLine: 1,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFieldWidget(
                        placeHolder: 'ยืนยันรหัสผ่าน',
                        obscureText: obscureText2,
                        isObscureText: true,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText2 = !obscureText2;
                              });
                            },
                            child: Icon(obscureText2 ? Icons.remove_red_eye : Icons.visibility_off)),
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(RegisterConfirmPasswordChanged(value));
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'กรุณายืนยันรหัสผ่าน';
                          }
                          return null;
                        },
                        maxLine: 1,
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox.adaptive(
                            value: isAcceptTerms,
                            onChanged: (value) async {
                              if(isAcceptTerms){
                                setState(() {
                                  isAcceptTerms = false;
                                  return;
                                });
                              } else {
                                bool response =  await Navigator.push(context, CupertinoPageRoute(builder: (context) => const PolicyPage()));
                                if(response) {
                                  setState(() {
                                    isAcceptTerms = true;
                                  });
                                } else {
                                  setState(() {
                                    isAcceptTerms = false;
                                  });
                                }

                              }
                            },
                          ),
                          const CustomText(
                            text: 'ยอมรับ ',
                            fontSize: 16,
                          ),
                          GestureDetector(
                            onTap: () async {
                            bool response =  await Navigator.push(context, CupertinoPageRoute(builder: (context) => const PolicyPage()));
                            if(response) {
                              setState(() {
                                isAcceptTerms = true;
                              });
                            } else {
                              setState(() {
                                isAcceptTerms = false;
                              });
                            }
                            },
                            child: const CustomText(
                              text: 'ข้อตกลงและเงื่อนไข',
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return Align(
                            alignment: Alignment.center,
                            child: CupertinoButton(
                              color: ThemeConfig.buttonColor,
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                              onPressed: () async {
                                //   context.read<RegisterBloc>().add(RegisterConfirmOTP());
                                if (_formKey.currentState!.validate() && isAcceptTerms == true) {
                                  print(isAcceptTerms);
                                  if (state.password.isNotEmpty &&
                                      state.confirmPassword.isNotEmpty &&
                                      state.password == state.confirmPassword) {
                                      context.read<RegisterBloc>().add(RegisterSubmit(context,isAcceptTerms));
                                    //await  context.read<RegisterBloc>().stream.firstWhere((state) => state.isLoading == false);
                                  } else {
                                    EasyLoading.showError('รหัสผ่านไม่ตรงกัน');
                                  }
                                } else {
                                  EasyLoading.showError('กรุณายอมรับข้อตกลงและเงื่อนไข');
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  state.isLoading
                                      ? const CupertinoActivityIndicator(color: Colors.white)
                                      : const CustomText(
                                          text: 'สร้างบัญชี',
                                          color: Colors.white,
                                        ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
