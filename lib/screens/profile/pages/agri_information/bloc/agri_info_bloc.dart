import 'package:agri/screens/profile/pages/agri_information/models/rice_field_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_1_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/staff_info_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../models/section_1_data_model.dart';
import '../models/staff_info_model.dart';
import '../repositories/agri_info_repository.dart';

part 'agri_info_event.dart';

part 'agri_info_state.dart';

class AgriInfoBloc extends Bloc<AgriInfoEvent, AgriInfoState> {

  final AgriInfoRepository repository = AgriInfoRepository();

  AgriInfoBloc()
      : super(AgriInfoState(

        )) {
    on<InitialEvent>(_initialEvent);
    on<AddInterviewDataEvent>(_addInterviewDataEvent);
    on<AddSection1DataEvent>(_addSection1DataEvent);
    on<SelectedRiceFieldEvent>(_selectedRiceFieldEvent);
  }

  void _initialEvent(InitialEvent event, Emitter<AgriInfoState> emit) async  {
    try {
      final response = await repository.getStaffInfo();
      print(response.toJson());
      List<Interviewer> staffList = response.data!.interviewers;
      emit(state.copyWith(
        interviewers: staffList,
      ));
    } catch (e,t) {
      print(e);
      print(t);
    }
  }

  void _selectedRiceFieldEvent(SelectedRiceFieldEvent event, Emitter<AgriInfoState> emit) {
    try {
      emit(state.copyWith(selectedRiceField: event.riceField));
    } catch (e,t) {
      print(e);
      print(t);
    }
  }

  void _addSection1DataEvent(AddSection1DataEvent event, Emitter<AgriInfoState> emit) {
    List<bool> statusPending = List.from(state.statusPending);
    statusPending[1] = true;
    try {
      emit(state.copyWith(
            section1Data: event.section1,
            isSection1Pending: true,
            statusPending:statusPending,
          ));
    } catch (e,t) {
      print(e);
      print(t);
    }
  }

  void _addInterviewDataEvent(AddInterviewDataEvent event, Emitter<AgriInfoState> emit) {
    List<bool> statusPending = List.from(state.statusPending);
    statusPending[0] = true;
    emit(state.copyWith(
      statusPending: statusPending,
      staffData: StaffInfoDataModel(
        selectedStaff: event.selectedStaff,
        staffName: event.staffName,
        staffAddress: event.staffAddress,
        staffTambon: event.staffTambon,
        staffAmphur: event.staffAmphur,
        staffProvince: event.staffProvince,
        staffZipcode: event.staffZipcode,
        staffPhone: event.staffPhone,
        interviewDate: event.interviewDate,
      ),
      isStaffPending: true,
    ));
  }
}
