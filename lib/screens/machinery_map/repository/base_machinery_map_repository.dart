import 'package:agri/screens/machinery_map/models/machinery_map_model.dart';

abstract class BaseMachineryMapRepository {
  Future<MachineryMapModel> getMachineryMap();
}