import 'package:agri/screens/request_machine/models/approve_request_model.dart';
import 'package:agri/screens/request_machine/repository/request_machine_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'request_history_event.dart';

part 'request_history_state.dart';

class RequestHistoryBloc extends Bloc<RequestHistoryEvent, RequestHistoryState> {
  final RequestMachineRepository _requestMachineRepository = RequestMachineRepository();

  RequestHistoryBloc() : super(RequestHistoryState()) {
    on<RequestHistoryChangedTabEvent>(_onRequestHistoryChangedTabEvent);
    on<RequestHistoryRefreshEvent>(_onRequestHistoryRefreshEvent);
    on<RequestHistoryLoadMoreEvent>(_onRequestHistoryLoadMoreEvent);
  }

  Future<void> _onRequestHistoryLoadMoreEvent(
    RequestHistoryLoadMoreEvent event,
    Emitter<RequestHistoryState> emit,
  ) async {
    final ApproveRequestModel approveRequestModel;
    if (state.currentTab == 0) {
      approveRequestModel =
          await _requestMachineRepository.getRequestHistoryInGroupList(pageNumber: state.currentPage + 1);
    } else {
      approveRequestModel =
          await _requestMachineRepository.getRequestHistoryOutGroupList(pageNumber: state.currentPage + 1);
    }

    if (approveRequestModel.data!.requestList.isEmpty) {
      final requestList = approveRequestModel.data!.requestList;
      state.requestList.addAll(requestList);
      emit(state.copyWith(requestList: state.requestList, currentPage: state.currentPage));
      return;
    } else {
      final requestList = approveRequestModel.data!.requestList;
      state.requestList.addAll(requestList);
      emit(state.copyWith(requestList: state.requestList, currentPage: state.currentPage + 1));
    }


  }

  Future<void> _onRequestHistoryRefreshEvent(
    RequestHistoryRefreshEvent event,
    Emitter<RequestHistoryState> emit,
  ) async {
    state.requestList = [];
    final ApproveRequestModel approveRequestModel;
    if (state.currentTab == 0) {
      approveRequestModel =
          await _requestMachineRepository.getRequestHistoryInGroupList(pageNumber: 1);
    } else {
      approveRequestModel =
          await _requestMachineRepository.getRequestHistoryOutGroupList(pageNumber: 1);
    }
    final requestList = approveRequestModel.data!.requestList;
    state.requestList = requestList;
    emit(state.copyWith(requestList: state.requestList));
  }

  Future<void> _onRequestHistoryChangedTabEvent(
    RequestHistoryChangedTabEvent event,
    Emitter<RequestHistoryState> emit,
  ) async {
    state.requestList = [];
    final ApproveRequestModel approveRequestModel;
    emit(state.copyWith(currentTab: event.tab, isTabLoading: true));
    if (event.tab == 0) {
      approveRequestModel =
          await _requestMachineRepository.getRequestHistoryInGroupList(pageNumber: 1);
    } else {
      approveRequestModel =
          await _requestMachineRepository.getRequestHistoryOutGroupList(pageNumber: 1);
    }
    final requestList = approveRequestModel.data!.requestList;
    state.requestList = requestList;
    emit(
        state.copyWith(requestList: state.requestList, currentTab: event.tab, isTabLoading: false));
  }
}
