import 'package:agri/screens/request_machine/models/approve_request_detail_model.dart';
import 'package:agri/screens/request_machine/repository/request_machine_repository.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../models/approve_request_model.dart';

part 'request_machine_event.dart';

part 'request_machine_state.dart';

class RequestMachineBloc extends Bloc<RequestMachineEvent, RequestMachineState> {
  final RequestMachineRepository _requestMachineRepository = RequestMachineRepository();

  RequestMachineBloc() : super(RequestMachineLoading()) {
    on<RequestMachineInitialEvent>(_onRequestMachineInitialEvent);

    // in group
    on<RequestMachineApproveDetailInGroupEvent>(_onRequestMachineApproveDetailInGroupEvent);
    on<RequestMachineApproveInGroupEvent>(_onRequestMachineApproveInGroupEvent);
    on<RequestMachineRefuseInGroupEvent>(_onRequestMachineRefuseInGroupEvent);
    on<RequestMachineChangedTabEvent>(_onRequestMachineChangedTabEvent);

    // out group
    // on<RequestMachineApproveOutGroupEvent>(_onRequestMachineApproveOutGroupEvent);
  }

  Future<void> _onRequestMachineChangedTabEvent(
      RequestMachineChangedTabEvent event, Emitter<RequestMachineState> emit) async {
    final state = this.state;
    if (state is RequestMachineLoaded) {
      state.requestList = [];
      final ApproveRequestModel approveRequestModel;
      emit(state.copyWith(currentTab: event.tab, isTabLoading: true));
      if (event.tab == 0) {
        approveRequestModel = await _requestMachineRepository.getRequestApproveInGroupList();
      } else {
        approveRequestModel = await _requestMachineRepository.getRequestApproveOutGroupList();
      }
      final requestList = approveRequestModel.data!.requestList;
      state.requestList = requestList;
      emit(state.copyWith(
          requestList: state.requestList, currentTab: event.tab, isTabLoading: false));
    }
  }

  Future<void> _onRequestMachineRefuseInGroupEvent(
      RequestMachineRefuseInGroupEvent event, Emitter<RequestMachineState> emit) async {
    final context = event.context;
    final state = this.state;
    if (state is RequestMachineLoaded) {
      final response;
      EasyLoading.show(status: 'กำลังโหลด');
      try {
        print('state.currentTab ${state.currentTab}');
        if (state.currentTab == 0) {
          response = await _requestMachineRepository.refuseBorrowInGroup(event.borrowId);
        } else {
          response = await _requestMachineRepository.refuseBorrowOutGroup(event.borrowId);
        }
        if (response['result']) {
          EasyLoading.dismiss();
          CustomDialog.showCustomDialog(
            context: context,
            title: '',
            description: response['message'],
            icon: Image.asset(ImageProviders.delete),
            onPressed: () {

              Get.back();
              Get.back();
              // add(RequestMachineInitialEvent());
            },
          );
        }
      } catch (e) {
        EasyLoading.dismiss();
        // emit(RequestMachineError(e.toString()));
      }
    }
  }

  Future<void> _onRequestMachineApproveInGroupEvent(
      RequestMachineApproveInGroupEvent event, Emitter<RequestMachineState> emit) async {
    final context = event.context;
    final state = this.state;
    if (state is RequestMachineLoaded) {
      final response;
      EasyLoading.show(status: 'กำลังโหลด');
      try {
        print('state.currentTab ${state.currentTab}');
        if (state.currentTab == 0) {
          response = await _requestMachineRepository.approveBorrowInGroup(event.borrowId);
        } else {
          response = await _requestMachineRepository.approveBorrowOutGroup(event.borrowId);
        }
        if (response['result']) {
          EasyLoading.dismiss();
          CustomDialog.showCustomDialog(
            context: context,
            title: '',
            description: response['message'],
            icon: Image.asset(ImageProviders.success),
            onPressed: () {
              Get.back();
              Get.back();
             // Get.back();
              // add(RequestMachineInitialEvent());
            },
          );
        }
      } catch (e) {
        EasyLoading.dismiss();
        // emit(RequestMachineError(e.toString()));
      }
    }
  }

  Future<void> _onRequestMachineApproveDetailInGroupEvent(
    RequestMachineApproveDetailInGroupEvent event,
    Emitter<RequestMachineState> emit,
  ) async {
    final state = this.state;
    if (state is RequestMachineLoaded) {
      emit(state.copyWith(isDetailLoading: true));
      if (event.currentTab == 0) {
        print('in group');
        try {
          final approveRequestDetailModel = await _requestMachineRepository
              .getApproveInGroupByRequestId(event.borrowId.toString());
          final data = approveRequestDetailModel.data!.detailApproval!;
          emit(state.copyWith(isDetailLoading: false, approveRequestDetailModel: data));
        } catch (e) {
          // emit(RequestMachineError(e.toString()));
        }
      } else {
        print('out group');

        try {
          final approveRequestDetailModel = await _requestMachineRepository
              .getApproveOutGroupByRequestId(int.parse(event.borrowId));
          final data = approveRequestDetailModel.data!.detailApproval!;
          emit(state.copyWith(isDetailLoading: false, approveRequestDetailModel: data));
        } catch (e) {
          print(e);
          // emit(RequestMachineError(e.toString()));
        }
      }
    }
  }

  Future<void> _onRequestMachineInitialEvent(
      RequestMachineInitialEvent event, Emitter<RequestMachineState> emit) async {
    final state = this.state;

    if (state is RequestMachineLoaded) {
      final approveRequestModel = await _requestMachineRepository.getRequestApproveInGroupList();
      final requestList = approveRequestModel.data!.requestList;
      emit(state.copyWith(
          requestList: requestList,
          isDetailLoading: false,
          approveRequestDetailModel: null,
          currentTab: state.currentTab));
      add(RequestMachineChangedTabEvent(state.currentTab));
    } else {
      emit(RequestMachineLoading());
      try {
        final approveRequestModel = await _requestMachineRepository.getRequestApproveInGroupList();
        final requestList = approveRequestModel.data!.requestList;
        emit(RequestMachineLoaded(requestList: requestList, currentTab: 0));
      } catch (e) {
        // emit(RequestMachineError(e.toString()));
      }
    }
  }
}
