import 'package:agri/screens/home/pages/machinery/models/machinery_detail_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_info_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:agri/screens/home/pages/machinery/models/objectives_model.dart';
import 'package:agri/screens/home/pages/machinery/repository/machinery_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'machinery_event.dart';

part 'machinery_state.dart';

class MachineryBloc extends Bloc<MachineryEvent, MachineryState> {
  final MachineryRepository _machineryRepository = MachineryRepository();

  MachineryBloc() : super(MachineryLoading()) {
    on<MachineryInitialEvent>(_onMachineryInitialEvent);
    on<MachineryGetMachineryByIdEvent>(_onMachineryGetMachineryByIdEvent);
    on<MachineryGetObjectiveListEvent>(_onMachineryGetObjectiveListEvent);
    on<GetInformationEvent>(_onGetInformationEvent);

  }

  void _onGetInformationEvent(GetInformationEvent event, Emitter<MachineryState> emit) async {
    final state = this.state;
    if (state is MachineryLoaded) {
      emit(state.copyWith(isDetailLoading: true));
      final machinery = await _machineryRepository.getMachineryInformationById(machineryId: event.machineryId);
      emit(state.copyWith( machineryInfoModel: machinery, isDetailLoading: false));

    }
  }

  void _onMachineryGetObjectiveListEvent(
      MachineryGetObjectiveListEvent event, Emitter<MachineryState> emit) async {
    final state = this.state;
    if (state is MachineryLoaded) {
      final objectiveList = await _machineryRepository.getObjectiveList();
      emit(state.copyWith(objectiveList: objectiveList));
    }
  }

  void _onMachineryGetMachineryByIdEvent(
      MachineryGetMachineryByIdEvent event, Emitter<MachineryState> emit) async {
    final state = this.state;
    print(0);
    if (state is MachineryLoaded) {
      try {
        emit(state.copyWith(isDetailLoading: true));
        print(1);
        final machinery = await _machineryRepository.getMachineryById(machineryId: event.id);
        print(2);
        emit(state.copyWith(isDetailLoading: false, machineryDetailModel: machinery));
        add(GetInformationEvent(machineryId: event.id));
      } catch (e,t) {
        print(e);
        print(t);
      }
    }
  }

  void _onMachineryInitialEvent(MachineryInitialEvent event, Emitter<MachineryState> emit) async {
    try {
      emit(MachineryLoading());
      final machineryList = await _machineryRepository.getMachineryList();
      emit(MachineryLoaded(machineryModel: machineryList));
      add(MachineryGetObjectiveListEvent());
    } catch (e,t) {
      print(e);
      print(t);
    }
  }

  String findObjectiveNameById(int id, List<Objective> historyList) {
    print('id: $id');
    print('historyList: $historyList');
      final objective = historyList.firstWhere(
        (element) => element.objectiveId == id,
      );
      return objective.objectiveTitle ?? '';
  }
}
