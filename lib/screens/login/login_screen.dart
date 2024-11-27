import 'package:agri/screens/login/bloc/login_bloc.dart';
import 'package:agri/screens/register/bloc/register_bloc.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/utils/themes.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:agri/widgets/custom_text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../profile/pages/agri_information/bloc/agri_info_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AgriInfoBloc>().add(InitialEvent());
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
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(ImageProviders.logo2),
                      Image.asset(ImageProviders.logo1),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFieldWidget(
                            placeHolder: 'เบอร์โทร',
                            onChanged: (value) {
                              context.read<LoginBloc>().add(LoginPhoneNumberChanged(value));
                            },
                            validator: (value) {
                              if (value.toString().length != 10) {
                                return 'กรุณากรอกเบอร์โทร';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFieldWidget(
                            placeHolder: 'รหัสผ่าน',
                            onChanged: (value) {
                              context.read<LoginBloc>().add(LoginPasswordChanged(value));
                            },
                            maxLine: 1,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'กรุณากรอกรหัสผ่าน';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: state.obscureText,
                            isObscureText: true,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                context.read<LoginBloc>().add(LoginObscureText(!state.obscureText));
                              },
                              child: state.obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 8),
                            color: ThemeConfig.subPrimary,
                            onPressed: state.isSubmitting
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<LoginBloc>().add(LoginSubmitted(context));
                                    }
                                  },
                            child: state.isSubmitting
                                ? const CupertinoActivityIndicator(color: Colors.black)
                                : const CustomText(text: 'เข้าสู่ระบบ', color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<RegisterBloc>().add(RegisterInitialEvent());
                                  Navigator.pushNamed(context, AppRoutes.registerScreen);
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.login),
                                    CustomText(
                                      text: 'เปิดบัญชี',
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoutes.forgetPasswordPage);
                                },
                               child: const CustomText(
                                 text: 'ลืมรหัสผ่าน',
                                 color: Colors.black,
                                 fontSize: 16,
                               ),
                             ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
