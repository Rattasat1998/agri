import 'dart:convert';

import 'package:agri/screens/profile/pages/agri_information/models/local_ifo_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/rice_field_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_1_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_2_data_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_2_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/section_3_model.dart';
import 'package:agri/screens/profile/pages/agri_information/models/staff_info_data_model.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/section_1_data_model.dart';
import '../models/staff_info_model.dart';
import '../repositories/agri_info_repository.dart';

part 'agri_info_event.dart';

part 'agri_info_state.dart';

class AgriInfoBloc extends Bloc<AgriInfoEvent, AgriInfoState> {
  final AgriInfoRepository repository = AgriInfoRepository();

  AgriInfoBloc() : super(AgriInfoState()) {
    on<InitialEvent>(_initialEvent);
    on<AddInterviewDataEvent>(_addInterviewDataEvent);
    on<AddSection1DataEvent>(_addSection1DataEvent);
    on<SelectedRiceFieldEvent>(_selectedRiceFieldEvent);
  }

  void _initialEvent(InitialEvent event, Emitter<AgriInfoState> emit) async {
    try {
      final response = await repository.getStaffInfo();

      List<Interviewer> staffList = response.data!.interviewers;
      emit(state.copyWith(interviewers: staffList));



      final userId = await LocalStorage.getToken();
      List<LocalInfoModel> localInfoList = await getLocalInfoList() ?? [];
      List<bool> statusPending = List.from(state.statusPending);
      bool isLocalInfo = localInfoList.where((element) => element.userId == userId).isNotEmpty;
        if(isLocalInfo){
          state.selectedRiceField = null;
          RiceFieldModel.riceFields.clear();
          Section2DataModel.datas.clear();
          Section3Model.data3.clear();
        LocalInfoModel localInfo = localInfoList.firstWhere((element) => element.userId == userId);
        state.staffData = localInfo.interviewers;
        statusPending[0] = true;
        state.selectedPoint1 = localInfo.selectedPoint1;
        state.selectedPoint2 = localInfo.selectedPoint2;
        state.selectedPoint3 = localInfo.selectedPoint3;
        state.selectedPoint4 = localInfo.selectedPoint4;
        state.selectedPoint5 = localInfo.selectedPoint5;

        Section1Point1.section1Point1 = localInfo.selectedPoint1;
        Section1Point1.section1Point2 = localInfo.selectedPoint2;
        Section1Point1.section1Point3 = localInfo.selectedPoint3;
        Section1Point1.section1Point4 = localInfo.selectedPoint4;
        Section1Point1.section1Point5 = localInfo.selectedPoint5;
        Section1Point1.section1PointAdOn1 = localInfo.selectedPointAdOn1;
        Section1Point1.section1PointAdOn2 = localInfo.selectedPointAdOn2;
        Section1Point1.section1PointAdOn3 = localInfo.selectedPointAdOn3;
        Section1Point1.section1PointAdOn4 = localInfo.selectedPointAdOn4;
        Section1Point1.section1PointAdOn5 = localInfo.selectedPointAdOn5;
        Section1Point1.section1PointAdOn6 = localInfo.selectedPointAdOn6;
        Section1Point1.section1PointAdOn7 = localInfo.selectedPointAdOn7;
        Section1Point1.section1PointAdOn8 = localInfo.selectedPointAdOn8;
        Section1Point1.section1PointAdOn9 = localInfo.selectedPointAdOn9;
        /*Section2DataModel.datas.clear();
        RiceFieldModel.riceFields.clear();*/

        RiceFieldModel.riceFields.addAll(localInfo.selectedPoint5.wasListModel.map((e) => RiceFieldModel(
          riceFieldArea: double.parse(e.landZCount ?? ''),
          riceFieldName: e.landName ?? '',
          riceFieldNumber: RiceFieldModel.riceFields.length + 1,
        )).toList());




        statusPending[1] = true;

        print('localInfo.selectedPoint2Map: ${localInfo.selectedPoint2Map.length}');

        statusPending[2] = true;

        print('localInfo.data3: ${localInfo.data3.length}');
        //print('localInfo.data3: ${localInfo.data3.map((e) => e.toJson())}');
          Section2DataModel.datas.addAll(localInfo.selectedPoint2Map);
          Section3Model.data3.addAll(localInfo.data3);
          Section3Model.part4[0].text = localInfo.data3StringList[0];
          Section3Model.part4[1].text = localInfo.data3StringList[1];
          Section3Model.part4[2].text = localInfo.data3StringList[2];
        statusPending[3] = true;




        }


      emit(state.copyWith(interviewers: staffList, statusPending: statusPending));
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  void _selectedRiceFieldEvent(SelectedRiceFieldEvent event, Emitter<AgriInfoState> emit) {
    try {
      emit(state.copyWith(selectedRiceField: event.riceField));
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  Future<void> saveLocalInfoList(List<LocalInfoModel> models) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert the list of models to a list of JSON strings
    List<String> jsonList = models.map((model) => jsonEncode(model.toJson())).toList();

    // Save the list of JSON strings
    await prefs.setStringList('localInfoList', jsonList);
    print('saveLocalInfoList');
  }

  Future<List<LocalInfoModel>?> getLocalInfoList() async {

    print('getLocalInfoList');

    final prefs = await SharedPreferences.getInstance();

    // Retrieve the list of JSON strings
    List<String>? jsonList = prefs.getStringList('localInfoList');
    if (jsonList == null) return null;

    // Convert each JSON string back into a LocalInfoModel object
    return jsonList.map((jsonString) => LocalInfoModel.fromJson(jsonDecode(jsonString))).toList();
  }

  void _addSection1DataEvent(AddSection1DataEvent event, Emitter<AgriInfoState> emit) async {
    List<bool> statusPending = List.from(state.statusPending);
    statusPending[1] = true;
    try {
      emit(state.copyWith(
        section1Data: event.section1,
        isSection1Pending: true,
        statusPending: statusPending,
      ));

    } catch (e, t) {
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
