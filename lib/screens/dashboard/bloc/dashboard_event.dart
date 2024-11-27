part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {
  final String apiEndPoint;

  DashboardInitialEvent({required this.apiEndPoint});
}
