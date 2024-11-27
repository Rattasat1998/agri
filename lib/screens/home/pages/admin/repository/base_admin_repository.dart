import 'package:agri/screens/home/pages/admin/models/admin_model.dart';

abstract class BaseAdminRepository {
  Future<AdminModel> getAdminList() async {
    throw UnimplementedError();
  }
}