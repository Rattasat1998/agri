import 'package:agri/screens/home/pages/training_schedule/models/logo_model.dart';

abstract class BaseTrainingRepository {
  Future getTrainingByDate({required String date});
  Future getTrainingById({required String id});
  Future registerTraining({required String id});
  Future deleteTrainingById({required String id});
  Future getUserRegisterTrainingById({required String id});
  Future<LogoModel> getLogos() async {
    throw UnimplementedError();
  }

  Future addEditTraining({
    required String date,
    required String time,
    required String logoId,
    required String title,
    required String detail,
     String? trainingId,
    required bool isEdit,
  }) async {
    throw UnimplementedError();
  }
}