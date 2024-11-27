import 'package:agri/app.dart';
import 'package:agri/models/group_model.dart';
import 'package:agri/screens/home/bloc/home_bloc.dart';
import 'package:agri/screens/register/repository/register_repository.dart';
import 'package:agri/utils/app_routers.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _registerRepository = RegisterRepository();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitialEvent>(onRegisterInitialEvent);
    on<RegisterGroupSelectedChanged>(onRegisterGroupSelectedChanged);
    on<RegisterFirstNameChanged>(onRegisterFirstNameChanged);
    on<RegisterLastNameChanged>(onRegisterLastNameChanged);
    on<RegisterPhoneNumberChanged>(onRegisterPhoneNumberChanged);
    on<RegisterDateOfBirthChanged>(onRegisterDateOfBirthChanged);
    on<RegisterNumberFieldsChanged>(onRegisterNumberFieldsChanged);
    on<RegisterLoading>(onRegisterLoading);
    on<RegisterNext>(onRegisterNext);

    on<RegisterPasswordChanged>(onRegisterPasswordChanged);
    on<RegisterConfirmPasswordChanged>(onRegisterConfirmPasswordChanged);
    on<RegisterConfirmOTP>(onRegisterConfirmOTP);
    on<RegisterOTPChanged>(onRegisterOTPChanged);
    on<RegisterSubmit>(onRegisterSubmit);



  }

  void onRegisterInitialEvent(RegisterInitialEvent event, Emitter<RegisterState> emit) async {
    final groups = await _registerRepository.getGroups();
    state.dateOfBirth = null;
    emit(RegisterState(
      groups: groups,
      dateOfBirth: DateTime.now(),
      groupSelected: null,
    ));
  }

  void onRegisterGroupSelectedChanged(
      RegisterGroupSelectedChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      groupSelected: event.groupSelected,
    ));
  }

  void onRegisterFirstNameChanged(RegisterFirstNameChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      firstName: event.firstName,
    ));
  }

  void onRegisterLastNameChanged(RegisterLastNameChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      lastName: event.lastName,
    ));
  }

  void onRegisterPhoneNumberChanged(RegisterPhoneNumberChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
    ));
  }

  void onRegisterDateOfBirthChanged(RegisterDateOfBirthChanged event, Emitter<RegisterState> emit) {
    print(event.dateOfBirth);
    state.dateOfBirth = event.dateOfBirth;
    emit(state.copyWith(dateOfBirth:state.dateOfBirth ));
  }

  void onRegisterNumberFieldsChanged(
      RegisterNumberFieldsChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      numberFields: event.numberFields,
    ));
  }

  void onRegisterOTPChanged(RegisterOTPChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      otp: event.otp,
    ));
  }

  void onRegisterLoading(RegisterLoading event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      isLoading: event.isLoading,
    ));
  }

  void onRegisterPasswordChanged(RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void onRegisterConfirmPasswordChanged(RegisterConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      confirmPassword: event.confirmPassword,
    ));
  }

  void onRegisterNext(RegisterNext event, Emitter<RegisterState> emit) async {
    final context = event.context;
    // validate the form fields here all states are available in state object
    // if validation is successful then call the sendOTP method
    if (validateForm()) {
      try {
        emit(state.copyWith(isNextStepLoading: true));
        final response = await _registerRepository.sendOTP(state.phoneNumber);
         if (response['result']) {
        //if (response) {

          state.result = response;
          emit(state.copyWith(result: state.result));
          emit(state.copyWith(isNextStepLoading: false));
          EasyLoading.showSuccess(response['message']);
          if (state.result['result']) {
              // await Future.delayed(const Duration(seconds: 2));
              state.result = {};
              emit(state.copyWith(result: state.result));
              Navigator.of(context).pushNamed(AppRoutes.optVerifyPage);

          }
        } else {
          //CustomToast.show(response['message']);
          emit(state.copyWith(isNextStepLoading: false));
        }
        emit(state.copyWith(isNextStepLoading: false));
      } catch (e, t) {
        print(e);
        print(t);
        emit(state.copyWith(isNextStepLoading: false));
      }
    }
  }

  void onRegisterConfirmOTP(RegisterConfirmOTP event, Emitter<RegisterState> emit) async {
    final context = event.context;
    try {
      emit(state.copyWith(isNextStepLoading: true));
      final response = await _registerRepository.verifyOTP(state.phoneNumber,event.otp);
      if (response['result']) {
        EasyLoading.showSuccess(response['message']);
        emit(state.copyWith(isNextStepLoading: false, result: response));
        if (state.result['result']) {
          try {
            // await Future.delayed(const Duration(seconds: 2));
            state.result = {};
            emit(state.copyWith(result: state.result));
            Navigator.of(context).pushNamed(AppRoutes.setPasswordPage);
          } catch (e) {

            print(e);
          }
        } else {
          EasyLoading.showError(response['message']);
          emit(state.copyWith(isNextStepLoading: false));
        }
      } else {
        EasyLoading.showError(response['message']);
        emit(state.copyWith(isNextStepLoading: false));
      }
      emit(state.copyWith(isNextStepLoading: false));
    } catch (e) {
      print(e);
      EasyLoading.showError('otp ไม่ถูกต้อง');
      emit(state.copyWith(isNextStepLoading: false));
    }
  }


  void onRegisterSubmit(RegisterSubmit event, Emitter<RegisterState> emit) async {
    final context = event.context;
    if(!event.isAcceptTerms){
      return;
    }
    if (validateForm()) {
      try {
        emit(state.copyWith(isLoading: true));
        final response = await _registerRepository.register(
          groupId: state.groupSelected!.groupId.toString(),
          firstName: state.firstName,
          lastName: state.lastName,
          tel: state.phoneNumber,
          dateOfBirth: state.dateOfBirth.toString(),
          numberFields: state.numberFields.toString(),
          password: state.password,
          confirmPassword: state.confirmPassword,
          isAcceptTerms: event.isAcceptTerms,
        );
        if (response['result']) {
          EasyLoading.show(status: response['message'] ?? '');
          emit(state.copyWith(isLoading: false, result: response));
          if (state.result['result']) {
            try {
              state.result = {};
              emit(state.copyWith(result: state.result));
              // await Future.delayed(const Duration(seconds: 2));
              Get.back();
              Get.back();
              Get.back();
              context.read<HomeBloc>().add(HomeInitialEvent());

              //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AgriApp()), (route) => false);
            } catch (e) {
              print(e);
            }
          }

        } else {
          EasyLoading.show(status: response['message'] ?? '');
          emit(state.copyWith(isLoading: false));
        }
        emit(state.copyWith(isLoading: false));
      } catch (e) {
        print(e);
        emit(state.copyWith(isLoading: false));
      }
    }
  }


  bool validateForm() {
    if (state.firstName.isEmpty) {
      CustomToast.show("First name is required");
      return false;
    }
    if (state.lastName.isEmpty) {
      CustomToast.show("Last name is required");
      return false;
    }
    if (state.phoneNumber.isEmpty) {
      CustomToast.show("Phone number is required");
      return false;
    }
    if (state.dateOfBirth == null) {
      CustomToast.show("กรุณาเลือกวันเกิด");
      return false;
    }
    if (state.groupSelected == null) {
      CustomToast.show("กรุณาเลือกกลุ่มเกษตรกร");
      return false;
    }
    return true;
  }

}
