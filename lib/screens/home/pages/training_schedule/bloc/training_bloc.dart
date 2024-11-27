import 'dart:async';

import 'package:agri/screens/home/pages/training_schedule/models/logo_model.dart';
import 'package:agri/screens/home/pages/training_schedule/models/training_model.dart';
import 'package:agri/screens/home/pages/training_schedule/repository/training_repository.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'training_event.dart';

part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  final TrainingRepository trainingRepository = TrainingRepository();

  TrainingBloc() : super(TrainingLoading()) {
    on<TrainingInitialEvent>(_onTrainingInitialEvent);
    on<GetTrainingByDateEvent>(_onGetTrainingByDateEvent);
    on<GetTrainingByIdEvent>(_onGetTrainingByIdEvent);
    on<RegisterTrainingEvent>(_onRegisterTrainingEvent);
    on<TrainingSelectedDateEvent>(_onTrainingSelectedDateEvent);
    on<TrainingSearchDateEvent>(_onTrainingSearchDateEvent);
    on<TrainingDeleteEvent>(_onTrainingDeleteEvent);
    on<TrainingGetLogoEvent>(_onTrainingGetLogoEvent);
    on<TrainingOnSelectedLogoEvent>(_onTrainingOnSelectedLogoEvent);
    on<ResetAddEditTrainingEvent>(_onResetAddEditTrainingEvent);
    on<TrainingDateChangeEvent>(_onTrainingDateChangeEvent);
    on<TrainingTimeChangeEvent>(_onTrainingTimeChangeEvent);
    on<TrainingSetValuesEvent>(_onTrainingSetValuesEvent);
    on<TrainingSubmitEvent>(_onTrainingSubmitEvent);
  }

  Future<void> _onTrainingSubmitEvent(TrainingSubmitEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    final context = event.context;
    final isEdit = event.isEdit;
    if (state is TrainingLoaded) {
      emit(state.copyWith(isLoading: true));
      try {
        EasyLoading.show(status: 'กำลังโหลด');
       await trainingRepository.addEditTraining(
          date: state.date.toString().split(' ')[0],
          time: DateFormat('HH:mm').format(state.time??DateTime.now()),
          logoId: state.selectedLogo?.imgId.toString() ?? '',
          title: state.trainingNameController.text,
          detail: state.trainingDetailController.text,
          isEdit: event.isEdit,
          trainingId: event.trainingId,
        );

       if (isEdit) {
         EasyLoading.dismiss();
         CustomDialog.showCustomDialog(
           context: context,
           title: '',
           description: 'แก้ไขข้อมูลการอบรมเรียบร้อยแล้ว',
           icon: Image.asset(
             ImageProviders.success,
             height: 100,
             width: 100,
           ),
           onPressed: () {
             Get.back();
             Get.back();
             Get.back();
             context.read<TrainingBloc>().add(TrainingInitialEvent());
           },
         );
        } else {
         EasyLoading.dismiss();
         CustomDialog.showCustomDialog(
           context: context,
           title: '',
           description: 'ได้เพิ่มข่าวสารเรียบร้อยแล้ว',
           icon: const Icon(
             Icons.check_circle,
             color: Colors.green,
             size: 100,
           ),
           onPressed: () {
             Get.back();
             Get.back();
             context.read<TrainingBloc>().add(TrainingInitialEvent());
             // context.read<TrainingBloc>().add(NewsInitialEvent());
           },
         );
       }

        emit(state.copyWith(isLoading: false));
      } catch (e,t) {
        print(e);
        print(t);
      }
    }
  }

  Future<void> _onTrainingSetValuesEvent(TrainingSetValuesEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    final Train trainingModel = event.trainingModel;
    if (state is TrainingLoaded) {
      emit(state.copyWith(
        trainingNameController: TextEditingController(text: trainingModel.trainName),
        trainingDetailController: TextEditingController(text: trainingModel.address),
        date: trainingModel.trainDate,
        time: DateFormat('HH:mm').parse(trainingModel.trainTime!),
        selectedLogo: state.logo?.data?.logoLists.firstWhere((element) => element.imgId == trainingModel.imgId),
        trainingId: trainingModel.trainId.toString(),
      ));
    }
  }

  Future<void> _onTrainingTimeChangeEvent(TrainingTimeChangeEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      emit(state.copyWith(time: event.time));
    }
  }

  Future<void> _onTrainingDateChangeEvent(TrainingDateChangeEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      emit(state.copyWith(date: event.date));
    }
  }

  Future<void> _onResetAddEditTrainingEvent(ResetAddEditTrainingEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      state.selectedLogo = null;
      state.trainingNameController.clear();
      state.trainingDetailController.clear();
      state.date = null;
      state.time = null;
      state.trainingId = null;
      emit(state.copyWith(
        selectedLogo: state.selectedLogo,
        trainingNameController: state.trainingNameController,
        trainingDetailController: state.trainingDetailController,
        date: state.date,
        time: state.time,
        trainingId: state.trainingId,
      ));
    }
  }

  Future<void> _onTrainingOnSelectedLogoEvent(TrainingOnSelectedLogoEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      emit(state.copyWith(selectedLogo: event.logo));
    }
  }

  Future<void> _onTrainingGetLogoEvent(TrainingGetLogoEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      emit(state.copyWith(isLoadEdit: true));
      final logo = await trainingRepository.getLogos();
      emit(state.copyWith(logo: logo, isLoadEdit: false));
    }
  }

  Future<void> _onTrainingInitialEvent(TrainingInitialEvent event,
      Emitter<TrainingState> emit) async {
    emit(TrainingLoading());
    final trainingModel =
    await trainingRepository.getTrainingByDate(date: DateTime.now().toString().split(' ')[0]);
    emit(TrainingLoaded(
      trainingModel: trainingModel,
      isTrainingLoading: false,
      selectedDate: DateTime.now(),
      date: null,
      time: null,
      selectedLogo: null,
      trainingId: null,
      trainingNameController: TextEditingController(),
      trainingDetailController: TextEditingController(),
    ));
    add(TrainingGetLogoEvent());
  }

  Future<void> _onTrainingSelectedDateEvent(TrainingSelectedDateEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      emit(state.copyWith(selectedDate: event.date));
    }
  }

  Future<void> _onTrainingSearchDateEvent(TrainingSearchDateEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    emit(TrainingLoading());
    if (state is TrainingLoaded) {
      final trainingModel = await trainingRepository.getTrainingByDate(
          date: state.selectedDate.toString().split(' ')[0]);
      emit(TrainingLoaded(
        trainingModel: trainingModel,
        isTrainingLoading: false,
        selectedDate: state.selectedDate,
        date: state.date,
        time: state.time,
        trainingNameController: state.trainingNameController,
        trainingDetailController: state.trainingDetailController,
      ));
    }
  }

  Future<void> _onGetTrainingByDateEvent(GetTrainingByDateEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      emit(state.copyWith(isTrainingLoading: true));
      final trainingModel = await trainingRepository.getTrainingByDate(date: event.date);
      emit(state.copyWith(
          trainingModel: trainingModel,
          isTrainingLoading: false,
          selectedDate: state.selectedDate));
    }
  }

  Future<void> _onGetTrainingByIdEvent(GetTrainingByIdEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      emit(state.copyWith(isTrainingLoading: true,trainingId: event.id));
      final trainingDetailModel = await trainingRepository.getTrainingById(id: event.id);
      emit(state.copyWith(trainingDetailModel: trainingDetailModel, isTrainingLoading: false, trainingId: event.id));
    }
  }

  Future<void> _onRegisterTrainingEvent(RegisterTrainingEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    final context = event.context;
    if (state is TrainingLoaded) {
      try {
        emit(state.copyWith(isRegisterLoading: true));
        await trainingRepository.registerTraining(id: event.id);
        final trainingDetailModel = await trainingRepository.getTrainingById(id: event.id);
        emit(state.copyWith(trainingDetailModel: trainingDetailModel, isRegisterLoading: false));
        if (!state.isRegisterLoading) {
          CustomDialog.showCustomDialog(
              context: context,
              title: '',
              description: 'ลงชื่อเข้าร่วมการอบรมเรียบร้อยแล้ว',
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                ImageProviders.success,
                height: 100,
                width: 100,
              ));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _onTrainingDeleteEvent(TrainingDeleteEvent event,
      Emitter<TrainingState> emit) async {
    final state = this.state;
    if (state is TrainingLoaded) {
      try {
        emit(state.copyWith(isLoading: true));
        await trainingRepository.deleteTrainingById(id: event.id);
        emit(state.copyWith(isLoading: false));
        add(TrainingInitialEvent());
      } catch (e) {
        print(e);
      }
    }
  }
}
