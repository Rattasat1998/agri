import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_type_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_member_model.dart';

abstract class BaseAgriculturalRepository {
  Future getAgriculturalInformation();

  Future getAgriculturalAddress();

  Future getAgriculturalMember();

  Future getAgriculturalMachine();

  Future getHeadAgriculturalAddress();

  Future getAgriculturalMachineByGroupId({required String id});

  Future getAgriculturalMemberByGroupId({required String id});

  Future getAgriculturalAddressByGroupId({required String id});

  Future getAgriculturalInformationByGroupId({required String id});

  Future downloadDataForAdmin({required String id});

  Future headUpdateGroupInformation({
    required String name,
    required String address,
    required String description,
    required String image,
    required String tel,
    required double lat,
    required double lng,
  });

  Future<GroupMemberModel> getHeadMember() async {
    throw UnimplementedError();
  }

  Future<GroupMachineModel> getHeadMachineryList() async {
    throw UnimplementedError();
  }

  Future<MachineTypeModel> getMachineTypeList() async {
    throw UnimplementedError();
  }

  Future addMachine({
    required String userId,
    required String machineName,
    required String machineTypeId,
    required String machineDescription,
    required String machineImage,
    required String lat,
    required String lng,
  });

  Future updateMachine({
    required String userId,
    required String machineId,
    required String machineName,
    required String machineTypeId,
    required String machineDescription,
    required String machineImage,
    required double lat,
    required double lng,
  });

  Future getMachineById({required String id});

  Future deleteMachineById({required String id});
}
