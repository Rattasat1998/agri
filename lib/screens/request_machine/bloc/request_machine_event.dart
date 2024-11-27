part of 'request_machine_bloc.dart';

@immutable
sealed class RequestMachineEvent {}

final class RequestMachineInitialEvent extends RequestMachineEvent {}

final class RequestMachineApproveDetailInGroupEvent extends RequestMachineEvent {
  final String borrowId;
  final int currentTab;

  RequestMachineApproveDetailInGroupEvent(this.borrowId, this.currentTab);
}

final class RequestMachineChangedTabEvent extends RequestMachineEvent {
  final int tab;

  RequestMachineChangedTabEvent(this.tab);
}

final class RequestMachineApproveDetailOutGroupEvent extends RequestMachineEvent {
  final String borrowId;

  RequestMachineApproveDetailOutGroupEvent(this.borrowId);
}

final class RequestMachineApproveInGroupEvent extends RequestMachineEvent {
  final BuildContext context;
  final int borrowId;


  RequestMachineApproveInGroupEvent(this.borrowId, this.context);
}
final class RequestMachineRefuseInGroupEvent extends RequestMachineEvent {
  final BuildContext context;
  final int borrowId;

  RequestMachineRefuseInGroupEvent(this.borrowId, this.context);
}

final class RequestMachineApproveOutGroupEvent extends RequestMachineEvent {
  final int borrowId;

  RequestMachineApproveOutGroupEvent(this.borrowId);
}