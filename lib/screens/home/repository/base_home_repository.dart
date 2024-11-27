import 'package:agri/models/home_model.dart';
import 'package:agri/screens/home/pages/training_schedule/models/logo_model.dart';

abstract class BaseHomeRepository {
  Future<HModel> getHomeData() async {
    throw UnimplementedError();
  }


}