part of 'request_history_bloc.dart';

 class RequestHistoryState {
   final List<String> tabList;
   List<RequestList> requestList;
    final int currentTab;
   final bool isTabLoading;
   final int currentPage;

    RequestHistoryState({
      this.tabList = const ['ประวัติคำขอยืมในกลุ่ม', 'ประวัติคำขอยืมภายภายนอก'],
      this.currentTab = 0,
      this.requestList = const [],
      this.isTabLoading = false,
      this.currentPage = 1,
    });


    RequestHistoryState copyWith({
      int? currentTab,
      List<RequestList>? requestList,
      bool? isTabLoading,
      int? currentPage,
    }) {
      return RequestHistoryState(
        currentTab: currentTab ?? this.currentTab,
        requestList: requestList ?? this.requestList,
        isTabLoading: isTabLoading ?? this.isTabLoading,
        currentPage: currentPage ?? this.currentPage,
      );
    }

 }

