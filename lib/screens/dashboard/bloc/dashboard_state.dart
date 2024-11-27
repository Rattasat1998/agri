part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardLoading extends DashboardState {}
class DashboardLoaded extends DashboardState {
  final DashboardModel dashboardModel;

  DashboardLoaded({required this.dashboardModel});
}
