import 'dart:async';
import 'package:agri/screens/dashboard/models/dashboard_model.dart';
import 'package:agri/screens/dashboard/repository/dashboard_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashBoardRepository _dashboardRepository = DashBoardRepository();

  DashboardBloc() : super(DashboardLoading()) {
    on<DashboardInitialEvent>(_onDashboardInitialEvent);
  }

  void _onDashboardInitialEvent(DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    print(event.apiEndPoint);
    try {
      final DashboardModel dashboardModel = await _dashboardRepository.getDashboardData(
        apiEndPoint: event.apiEndPoint,
      );
      emit(DashboardLoaded(dashboardModel: dashboardModel));
    } catch (e) {
      // emit(DashboardError());
    }
  }
}
