part of 'request_machine_bloc.dart';

@immutable
sealed class RequestMachineState {}

final class RequestMachineLoading extends RequestMachineState {}

final class RequestMachineLoaded extends RequestMachineState {
   List<RequestList> requestList;
   bool isDetailLoading;
   final DetailApproval? approveRequestDetailModel;
    int currentTab;
   final bool isTabLoading;
   final List<String> tabList;

  RequestMachineLoaded({
    this.requestList = const [],
    this.isDetailLoading = false,
    this.isTabLoading = false,
    this.approveRequestDetailModel,
    this.currentTab = 0,
    this.tabList = const ['คำขอยืมภายในกลุุ่ม', 'คำขอยืมภายนอกกลุ่ม'],
  });

  RequestMachineLoaded copyWith({
    List<RequestList>? requestList,
    bool? isDetailLoading,
    DetailApproval? approveRequestDetailModel,
    int? currentTab,
    bool? isTabLoading,
  }) {
    return RequestMachineLoaded(
      requestList: requestList ?? this.requestList,
      isDetailLoading: isDetailLoading ?? this.isDetailLoading,
      approveRequestDetailModel: approveRequestDetailModel ?? this.approveRequestDetailModel,
      currentTab: currentTab ?? this.currentTab,
      isTabLoading: isTabLoading ?? this.isTabLoading,
    );
  }

}
