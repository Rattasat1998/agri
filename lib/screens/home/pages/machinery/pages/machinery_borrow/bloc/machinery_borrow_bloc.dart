import 'package:agri/screens/home/pages/machinery/models/machinery_info_model.dart';
import 'package:agri/screens/home/pages/machinery/models/objectives_model.dart';
import 'package:agri/screens/home/pages/machinery/repository/machinery_repository.dart';
import 'package:agri/utils/custom_toast.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'machinery_borrow_event.dart';

part 'machinery_borrow_state.dart';

class MachineryBorrowBloc extends Bloc<MachineryBorrowEvent, MachineryBorrowState> {

  final MachineryRepository _machineryRepository = MachineryRepository();

  MachineryBorrowBloc()
      : super(
          MachineryBorrowState(
            description: TextEditingController(),
            numberFields: TextEditingController(),
            pageController: PageController(),
          ),
        ) {
    on<BorrowInitialEvent>(_onBorrowInitialEvent);
    on<BorrowChangedStartDateEvent>(_onBorrowChangedStartDateEvent);
    on<BorrowChangedEndDateEvent>(_onBorrowChangedEndDateEvent);
    on<BorrowChangedObjectiveEvent>(_onBorrowChangedObjectiveEvent);
    on<BorrowConfirmEvent>(_onBorrowConfirmEvent);
  }



  void _onBorrowConfirmEvent(BorrowConfirmEvent event, Emitter<MachineryBorrowState> emit) async {

    bool validation = state.startDate != null && state.endDate != null && state.objective != null;
    final context = event.context;
    if (validation) {
      // emit(state.copyWith(isLoading: false));
      try {
        emit(state.copyWith(isLoading: true));
        final response = await _machineryRepository.createBorrowMachinery(
                machineryId: event.machineryId.toString(),
                objectiveId: state.objective!.objectiveId.toString(),
                startDate: state.startDate!.toString().split(' ')[0],
                endDate: state.endDate!.toString().split(' ')[0],
                numberOfFields: state.numberFields.text,
                description: state.description.text,
              );
        print('response: $response');
        if (response['result']) {

                emit(state.copyWith(isLoading: false));
                CustomDialog.showCustomDialog(
                  context: context,
                  title: '',
                  description: response['message'],
                  icon: Image.asset(ImageProviders.success),
                  onPressed: () {
                    Get.back();
                    Get.back();
                    add(BorrowInitialEvent());
                  },
                );
              } else {
                CustomToast.show(response['message']);
                emit(state.copyWith(isLoading: false));
              }
      } catch (e) {
        print(e);
      }
    } else {
      // emit(state.copyWith(isLoading: false));
      CustomToast.show('กรุณากรอกข้อมูลให้ครบถ้วน');
    }
  }

  void _onBorrowChangedObjectiveEvent(
      BorrowChangedObjectiveEvent event, Emitter<MachineryBorrowState> emit) {
    emit(state.copyWith(objective: event.objective));
  }

  void _onBorrowChangedEndDateEvent(
      BorrowChangedEndDateEvent event, Emitter<MachineryBorrowState> emit) {
    emit(state.copyWith(endDate: event.endDate));
  }

  void _onBorrowChangedStartDateEvent(
      BorrowChangedStartDateEvent event, Emitter<MachineryBorrowState> emit) {
    emit(state.copyWith(startDate: event.startDate));
  }

  void _onBorrowInitialEvent(BorrowInitialEvent event, Emitter<MachineryBorrowState> emit) {
    state.description.clear();
    state.numberFields.clear();
    state.startDate = null;
    state.endDate = null;
    state.objective = null;
    emit(state.copyWith(
      isLoading: false,
      startDate: state.startDate,
      endDate: state.endDate,
      objective: state.objective,
      description: TextEditingController(),
      numberFields: TextEditingController(),
    ));
  }
}
