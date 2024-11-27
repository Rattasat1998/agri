import 'package:agri/screens/home/pages/statistics/models/statistics_history_borrow_detail_model.dart';
import 'package:agri/screens/home/pages/statistics/models/statistics_history_group_model.dart';
import 'package:agri/screens/home/pages/statistics/models/statistics_model.dart';
import 'package:agri/screens/home/pages/statistics/repository/statistics_repository.dart';
import 'package:agri/screens/request_machine/repository/request_machine_repository.dart';
import 'package:agri/utils/image_provider.dart';
import 'package:agri/widgets/custom_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

part 'statistics_event.dart';

part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final StatisticsRepository _statisticsRepository = StatisticsRepository();

  StatisticsBloc() : super(StatisticsLoading()) {
    on<StatisticsInitialEvent>(_onStatisticsInitialEvent);
    on<StatisticsGetInGroupEvent>(_onStatisticsGetInGroupEvent);
    on<StatisticsGetOutGroupEvent>(_onStatisticsGetOutGroupEvent);
    on<StatisticsGetBorrowDetailByIdEvent>(_onStatisticsGetBorrowDetailByIdEvent);
    on<StatisticsChangedTapEvent>(_onStatisticsChangedTapEvent);
    on<StatisticsHistoryLoadMoreEvent>(_onStatisticsHistoryLoadMoreEvent);
    on<ReceiveMachineryEvent>(_onReceiveMachineryEvent);
    on<ReturnMachineryEvent>(_onReturnMachineryEvent);
  }

  void _onReturnMachineryEvent(
      ReturnMachineryEvent event, Emitter<StatisticsState> emit) async {
    final state = this.state;
    final context = event.context;
    final isFromNotification = event.isFromNotification;
    final double rating = event.rating;
    if (state is StatisticsLoaded) {
      try {
        EasyLoading.show(status: 'กำลังโหลด');
        final response = await _statisticsRepository.returnMachinery(id: event.id,rating: rating);
        if (response['result'] == true) {
          emit(state.copyWith(isLoading: true));
          final historyInGroup = await _statisticsRepository.getHistoryInGroup(pageNumber: 1);
          emit(state.copyWith(historyGroup: historyInGroup.data!.news, isLoading: false));
          EasyLoading.dismiss();
          CustomDialog.showCustomDialog(
            context: context,
            title: '',
            description: response['message'],
            icon: Image.asset(ImageProviders.success),
            onPressed: () {
              if(isFromNotification){
                Navigator.of(context,rootNavigator: true).pop();
                Navigator.of(context,rootNavigator: true).pop();
              } else {
                Navigator.of(context,rootNavigator: true).pop();
                Navigator.of(context,rootNavigator: true).pop();
                Navigator.of(context,rootNavigator: true).pop();
              }
              // add(RequestMachineInitialEvent());
            },
          );
        }
      } catch (e) {
        throw Exception('Failed to return machinery');
      }
    }
  }

  void _onReceiveMachineryEvent(
      ReceiveMachineryEvent event, Emitter<StatisticsState> emit) async {
    final state = this.state;
    final context = event.context;
    final isFromNotification = event.isFromNotification;
    if (state is StatisticsLoaded) {
      try {
        EasyLoading.show(status: 'กำลังโหลด');
        final response = await _statisticsRepository.receiveMachinery(id: event.id);
        if (response['result'] == true) {
          emit(state.copyWith(isLoading: true));
          final historyInGroup = await _statisticsRepository.getHistoryInGroup(pageNumber: 1);
          emit(state.copyWith(historyGroup: historyInGroup.data!.news, isLoading: false));
          EasyLoading.dismiss();
          CustomDialog.showCustomDialog(
            context: context,
            title: '',
            description: response['message'],
            icon: Image.asset(ImageProviders.success),
            onPressed: () {
              if(isFromNotification){
                Navigator.of(context,rootNavigator: true).pop();
                Navigator.of(context,rootNavigator: true).pop();
              } else {
                Navigator.of(context,rootNavigator: true).pop();
                Navigator.of(context,rootNavigator: true).pop();
                Navigator.of(context,rootNavigator: true).pop();
              }

              // add(RequestMachineInitialEvent());
            },
          );
        }
      } catch (e) {
        throw Exception('Failed to receive machinery');
      }
    }
  }


  void _onStatisticsHistoryLoadMoreEvent(
      StatisticsHistoryLoadMoreEvent event, Emitter<StatisticsState> emit) async {
    final state = this.state;
    if (state is StatisticsLoaded) {
      if (state.currentTab == 0) {
        try {
          List<StatisticsHistoryGroupModelDataNews> news = List.from(state.historyGroup!);
          final group = await _statisticsRepository.getHistoryInGroup(
              pageNumber: state.currentPage + 1);
          if (group.data!.news.isNotEmpty) {
            news.addAll(group.data!.news);
            emit(state.copyWith(
                historyGroup: news, isLoading: false, currentPage: state.currentPage + 1));
            return;
          } else {
            emit(state.copyWith(isLoading: false, currentPage: state.currentPage));
          }
        } catch (e) {
          throw Exception('Failed to load history in group');
        }
      } else {
        try {
          List<StatisticsHistoryGroupModelDataNews> news = List.from(state.historyGroup!);
          final group = await _statisticsRepository.getHistoryOutGroup(
              pageNumber: state.currentPage + 1);
          if (group.data!.news.isNotEmpty) {
            news.addAll(group.data!.news);
            emit(state.copyWith(
                historyGroup: news, isLoading: false, currentPage: state.currentPage + 1));
            return;
          } else {
            emit(state.copyWith(isLoading: false, currentPage: state.currentPage));
          }
        } catch (e) {
          throw Exception('Failed to load history out group');
        }
      }
    }
  }
  void _onStatisticsChangedTapEvent(
      StatisticsChangedTapEvent event, Emitter<StatisticsState> emit) async {
    final state = this.state;
    if (state is StatisticsLoaded) {
      StatisticsHistoryGroupModel? historyInGroup;
      print(event.currentTab);
      state.currentTab = event.currentTab;
      emit(state.copyWith(currentTab: event.currentTab));
      if (event.currentTab == 0) {
        try {
          emit(state.copyWith(isLoading: true));
          historyInGroup = await _statisticsRepository.getHistoryInGroup(pageNumber: 1);
          emit(state.copyWith(historyGroup: historyInGroup.data!.news, isLoading: false, currentTab: event.currentTab));
        } catch (e) {
          throw Exception('Failed to load history in group');
        }
      } else {
        try {
          emit(state.copyWith(isLoading: true));
          historyInGroup = await _statisticsRepository.getHistoryOutGroup(pageNumber: 1);
          emit(state.copyWith(historyGroup: historyInGroup.data!.news, isLoading: false, currentTab: event.currentTab));
        } catch (e) {
          throw Exception('Failed to load history out group');
        }
      }
    }
  }

  void _onStatisticsGetBorrowDetailByIdEvent(
      StatisticsGetBorrowDetailByIdEvent event, Emitter<StatisticsState> emit) async {
    final state = this.state;
    if (state is StatisticsLoaded) {
      try {
          emit(state.copyWith(isDetailLoading: true));
          final borrowDetail = await _statisticsRepository.getBorrowDetailById(id: event.id);
          emit(state.copyWith(borrowDetail: borrowDetail, isDetailLoading: false));



        /*context.read<MachineryBloc>().add(
          MachineryGetMachineryByIdEvent(
            id: item.machineId.toString(),
          ),
        );*/
      } catch (e) {
        throw Exception('Failed to load borrow detail');
      }
    }
  }

  void _onStatisticsGetOutGroupEvent(
      StatisticsGetOutGroupEvent event, Emitter<StatisticsState> emit) async {
    try {
      emit(StatisticsLoading());
      final historyOutGroup = await _statisticsRepository.getHistoryOutGroup(pageNumber: 1);
      // emit(StatisticsHistoryOutGroupLoaded(historyOutGroup: historyOutGroup));
    } catch (e) {
      throw Exception('Failed to load history out group');
    }
  }

  void _onStatisticsGetInGroupEvent(
    StatisticsGetInGroupEvent event,
    Emitter<StatisticsState> emit,
  ) async {
    final state = this.state;
    if (state is StatisticsLoaded) {
      try {
        emit(state.copyWith(isLoading: true));
        StatisticsHistoryGroupModel historyInGroup = await _statisticsRepository.getHistoryInGroup(pageNumber: event.pageNumber);
        emit(state.copyWith(historyGroup: historyInGroup.data!.news, isLoading: false, currentTab: 0, currentPage: 1));
      } catch (e) {
        throw Exception('Failed to load history in group');
      }
    }
  }

  void _onStatisticsInitialEvent(
      StatisticsInitialEvent event, Emitter<StatisticsState> emit) async {
    try {
      emit(StatisticsLoading());
      final statisticsModel = await _statisticsRepository.getStatistics();
      emit(StatisticsLoaded(statisticsModel: statisticsModel));
    } catch (e) {
      throw Exception('Failed to load statistics');
    }
  }
}
