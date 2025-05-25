import 'dart:async';

import 'package:agri/bloc/auth/auth_bloc.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/login/repository/login_repository.dart';
import 'package:agri/screens/profile/repository/profile_repository.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:agri/widgets/custom_text.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository = LoginRepository();

  LoginBloc() : super(LoginState()) {
    on<LoginPhoneNumberChanged>(_onLoginPhoneNumberChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginObscureText>(_onLoginObscureText);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginPhoneNumberChanged(LoginPhoneNumberChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginObscureText(LoginObscureText event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscureText: event.obscureText));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    final context = event.context;

    try {
      emit(state.copyWith(isSubmitting: true));
      // Simulate a network request for a login
      final response = await _loginRepository.login(state.phoneNumber, state.password);
      print(response);
      if (response['result']) {
        final token = response['data']['token'];

        LocalStorage.saveToken(token);

        FirebaseMessaging messaging = FirebaseMessaging.instance;
        final fcmToken = await messaging.getToken();
        await _loginRepository.storeFcmToken(fcmToken ?? '');

        emit(state.copyWith(isSubmitting: false, isSuccess: true));
        context.read<HomeBloc>().add(HomeInitialEvent());
        context.read<AuthBloc>().add(AuthLoginEvent());
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => false);
      } else {

        if(response['result'] == false && response['data'] == null) {
          emit(
            state.copyWith(
              isSubmitting: false,
              isFailure: true,
              errorMessage: response['message'],
            ),
          );
          EasyLoading.showError(response['message'] ?? '');
        }


        if (response['data']['restore_token'].toString().isNotEmpty || response['data']['restore_token'] != null || response['data']  != null) {
          print('restore_token');
          emit(
            state.copyWith(
              isSubmitting: false,
              isFailure: true,
              errorMessage: response['message'],
            ),
          );

          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('แจ้งเตือน'),
                  content:  Text(response['message'].toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const CustomText(
                          text: 'ยกเลิก',
                          color: Colors.grey,
                        )),
                    CupertinoButton(
                        color: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () async {
                          EasyLoading.show(status: 'กำลังกู้คืนบัญชี...');
                          final res = await ProfileRepository().restoreAccount(restoreToken: response['data']['restore_token']);
                          print(res);
                          if (res['result'] == true) {
                            final token = res['data']['token'];

                            LocalStorage.saveToken(token);

                            FirebaseMessaging messaging = FirebaseMessaging.instance;
                            final fcmToken = await messaging.getToken();
                            await _loginRepository.storeFcmToken(fcmToken ?? '');
                            Get.back();
                            context.read<HomeBloc>().add(HomeInitialEvent());
                            context.read<AuthBloc>().add(AuthLoginEvent());
                            EasyLoading.dismiss();
                            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => false);
                          } else {
                            EasyLoading.dismiss();
                            EasyLoading.showError(res['message'] ?? '');
                          }
                        },
                        child: const CustomText(
                          text: 'กู้คืนบัญชี',
                          color: Colors.white,
                        )),
                  ],
                );
              });
          return;
        }


      }
    } catch (e) {
      print(e);
    }
  }
}
