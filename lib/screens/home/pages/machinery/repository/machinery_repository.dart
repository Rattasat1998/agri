import 'dart:convert';

import 'package:agri/screens/home/pages/machinery/models/machinery_detail_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_info_model.dart';
import 'package:agri/screens/home/pages/machinery/models/machinery_model.dart';
import 'package:agri/screens/home/pages/machinery/models/objectives_model.dart';
import 'package:agri/screens/home/pages/machinery/repository/base_machinery_repository.dart';
import 'package:agri/utils/api_end_point.dart';
import 'package:agri/utils/local_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MachineryRepository implements BaseMachineryRepository {
  final String baseUrl = dotenv.env['BASE_URL']!;

  @override
  Future createBorrowMachinery({
    required String machineryId,
    required String objectiveId,
    required String startDate,
    required String endDate,
    required String numberOfFields,
    required String description,
  })async {
    final token = await LocalStorage.getToken();
    try {
      var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
      var request = http.Request('POST', Uri.parse(baseUrl + ApiEndPoint.createBorrowMachinery));

      request.bodyFields = {
            'machine_id': machineryId,
            'objective_id': objectiveId,
            'start_date': startDate,
            'end_date': endDate,
            'number_fields': numberOfFields,
            'description': description,
          };
      request.headers.addAll(headers);

      print(jsonEncode(request.bodyFields));
      print(request.url);
      print(request.headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 201) {

            return jsonDecode(await response.stream.bytesToString());
          }
          else {
          print(response.reasonPhrase);
          }
    } catch (e,t) {
      print(e);
      print(t);
    }
  }

  @override
  Future<MachineryDetailModel> getMachineryById({required String machineryId}) async {
    try {
      final token = await LocalStorage.getToken();
      var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getMachineryById.replaceAll('{id}', machineryId)));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
            final json = jsonDecode(await response.stream.bytesToString());
            return MachineryDetailModel.fromJson(json);
          }
          else {
          print(response.reasonPhrase);
          throw Exception('Failed to load data');
          }
    } catch (e,t) {
      print(e);
      print(t);
      rethrow;
    }

  }

  @override
  Future getMachineryHistoryListByPageId({
    required String machineryId,
    required String page,
  }) {
    // TODO: implement getMachineryHistoryListByPageId
    throw UnimplementedError();
  }

  @override
  Future<MachineryInfoModel> getMachineryInformationById({required String machineryId}) async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getMachineryInformationById.replaceAll('{id}', machineryId)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return MachineryInfoModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<MachineryModel> getMachineryList() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getMachineryList));
    print(baseUrl + ApiEndPoint.getMachineryList);
    print(token);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return MachineryModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data');
    }
  }

  @override
  Future getMachineryWorkCalendarList() {
    // TODO: implement getMachineryWorkCalendarList
    throw UnimplementedError();
  }

  @override
  Future<ObjectivesModel> getObjectiveList() async {
    final token = await LocalStorage.getToken();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    var request = http.Request('GET', Uri.parse(baseUrl + ApiEndPoint.getObjectivesList));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final json = jsonDecode(await response.stream.bytesToString());
      return ObjectivesModel.fromJson(json);
    }
    else {
      print(response.reasonPhrase);
      throw Exception('Failed to load data');
    }

  }
}
