import 'package:agri/screens/home/pages/agricultural_information/head/models/group_head_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_address_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_download_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_information_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_detail_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_machine_type_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/models/group_member_model.dart';
import 'package:agri/screens/home/pages/agricultural_information/repository/base_agricultural_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgriculturalRepository implements BaseAgriculturalRepository {
  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future<GroupInformationModel> getAgriculturalInformation() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getGroupInformation));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupInformationModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupAddressModel> getAgriculturalAddress() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getGroupAddress));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupAddressModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupHeadAddressModel> getHeadAgriculturalAddress() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getHeadGroupAddress));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupHeadAddressModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      return GroupHeadAddressModel(result: false, message: 'Failed to load data!', data: null);
    }
  }

  @override
  Future<GroupMemberModel> getAgriculturalMember() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getGroupMember));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupMemberModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupMachineModel> getAgriculturalMachine() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getGroupMachine));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupMachineModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupAddressModel> getAgriculturalAddressByGroupId({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getGroupAddressAdmin.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupAddressModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupInformationModel> getAgriculturalInformationByGroupId({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getGroupInformationAdmin.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupInformationModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupMachineModel> getAgriculturalMachineByGroupId({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getGroupMachineAdmin.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupMachineModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupMemberModel> getAgriculturalMemberByGroupId({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.getGroupMemberAdmin.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupMemberModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }

  @override
  Future<GroupDownloadModel> downloadDataForAdmin({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse(baseUrl + ApiEndPoint.downloadDataForAdmin.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupDownloadModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to download data!');
    }
  }

  @override
  Future headUpdateGroupInformation({
    required String name,
    required String address,
    required String description,
    required String tel,
    String? image,
    required double lat,
    required double lng,
  }) async {
    try {
      final token = await LocalStorage.getToken();
      var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
      var request =
          http.MultipartRequest('POST', Uri.parse(baseUrl + ApiEndPoint.updateHeadGroupAddress));
      print(request.url);
      request.fields.addAll({
        'group_name': name,
        'group_address': address,
        'description': description,
        'group_tel': tel,
        'latitude': lat.toString(),
        'longitude': lng.toString(),
      });
      print(request.fields);
      if (image != '') {
        request.files.add(await http.MultipartFile.fromPath(
          'group_img',
          image ?? '',
        ));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final json = jsonDecode(await response.stream.bytesToString());
        return json;
      } else {
        print(response.statusCode);
        // throw Exception('Failed to update data!');
      }
    } catch (e, t) {
      print(e);
      print(t);
    }
  }

  @override
  Future<GroupMachineModel> getHeadMachineryList() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getHeadGroupMachine));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupMachineModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      return GroupMachineModel(result: false, message: 'Failed to load data!', data: null);
    }
  }

  @override
  Future<GroupMemberModel> getHeadMember() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getHeadGroupUsers));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return GroupMemberModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      return GroupMemberModel(result: false, message: 'Failed to load data!', data: null);
    }
  }

  @override
  Future<MachineTypeModel> getMachineTypeList() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getMachineTypes));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return MachineTypeModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      return MachineTypeModel(result: false, message: 'Failed to load data!', data: null);
    }
  }


  @override
  Future<MachineDetailModel> getMachineById({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request =
        http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getMachineById.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return MachineDetailModel.fromJson(json);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data!');
    }
  }


  @override
  Future addMachine({
    required String userId,
    required String machineName,
    required String machineTypeId,
    required String machineDescription,
    required String machineImage,
    required String lat,
    required String lng,
  }) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + ApiEndPoint.addMachine));
      request.fields.addAll({
        'user_id': userId,
        'type_id': machineTypeId,
        'machine_name': machineName,
        'description': machineDescription,
        'lat': lat,
        'lng': lng,
      });
      request.files.add(await http.MultipartFile.fromPath('machine_img', machineImage));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        final json = jsonDecode(await response.stream.bytesToString());
        return json;
      } else {
        throw Exception('Failed to add machine!');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to add machine!');
    }
  }

  @override
  Future updateMachine({
    required String userId,
    required String  machineId,
    required String machineName,
    required String machineTypeId,
    required String machineDescription,
    required String machineImage,
    required double lat,
    required double lng,
  }) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};

    try {



      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + ApiEndPoint.updateMachineById.replaceAll('{id}', machineId)));
      request.fields.addAll({
        'user_id': userId,
        'type_id': machineTypeId,
        'machine_name': machineName,
        'description': machineDescription,
      });
      request.fields['lat'] = lat.toString();
      request.fields['lng'] = lng.toString();

      print(request.url);

      if(!machineImage.toString().contains('http')){
        request.files.add(await http.MultipartFile.fromPath('machine_img', machineImage));
      }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    final json = jsonDecode(await response.stream.bytesToString());
    print(json);
    return json;
    } else {
    print(response.reasonPhrase);
    final json = jsonDecode(await response.stream.bytesToString());
    print(json);
    }
    } catch (e,t) {
    print(e);
    print(t);
    throw Exception('Failed to add machine!');
    }
  }

  @override
  Future deleteMachineById({required String id}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request =
    http.Request('DELETE', Uri.parse(baseUrl + ApiEndPoint.deleteMachineById.replaceAll('{id}', id)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return json;
    }
    else {
      print(response.reasonPhrase);
    }
  }
}
