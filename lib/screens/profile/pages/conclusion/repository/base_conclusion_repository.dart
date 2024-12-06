import 'package:agri/screens/profile/pages/conclusion/models/family_info_model.dart';
import 'package:agri/screens/profile/pages/conclusion/models/system_rice_info_model.dart';

abstract class BaseConclusionRepository {
  Future<FamilyInfoModel> getInfoIntroduction();
  Future<SystemRiceInfoModel> getInfoConclusion();
}