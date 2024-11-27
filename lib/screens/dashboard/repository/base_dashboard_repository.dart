import 'package:agri/screens/dashboard/models/dashboard_model.dart';

abstract class BaseDashboardRepository {
  Future<DashboardModel> getDashboardData({required String apiEndPoint});
}